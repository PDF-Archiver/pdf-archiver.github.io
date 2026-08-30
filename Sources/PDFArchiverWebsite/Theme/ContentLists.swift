import Foundation
import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    /// Every FAQ entry of one language, rendered onto a single page and ordered by file name.
    ///
    /// English entries are items of the `faq` section, German ones are pages below `de/faq` —
    /// the language lives in the URL, and a section path cannot carry a language prefix.
    static func faqEntries(in language: SiteLanguage,
                           context: PublishingContext<PDFArchiverWebsite>) -> Node {
        .group(faqEntrySources(in: language, context: context).map { entry in
            .section(
                .class("faq-entry"),
                .h2(.id(entry.anchor), .text(entry.title)),
                entry.body
            )
        })
    }

    static func changelogList(for items: [Item<PDFArchiverWebsite>]) -> Node {
        .ul(
            .class("changelog"),
            .forEach(items) { item in
                .li(
                    .a(.href(item.path.absoluteString), .text(item.title)),
                    .text(" — "),
                    .text(item.date.formatted(.iso8601.year().month().day().dateSeparator(.dash)))
                )
            }
        )
    }
}

private struct FAQEntry {
    let anchor: String
    let title: String
    let body: Node<HTML.BodyContext>
}

/// The FAQ entries of one language, sorted by the file name that carries their order.
private func faqEntrySources(in language: SiteLanguage,
                             context: PublishingContext<PDFArchiverWebsite>) -> [FAQEntry] {
    switch language {
    case .english:
        return context.sections[.faq].items
            .sorted { $0.path.string < $1.path.string }
            .map { FAQEntry(anchor: anchor(for: $0.path), title: $0.title, body: $0.body.node) }
    case .german:
        let prefix = "\(SiteLanguage.german.rawValue)/faq/"

        return context.pages.values
            .filter { $0.path.string.hasPrefix(prefix) }
            .sorted { $0.path.string < $1.path.string }
            .map { FAQEntry(anchor: anchor(for: $0.path), title: $0.title, body: $0.body.node) }
    }
}

/// The anchor of an entry: its file name without the numeric prefix that only sets the order,
/// so reordering the FAQ does not break existing deep links.
private func anchor(for path: Path) -> String {
    let name = path.string.split(separator: "/").last.map(String.init) ?? path.string

    guard let separator = name.firstIndex(of: "-"),
          name[name.startIndex..<separator].allSatisfy(\.isNumber) else {
        return name
    }

    return String(name[name.index(after: separator)...])
}
