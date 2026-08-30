import Plot
import Publish

extension Path {
    /// The trailing-slash form GitHub Pages serves. It redirects `/faq` to `/faq/`, so linking to
    /// the slash-less form costs a 301 on every visit and points canonical tags at a redirect.
    var directoryPath: String {
        string.isEmpty ? "/" : "/\(string)/"
    }
}

extension PDFArchiverWebsite {
    /// The absolute address that `canonical`, `hreflang` and the site map all have to agree on.
    /// `url(for:)` omits the trailing slash, which puts each of them one redirect off the real page.
    func canonicalURL(for path: Path) -> String {
        url.absoluteString + path.directoryPath
    }
}
