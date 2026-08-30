import Foundation
import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    static func siteHeader(for path: Path,
                           in language: SiteLanguage,
                           context: PublishingContext<PDFArchiverWebsite>) -> Node {
        let strings = language.strings
        let homeURL = language.homePath.absoluteString

        return .header(
            .class("site-header"),
            .div(
                .class("wrap site-header-inner"),
                .a(
                    .class("site-name"),
                    .href(homeURL),
                    .img(.class("site-icon"), .src("/assets/img/AppIcon.svg"), .decorative),
                    .text(strings.siteTitle)
                ),
                .nav(
                    .class("site-nav"),
                    .attribute(named: "aria-label", value: strings.navigationLabel),
                    .ul(
                        .li(.a(.href("\(homeURL)#features"), .text(strings.navFeatures))),
                        .li(.a(.href(language.path(for: "faq").absoluteString), .text(strings.navFAQ))),
                        .languageToggle(for: path, in: language, context: context),
                        .li(.a(.class("nav-cta"), .href(strings.appStoreURL), .text(strings.navDownload)))
                    )
                )
            )
        )
    }


    static func siteFooter(for path: Path,
                           in language: SiteLanguage,
                           context: PublishingContext<PDFArchiverWebsite>) -> Node {
        let strings = language.strings
        let footerPaths: [Path] = ["faq", "privacy", "terms", "imprint", "press"]
        let year = Calendar.current.component(.year, from: Date())

        return .footer(
            .class("site-footer"),
            .div(
                .class("wrap"),
                .ul(
                    .class("footer-links"),
                    .forEach(footerPaths) { sharedPath in
                        let target = language.path(for: sharedPath)

                        return .unwrap(locationTitle(at: target, in: context)) { title in
                            .li(.a(.href(target.absoluteString), .text(title)))
                        }
                    },
                    .li(.a(.href(context.site.githubURL.absoluteString), .text("GitHub"))),
                    .li(.a(.href(context.site.mastodonURL.absoluteString), .text("Mastodon")))
                ),
                .p(.class("copyright"), .text("© \(strings.copyrightHolder) \(year)"))
            )
        )
    }
}

extension Node where Context == HTML.ListContext {
    /// The quiet `de|en` next to the download button.
    static func languageToggle(for path: Path,
                               in language: SiteLanguage,
                               context: PublishingContext<PDFArchiverWebsite>) -> Node {
        let strings = language.strings
        let order = SiteLanguage.switcherOrder

        return .li(
            .class("language-toggle"),
            .forEach(order.indices) { index in
                let other = order[index]
                let name = other == .german ? strings.germanName : strings.englishName

                return .group(
                    .if(index > 0, .span(.class("language-sep"),
                                         .attribute(named: "aria-hidden", value: "true"),
                                         .text("|"))),
                    .a(
                        .href(counterpart(of: path, in: other, context: context).absoluteString),
                        .attribute(named: "hreflang", value: other.rawValue),
                        .attribute(named: "aria-label", value: name),
                        .if(other == language, .attribute(named: "aria-current", value: "page")),
                        .text(other.rawValue)
                    )
                )
            }
        )
    }

}

/// The other language's version of a location, falling back to that language's home page
/// when there is no counterpart.
private func counterpart(of path: Path,
                         in language: SiteLanguage,
                         context: PublishingContext<PDFArchiverWebsite>) -> Path {
    guard SiteLanguage(path: path) != language else { return path }

    let candidate = language.path(for: SiteLanguage.sharedPath(of: path))

    guard locationTitle(at: candidate, in: context) != nil else { return language.homePath }

    return candidate
}

/// The title of the location at `path`, or `nil` if the site has no such location.
private func locationTitle(at path: Path, in context: PublishingContext<PDFArchiverWebsite>) -> String? {
    if path.string.isEmpty {
        return context.index.title
    }

    if let page = context.pages[path] {
        return page.title
    }

    guard let sectionID = PDFArchiverWebsite.SectionID(rawValue: path.string) else { return nil }

    return context.sections[sectionID].title
}
