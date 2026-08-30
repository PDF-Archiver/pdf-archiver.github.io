import Foundation
import Plot
import Publish

extension PDFArchiverWebsite {
    /// The FAQ answers are written one file per question, but they are only ever published together
    /// on `/faq` and `/de/faq`. These are the folders holding those source files.
    static var faqEntryFolders: Set<Path> { ["faq/", "de/faq/"] }
}

extension PublishingStep where Site == PDFArchiverWebsite {
    /// Zips `presskit/` into the output instead of versioning the archive, which would grow the
    /// repository by its full size on every asset change.
    static func buildPressKitArchive() -> Self {
        step(named: "Build the press kit archive") { context in
            let root = try context.folder(at: "")
            let destination = try context.outputFolder(at: "").path + "presskit.zip"

            let zip = Process()
            zip.executableURL = URL(fileURLWithPath: "/usr/bin/zip")
            // -X drops the resource forks and __MACOSX entries the Finder would add.
            zip.arguments = ["-r", "-q", "-X", destination, "presskit"]
            zip.currentDirectoryURL = URL(fileURLWithPath: root.path)

            try zip.run()
            zip.waitUntilExit()

            guard zip.terminationStatus == 0 else {
                throw PressKitError.zipFailed(status: zip.terminationStatus)
            }
        }
    }

    /// Markdown pages keep their file name, so `Content/de/index.md` would land on `/de/index`.
    static func moveGermanIndexPageToLanguageRoot() -> Self {
        step(named: "Move the German index page to /de") { context in
            try context.mutatePage(at: "de/index") { $0.path = "de" }
        }
    }

    /// Publish gives every FAQ entry its own page, which duplicates the answer already shown on
    /// `/faq` on a page nothing links to. The entries stay in the content, only the pages go.
    static func removeFAQEntryPages() -> Self {
        step(named: "Remove the per-entry FAQ pages") { context in
            for folder in PDFArchiverWebsite.faqEntryFolders {
                try context.outputFolder(at: Path(folder.string)).subfolders.forEach { try $0.delete() }
            }
        }
    }

    /// Publish's own site map lists neither home page and spells every URL without its trailing
    /// slash, so each entry names a redirect rather than the page it stands for.
    static func generateCanonicalSiteMap(excluding excludedPaths: Set<Path>) -> Self {
        step(named: "Generate the site map") { context in
            let locations: [any Location] = [context.index]
                + context.sections.map { $0 as any Location }
                + context.pages.values.map { $0 as any Location }

            let listed = locations
                .filter { location in
                    !excludedPaths.contains { location.path.string.hasPrefix($0.string) }
                }
                .sorted { $0.path.string < $1.path.string }

            let siteMap = SiteMap(
                .forEach(listed) { location in
                    .url(
                        .loc(context.site.canonicalURL(for: location.path)),
                        .lastmod(location.lastModified)
                    )
                }
            )

            try context.createOutputFile(at: "sitemap.xml").write(siteMap.render())
        }
    }

    /// GitHub Pages only serves its error page from `/404.html`, while Publish writes every
    /// location as `<path>/index.html`.
    static func moveNotFoundPageToRoot() -> Self {
        step(named: "Move the 404 page to /404.html") { context in
            let generated = try context.outputFile(at: "404/index.html")
            try context.createOutputFile(at: "404.html").write(generated.readAsString())
            try context.outputFolder(at: "404").delete()
        }
    }
}

enum PressKitError: Error {
    case zipFailed(status: Int32)
}
