import Foundation
import Publish

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
