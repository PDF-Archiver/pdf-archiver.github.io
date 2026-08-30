import Plot

/// Elements Plot does not ship a builder for, added through its own escape hatch.
extension Node where Context == HTML.BodyContext {
    static func figure(_ nodes: Node<HTML.BodyContext>...) -> Node {
        .element(named: "figure", nodes: nodes)
    }

    static func figcaption(_ nodes: Node<HTML.BodyContext>...) -> Node {
        .element(named: "figcaption", nodes: nodes)
    }
}
