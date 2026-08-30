import Foundation
import Publish

extension PublishingStep where Site == PDFArchiverWebsite {
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
