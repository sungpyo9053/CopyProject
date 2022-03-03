import UIKit

class RoundedButton: UIButton {

    @IBInspectable var radiusRatio: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = radiusRatio
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var topInset: CGFloat = 5.0

    @IBInspectable var bottomInset: CGFloat = 5.0

    @IBInspectable var leftInset: CGFloat = 5.0

    @IBInspectable var rightInset: CGFloat = 5.0

    @IBInspectable var isOverrideIntrinsicContentSize: Bool = true

    override var intrinsicContentSize: CGSize {
        if isOverrideIntrinsicContentSize {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        } else {
            return super.intrinsicContentSize
        }
    }
}
