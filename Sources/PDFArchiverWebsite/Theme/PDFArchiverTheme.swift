import Plot
import Publish

extension Theme where Site == PDFArchiverWebsite {
    static var pdfArchiver: Self {
        Theme(htmlFactory: PDFArchiverHTMLFactory())
    }
}

private struct PDFArchiverHTMLFactory: HTMLFactory {
    typealias Site = PDFArchiverWebsite

    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        document(for: index, context: context, body: .homeContent(in: .english, on: context.site))
    }

    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        switch section.id {
        case .faq:
            return document(for: section, context: context,
                            body: .articlePage(title: section.title,
                                               intro: section.body.node,
                                               content: .faqEntries(in: .english, context: context)))
        case .changelog:
            return document(for: section, context: context,
                            body: .articlePage(title: section.title,
                                               intro: section.body.node,
                                               content: .changelogList(for: section.items)))
        }
    }

    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        document(for: item, context: context,
                 body: .articlePage(title: item.title, intro: item.body.node, content: .empty))
    }

    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        document(for: page, context: context, body: body(for: page, context: context))
    }

    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        nil
    }

    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        nil
    }
}

private extension PDFArchiverHTMLFactory {
    func document(for location: Location,
                  context: PublishingContext<Site>,
                  body: Node<HTML.BodyContext>) -> HTML {
        let language = SiteLanguage(path: location.path)

        return HTML(
            .lang(language.plotLanguage),
            .siteHead(for: location, on: context.site, in: language),
            .body(
                .siteHeader(for: location.path, in: language, context: context),
                .main(body),
                .siteFooter(for: location.path, in: language, context: context)
            )
        )
    }

    /// The two German locations that are not plain Markdown pages: the home page is generated
    /// from the translated strings, the FAQ collects the entries below `de/faq`.
    func body(for page: Page, context: PublishingContext<Site>) -> Node<HTML.BodyContext> {
        switch page.path {
        case "de":
            return .homeContent(in: .german, on: context.site)
        case "de/faq":
            return .articlePage(title: page.title,
                                intro: page.body.node,
                                content: .faqEntries(in: .german, context: context))
        default:
            return .articlePage(title: page.title, intro: page.body.node, content: .empty)
        }
    }
}

private extension Node where Context == HTML.BodyContext {
    /// The shared layout for everything that is not the home page: a heading and running text
    /// on a single paper band.
    static func articlePage(title: String, intro: Node, content: Node) -> Node {
        .section(
            .class("band band-paper"),
            .div(
                .class("wrap narrow prose"),
                .h1(.text(title)),
                intro,
                content
            )
        )
    }
}
