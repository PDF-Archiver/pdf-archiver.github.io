import Plot
import Publish

extension Node where Context == HTML.DocumentContext {
    static func siteHead(for location: Location,
                         on site: PDFArchiverWebsite,
                         in language: SiteLanguage) -> Node {
        let strings = language.strings
        // Both home pages sit at their language root, so the shared path is the empty one.
        let isHome = SiteLanguage.sharedPath(of: location.path).string.isEmpty
        let title = isHome ? strings.homeTitle : "\(location.title) | \(strings.siteTitle)"
        let description = location.description.isEmpty ? language.metaDescription : location.description

        return .head(
            .encoding(.utf8),
            .viewport(.accordingToDevice),
            .title(title),
            .description(description),
            .siteName(site.name),
            .url(site.canonicalURL(for: location.path)),
            .unwrap(location.imagePath ?? site.imagePath) { .socialImageLink(site.url(for: $0)) },
            .meta(.name("twitter:card"), .content("summary_large_image")),
            .meta(.name("apple-itunes-app"),
                  .content("app-id=1433801905, app-clip-bundle-id=de.JulianKahnert.PDFArchiveViewer.Clip")),
            .meta(.name("msapplication-TileColor"), .content("#ca414f")),
            // The header sits on the hero band, so the browser chrome matches it per theme.
            .meta(.name("theme-color"), .content("#fbf7f6"),
                  .attribute(named: "media", value: "(prefers-color-scheme: light)")),
            .meta(.name("theme-color"), .content("#141c27"),
                  .attribute(named: "media", value: "(prefers-color-scheme: dark)")),
            .link(.rel(.appleTouchIcon), .sizes("180x180"), .href("/assets/img/favicon/apple-touch-icon.png")),
            .link(.rel(.icon), .type("image/png"), .sizes("32x32"), .href("/assets/img/favicon/favicon-32x32.png")),
            .link(.rel(.icon), .type("image/png"), .sizes("16x16"), .href("/assets/img/favicon/favicon-16x16.png")),
            .link(.rel(.manifest), .href("/assets/img/favicon/site.webmanifest")),
            .link(.rel(.maskIcon), .color("#ca414f"), .href("/assets/img/favicon/safari-pinned-tab.svg")),
            .link(.rel(.shortcutIcon), .href("/assets/img/favicon/favicon.ico")),
            .alternateLanguageLinks(for: location.path, on: site),
            .stylesheet("/css/styles.css"),
            // Adds `.is-scrolled` to the header, which morphs it into a floating pill.
            .script(.src("/assets/js/header-morph.js"), .defer()),
            // Only the home page is the application; on the FAQ and the legal pages the same
            // markup would claim that a privacy policy is downloadable software.
            .if(isHome, .structuredData(for: site, in: language))
        )
    }
}

private extension Node where Context == HTML.HeadContext {
    /// `hreflang` links let search engines pair the two language versions of a page.
    /// Google ignores the whole set unless every URL is absolute, so they go through `canonicalURL`.
    static func alternateLanguageLinks(for path: Path, on site: PDFArchiverWebsite) -> Node {
        let sharedPath = SiteLanguage.sharedPath(of: path)

        func link(to language: SiteLanguage, as code: String) -> Node {
            .link(
                .rel(.alternate),
                .href(site.canonicalURL(for: language.path(for: sharedPath))),
                .attribute(named: "hreflang", value: code)
            )
        }

        return .group(
            .group(SiteLanguage.allCases.map { link(to: $0, as: $0.rawValue) }),
            // Everyone the two languages do not cover lands on the English version.
            link(to: .english, as: "x-default")
        )
    }

    /// Deliberately without price or rating: both live in the App Store, and a stale number in
    /// the markup is worse than none.
    static func structuredData(for site: PDFArchiverWebsite, in language: SiteLanguage) -> Node {
        let json = """
        {"@context":"https://schema.org","@type":"SoftwareApplication",\
        "name":"\(site.name)","applicationCategory":"ProductivityApplication",\
        "operatingSystem":"iOS 18, macOS 15.6",\
        "url":"\(site.url.absoluteString)","downloadUrl":"\(language.strings.appStoreURL)",\
        "author":{"@type":"Person","name":"\(language.strings.copyrightHolder)"}}
        """

        return .script(.attribute(named: "type", value: "application/ld+json"), .raw(json))
    }
}

private extension SiteLanguage {
    var metaDescription: String {
        switch self {
        case .english:
            return """
            PDF Archiver scans, tags and archives your documents as searchable PDFs — entirely on \
            your Mac, iPhone or iPad. Open source, no cloud required. Two weeks free.
            """
        case .german:
            return """
            PDF Archiver scannt, taggt und archiviert deine Dokumente als durchsuchbare PDFs — \
            komplett auf deinem Gerät. Open Source, ohne Cloud-Zwang. Zwei Wochen gratis.
            """
        }
    }
}
