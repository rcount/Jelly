import Foundation

public protocol PresentationAlignmentProvider {
    var presentationAlignment: PresentationAlignmentProtocol { get set }
}

public protocol PresentationAlignmentProtocol {
    var verticalAlignemt : Constants.VerticalAlignment { get set }
    var horizontalAlignment : Constants.HorizontalAlignment { get set }
}

public struct PresentationAlignment: PresentationAlignmentProtocol {
    public var verticalAlignemt: Constants.VerticalAlignment
    public var horizontalAlignment: Constants.HorizontalAlignment
    
    public static var centerAlignment: PresentationAlignment {
        return PresentationAlignment(verticalAlignemt: .center, horizontalAlignment: .center)
    }
}