import Plot
import Publish

extension Theme where Site == PDFArchiverWebsite {
    /// Neutral, semantic scaffolding. The visual design is deliberately left to a later step.
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
        let heading = Node<HTML.BodyContext>.group(.h1(.text(section.title)), section.body.node)

        switch section.id {
        case .faq:
            return document(for: section, context: context,
                            body: .group(heading, .faqEntries(in: context)))
        case .changelog:
            return document(for: section, context: context,
                            body: .group(heading, .changelogList(for: section.items)))
        }
    }

    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        document(for: item, context: context,
                 body: .article(.h1(.text(item.title)), item.body.node))
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

    /// German counterparts of the two English root locations that are not plain Markdown pages:
    /// the home page is generated from the translated strings, the FAQ from the FAQ section.
    func body(for page: Page, context: PublishingContext<Site>) -> Node<HTML.BodyContext> {
        switch page.path {
        case "de":
            return .homeContent(in: .german, on: context.site)
        case "de/faq":
            return .group(.h1(.text(page.title)), page.body.node, .faqEntries(in: context))
        default:
            return .group(.h1(.text(page.title)), page.body.node)
        }
    }
}
