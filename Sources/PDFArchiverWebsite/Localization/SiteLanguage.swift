import Plot
import Publish

/// One of the two languages the site is published in.
///
/// The URL carries the language: English pages sit at the root (`/faq`), German ones below
/// `/de` (`/de/faq`). Every path therefore maps to exactly one language and back.
enum SiteLanguage: String, CaseIterable {
    case english = "en"
    case german = "de"

    /// The language a location is written in, taken from the leading path component.
    init(path: Path) {
        let prefix = path.string.split(separator: "/").first.map(String.init)
        self = prefix == SiteLanguage.german.rawValue ? .german : .english
    }

    /// The order the switcher lists the languages in, independent of `allCases`.
    static let switcherOrder: [SiteLanguage] = [.german, .english]

    var plotLanguage: Language {
        switch self {
        case .english:
            return .english
        case .german:
            return .german
        }
    }

    var strings: SiteStrings {
        switch self {
        case .english:
            return .english
        case .german:
            return .german
        }
    }

    var homePath: Path {
        path(for: "")
    }

    /// The path this language uses for a language-independent path (`faq` becomes `de/faq`).
    func path(for sharedPath: Path) -> Path {
        switch self {
        case .english:
            return sharedPath
        case .german:
            return sharedPath.string.isEmpty ? Path(rawValue) : Path("\(rawValue)/\(sharedPath.string)")
        }
    }

    /// A path with its language prefix removed, so `de/faq` and `faq` both become `faq`.
    static func sharedPath(of path: Path) -> Path {
        var components = path.string.split(separator: "/")

        if components.first.map(String.init) == SiteLanguage.german.rawValue {
            components.removeFirst()
        }

        return Path(components.joined(separator: "/"))
    }
}
