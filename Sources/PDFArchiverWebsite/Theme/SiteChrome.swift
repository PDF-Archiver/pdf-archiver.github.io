import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    static func siteHeader(for path: Path,
                           in language: SiteLanguage,
                           context: PublishingContext<PDFArchiverWebsite>) -> Node {
        let strings = language.strings
        let homeURL = language.homePath.absoluteString

        return .header(
            .a(
                .class("site-name"),
                .href(homeURL),
                .img(.src(strings.appIconPath), .decorative, .width(20)),
                .text(strings.siteTitle)
            ),
            .nav(
                .attribute(named: "aria-label", value: strings.navigationLabel),
                .ul(
                    .li(.a(.href("\(homeURL)#download"), .text(strings.downloadLabel))),
                    .li(.a(.href("\(homeURL)#features"), .text(strings.featuresLabel))),
                    .li(.a(.href("\(homeURL)#contact"), .text(strings.contactLabel)))
                )
            ),
            .languageSwitcher(for: path, in: language, context: context)
        )
    }

    static func siteFooter(for path: Path,
                           in language: SiteLanguage,
                           context: PublishingContext<PDFArchiverWebsite>) -> Node {
        let strings = language.strings
        // A path without a counterpart in the current language is left out, which is how the
        // German footer loses the English-only changelog.
        let footerPaths: [Path] = ["faq", "privacy", "terms", "imprint", "press", "changelog"]

        return .footer(
            .p(.raw(strings.copyright)),
            .p(.text(strings.websiteAttribution)),
            .ul(
                .class("footer-links"),
                .forEach(footerPaths) { sharedPath in
                    let target = language.path(for: sharedPath)

                    return .unwrap(locationTitle(at: target, in: context)) { title in
                        .li(.a(.href(target.absoluteString), .text(title)))
                    }
                }
            )
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static func languageSwitcher(for path: Path,
                                 in language: SiteLanguage,
                                 context: PublishingContext<PDFArchiverWebsite>) -> Node {
        let strings = language.strings

        return .nav(
            .attribute(named: "aria-label", value: strings.selectLanguage),
            .ul(
                .class("language-switcher"),
                .forEach(SiteLanguage.allCases) { other in
                    .li(.a(
                        .href(counterpart(of: path, in: other, context: context).absoluteString),
                        .attribute(named: "hreflang", value: other.rawValue),
                        .if(other == language, .attribute(named: "aria-current", value: "page")),
                        .text(other == .german ? strings.germanName : strings.englishName)
                    ))
                }
            )
        )
    }
}

/// The other language's version of a location. Content that exists in English only — FAQ entries
/// and the changelog — falls back to that language's home page instead of a dead link.
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
