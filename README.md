Jelly is a library for animated, non-interactive & interactive viewcontroller <br/>
transitions and presentations with the focus on a simple and yet flexible API. 
  
With a few lines of source code, interactive UIViewController transitions <br/>
and custom resizable UIViewController presentations can be created, <br/>
without the use of the cumbersome UIKit Transitioning API. 

```swift

var slidePresentation = SlidePresentation(direction: .left)
let animator = Animator(presentation: slidePresentation)
animator.prepare(viewController: viewController)
present(viewController, animated: true, completion: nil)
```

1. Create a `Presentation` Object 
2. Configure an  `Animator` with the *Presentation*
3. Call the `prepare` Function
4. Use the native `UIViewController` presentation function.

```swift
class ViewController : UIViewController {
    var animator: Jelly.Animator?
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewController = YourViewController()
        let presentation = SlidePresentation(direction: .left)
        animator = Animator(presentation:presentation)
        animator?.prepare(presentedViewController: viewController)
        present(viewController, animated: true, completion: nil)
    }
}
```

*** DO NOT FORGET TO KEEP A STRONG 💪 REFERENCE ***

Because the `transitioningDelegate` of a `UIViewController` is weak, you need to
hold a strong reference to the `Animator` inside the `UIViewController` you are presenting from or 
the central object that maintains your presentations.



Interactive transitions can be activated for the *slide* and the *cover* transitions. 
If the transitions are to be interactive, only an `InteractionConfiguration` object has to be passed to the presentation. 


Here 2 parameters play an important role. First, the `completionThreshold`, which determines the percentage of the animation that is automatically completed as soon as the user finishes the interaction. 
The second parameter is the actual type of interaction. Jelly offers the `.edge` and the `.canvas` type. 
In an `.edge` transition, the user must execute the gesture from the edge of the screen. 
When using the `.canvas` type, gesture recognizers are configured so that direct interaction with the presenting and presented view leads to the transition.

```swift
let viewController = YourViewController()
let interaction = InteractionConfiguration(presentingViewController: self, completionThreshold: 0.5, dragMode: .edge)
let presentation = SlidePresentation(direction: .right, interactionConfiguration: interaction)
let animator = Animator(presentation: presentation)
animator.prepare(presentedViewController: viewController)

```

Jelly 2.0 also provides a new feature called *LIVE UPDATE*. 
Using Jellys  new `Live Update API` it is now possible to update the `alignment`, `size`, `margin-guards` and `corner radius` when the viewcontroller is already visible.


These are the new live update functions provided by the Animator. 

* `updateAlignment(alignment: PresentationAlignment, duration: Duration)` - Cover & Fade
* `updateVerticalAlignment(alignment: VerticalAlignment, duration: Duration)` - Cover & Fade
* `updateHorizontalAlignment(alignment: HorizontalAlignment, duration: Duration)` - Cover & Fade
* `updateSize(presentationSize: PresentationSize, duration: Duration)` - Cover & Fade
* `updateWidth(width: Size, duration: Duration)` - Cover, Fade and horizontal Slide
* `updateHeight(height: Size, duration: Duration)` - Cover, Fade and vertical Slide
* `updateMarginGuards(marginGuards: UIEdgeInsets, duration: Duration)` - Cover & Fade
* `updateCorners(radius: CGFloat, corners: CACornerMask, duration: Duration)` - Cover & Fade & Slide

Some of them will throw an exception if used on a not supported presentationType. <br/>
For example: It is currently not possible to update the size on a Slide-Presentation. 


The presentation types can be configured with various settings: 

* `size`
* `margin guards`
* `direction` 
* `horizontal & vertical alignment` 
* `dimmed and blurred backgroundStyle`
* `duration`
* `presentation and dismiss curve`
* `spring damping & velocity` 
* `corner specification` & `corner radius`
* `completion threshold`
* `interactive drag mode` 

Each component is explained in more detail in the <a href="https://github.com/SebastianBoldt/Jelly/wiki/Customization
">Jelly Wiki</a>.  




Deployment target of your App is >= iOS 11.0

