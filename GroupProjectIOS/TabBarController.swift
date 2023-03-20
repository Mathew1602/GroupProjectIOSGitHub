import UIKit

class TabBarController: UITabBarController {
    func createTabBarVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarVC = TabBarController()

        let vc1 = storyboard.instantiateViewController(withIdentifier: "FittnessHome") as! FittnessHomeViewController

        let vc2 = storyboard.instantiateViewController(withIdentifier: "AllYourGoals") as! AllYourGoalsViewController

        let vc3 = storyboard.instantiateViewController(withIdentifier: "PopularFitness") as! PopularFitnessViewController

        let vc4 = storyboard.instantiateViewController(withIdentifier: "Food") as! FoodViewController
        
        let vc5 = storyboard.instantiateViewController(withIdentifier: "Calendar") as! CalendarViewController
        
        let vc6 = storyboard.instantiateViewController(withIdentifier: "Settings") as! SettingsViewController

        tabBarVC.tabBar.layer.backgroundColor = CGColor(red: 25/255.0, green: 33/255.0, blue: 38/255.0, alpha: 1.0)
        tabBarVC.tabBar.layer.cornerRadius = 20
        tabBarVC.tabBar.tintColor = UIColor(red: 242/255.0, green: 70/255.0, blue: 225/255.0, alpha: 1.0)
        tabBarVC.tabBar.barTintColor = .white
        tabBarVC.setViewControllers([vc1,vc2,vc3,vc4,vc5,vc6], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        
        let images = ["Home","Goals","Graph","Profile","CalendarIcon","Settings"]
        let insets = UIEdgeInsets(top: 6, left: 0, bottom: -20, right: 0)
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        for x in 0..<items.count {
            items[x].image = UIImage(named: images[x])
            items[x].imageInsets = insets
        }
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let delegate = windowScene.delegate as? SceneDelegate,
           let window = delegate.window {
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                window.rootViewController = tabBarVC
            }, completion: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           
           // Reduce the height of the tab bar
           let newTabBarHeight: CGFloat = 80
           var newTabBarFrame = tabBar.frame
           newTabBarFrame.size.height = newTabBarHeight
           newTabBarFrame.origin.y = view.frame.size.height - newTabBarHeight
           tabBar.frame = newTabBarFrame
       }
    
    override var traitCollection: UITraitCollection {
          let realTraits = super.traitCollection
          let fakeTraits = UITraitCollection(horizontalSizeClass: .regular)
          return UITraitCollection(traitsFrom: [realTraits, fakeTraits])
      }
}
