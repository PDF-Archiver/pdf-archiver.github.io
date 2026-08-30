import Plot
import Publish

extension Node where Context == HTML.DocumentContext {
    static func siteHead(for location: Location,
                         on site: PDFArchiverWebsite,
                         in language: SiteLanguage) -> Node {
        let strings = language.strings
        // The home pages are titled after the site itself — no point in naming it twice.
        let isSiteTitle = location.title.isEmpty || location.title == strings.siteTitle
        let title = isSiteTitle ? strings.siteTitle : "\(location.title) | \(strings.siteTitle)"
        let description = location.description.isEmpty ? site.description : location.description

        return .head(
            .encoding(.utf8),
            .viewport(.accordingToDevice),
            .title(title),
            .description(description),
            .siteName(site.name),
            .url(site.url(for: location)),
            .unwrap(location.imagePath ?? site.imagePath) { .socialImageLink(site.url(for: $0)) },
            .meta(.name("apple-itunes-app"),
                  .content("app-id=1433801905, app-clip-bundle-id=de.JulianKahnert.PDFArchiveViewer.Clip")),
            .meta(.name("msapplication-TileColor"), .content("#d9334e")),
            .meta(.name("theme-color"), .content("#ffffff")),
            .link(.rel(.appleTouchIcon), .sizes("180x180"), .href("/assets/img/favicon/apple-touch-icon.png")),
            .link(.rel(.icon), .type("image/png"), .sizes("32x32"), .href("/assets/img/favicon/favicon-32x32.png")),
            .link(.rel(.icon), .type("image/png"), .sizes("16x16"), .href("/assets/img/favicon/favicon-16x16.png")),
            .link(.rel(.manifest), .href("/assets/img/favicon/site.webmanifest")),
            .link(.rel(.maskIcon), .color("#d9334e"), .href("/assets/img/favicon/safari-pinned-tab.svg")),
            .link(.rel(.shortcutIcon), .href("/assets/img/favicon/favicon.ico")),
            // Several translated strings embed Font Awesome icons, so the icon font stays for now.
            .stylesheet("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.3.1/css/all.min.css"),
            .stylesheet("/css/styles.css")
        )
    }
}
