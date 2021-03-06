import Foundation
import UIKit

class CreateAccViewController : UIViewController {}



//: #### SwiftGenStoryboardEnumBuilder Usage Example

let enumBuilder = SwiftGenStoryboardEnumBuilder()
if let sbFile1 = NSBundle.mainBundle().pathForResource("Wizzard", ofType: "storyboard") {
    enumBuilder.addStoryboardAtPath(sbFile1)
}
if let sbFile2 = NSBundle.mainBundle().pathForResource("Message", ofType: "storyboard") {
    enumBuilder.addStoryboardAtPath(sbFile2)
}
print(enumBuilder.build())



//: #### Code Generated by the Builder

// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

protocol StoryboardScene : RawRepresentable {
  static var storyboardName : String { get }
  static func storyboard() -> UIStoryboard
  static func initialViewController() -> UIViewController
  func viewController() -> UIViewController
  static func viewController(identifier: Self) -> UIViewController
}

extension StoryboardScene where Self.RawValue == String {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }
  
  static func initialViewController() -> UIViewController {
    return storyboard().instantiateInitialViewController()!
  }
  
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewControllerWithIdentifier(self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

extension UIStoryboard {
  enum Scene {
    enum Wizzard : String, StoryboardScene {
      static let storyboardName = "Wizzard"
      
      case CreateAccount = "CreateAccount"
      static var createAccountViewController : CreateAccViewController {
        return Wizzard.CreateAccount.viewController() as! CreateAccViewController
      }
      
      case AcceptCGU = "Accept-CGU"
      static var acceptCGUViewController : UIViewController {
        return Wizzard.AcceptCGU.viewController()
      }
      
      case ValidatePassword = "Validate_Password"
      static var validatePasswordViewController : UIViewController {
        return Wizzard.ValidatePassword.viewController()
      }
      
      case Preferences = "Preferences"
      static var preferencesViewController : UIViewController {
        return Wizzard.Preferences.viewController()
      }
    }
  }
  
  enum Segue {
      enum Message : String {
        case Custom = "Custom"
        case NonCustom = "NonCustom"
    }
  }
}

//: #### Usage Example

let initialVC = UIStoryboard.Scene.Wizzard.initialViewController()
initialVC.title

let validateVC = UIStoryboard.Scene.Wizzard.ValidatePassword.viewController()
validateVC.title

/* Note: the following line would crash when run in playground, because the storyboard file
   was not compiled alongside the playground code, so the CreateAccViewController class was
   not known by the storyboard. But it should work correctly in a real project. */
// let cgu = UIStoryboard.Name.Wizzard.createAccountViewController

let segue = UIStoryboard.Segue.Message(rawValue: "Custom")!
segue

switch segue {
  case .Custom:
    print("Working! 🎉")
  default:
    print("Not working! 😱")
}

/*******************************************************************************
This is a «real world» example of how you can benefit from the generated enum;
you can easily switch or directly compare the passed in `segue` with the corresponding
segues for a specific storyboard.
*******************************************************************************/
//override func prepareForSegue(_ segue: UIStoryboardSegue, sender sender: AnyObject?) {
//  switch UIStoryboard.Segue.Message(rawValue: segue.identifier)! {
//  case .Custom:
//    // Prepare for your custom segue transition
//  case .NonCustom:
//    // Pass in information to the destination View Controller
//  }
//}
