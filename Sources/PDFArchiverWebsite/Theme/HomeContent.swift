import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    /// The marketing home page, built entirely from the translated strings.
    static func homeContent(in language: SiteLanguage, on site: PDFArchiverWebsite) -> Node {
        let strings = language.strings

        return .group(
            .section(
                .class("masthead"),
                .h1(.text(strings.mastheadMessage)),
                .p(.a(.class("button"), .href("#download"), .text(strings.downloadNow))),
                .img(.src(strings.screenshotPath), .alt(strings.siteTitle)),
                // Mastodon only verifies a profile link if the linked page answers with `rel="me"`.
                .p(.a(
                    .attribute(named: "rel", value: "me"),
                    .href(site.mastodonURL.absoluteString),
                    .text("Mastodon")
                ))
            ),
            .section(
                .id("download"),
                .h2(.text(strings.downloadHeadline)),
                .p(.a(
                    .href(strings.appStoreURL),
                    .img(.src(strings.appIconPath), .alt(strings.siteTitle), .width(160))
                )),
                .p(.a(
                    .href(strings.appStoreURL),
                    .img(.src(strings.appStoreBadgeImageURL), .alt("App Store"))
                )),
                .h3("Privacy by Design"),
                .p(.raw(strings.availability))
            ),
            .section(
                .id("features"),
                .h2(.text(strings.featuresTitle)),
                .p(.text(strings.featuresSubtitle)),
                .ul(
                    .class("features"),
                    .forEach(strings.features) { feature in
                        .li(.h3(.text(feature.title)), .p(.text(feature.description)))
                    }
                )
            ),
            .section(
                .class("call-to-action"),
                .h2(.text(strings.callToActionHeadline), .br(), .text(strings.callToActionSubheadline)),
                .p(.a(.class("button"), .href("#download"), .text(strings.startButton)))
            ),
            .section(
                .class("testimonials"),
                .h2(.text(strings.testimonialsHeadline)),
                .ul(
                    .forEach(strings.testimonials) { testimonial in
                        .li(
                            .img(.src(testimonial.imagePath), .decorative),
                            .blockquote(.p(.text(testimonial.statement))),
                            .p(.strong(.text(testimonial.name)))
                        )
                    }
                )
            ),
            .section(
                .id("contact"),
                .h2(.text(strings.needHelpTitle)),
                .p(.raw(strings.needHelpText)),
                .ul(
                    .li(.a(.href(language.path(for: "faq").absoluteString), .text("FAQ"))),
                    .li(.a(.href(site.mastodonURL.absoluteString), .text("Mastodon"))),
                    .li(.a(.href("mailto:\(site.supportEmail)"), .text(site.supportEmail)))
                ),
                .h2(.raw(strings.contributionsWelcome)),
                .p(.raw(strings.contributionText)),
                .ul(
                    .li(.a(.href(site.mastodonURL.absoluteString), .text("Mastodon"))),
                    .li(.a(.href(site.githubURL.absoluteString), .text("GitHub"))),
                    .li(.a(.href("mailto:\(site.featureRequestEmail)"), .text(site.featureRequestEmail)))
                )
            )
        )
    }
}
