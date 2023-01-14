import UIKit
import Swinject
import IQKeyboardManagerSwift

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties
    static let container = Container()
    var assembler: Assembler!
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        dependencyManager()
        keyboardManagerment()
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}

//MARK: - Private Method
private extension AppDelegate {
    func dependencyManager() {
        assembler = Assembler([
            ViewControllerAssembly(),
            ReactorAssembly()
        ], container: AppDelegate.container)
    }
    func keyboardManagerment() {
        IQKeyboardManager
            .shared
            .builder
            .enable(true)
            .enableAutoToolbar(false)
            .shouldResignOnTouchOutside(true)
            .buildNoReture
    }
}

