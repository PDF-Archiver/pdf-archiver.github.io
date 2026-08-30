import Foundation
import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    /// Every FAQ entry rendered onto a single page, ordered by file name.
    static func faqEntries(in context: PublishingContext<PDFArchiverWebsite>) -> Node {
        .group(context.sections[.faq].items.map { item in
            .section(
                .class("faq-entry"),
                .h2(.a(.href(item.path.absoluteString), .text(item.title))),
                item.body.node
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
