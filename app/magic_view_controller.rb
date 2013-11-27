class MagicViewController < UIViewController

  def viewDidLoad
    @magicBall = MagicBall.new
    @label = self.view.subviews.first

    view.image = UIImage.imageNamed('background.png')
    view.whenTapped do
      UIView.animateWithDuration(0.75,
        animations: lambda {
          @label.alpha = 0
          @label.transform = createTransform
      },
        completion:lambda { |finished|
          @label.text = @magicBall.answer
          @label.transform = CGAffineTransformIdentity
      })
    end
  end

  private

  def createTransform
    r = -Math::PI
    t = view.bounds.size.width
    CGAffineTransformTranslate(
        CGAffineTransformRotate(
            CGAffineTransformMakeScale(0.1, 0.1), r), t, 0)
  end
end