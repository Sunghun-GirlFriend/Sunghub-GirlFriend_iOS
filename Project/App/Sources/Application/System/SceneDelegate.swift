import UIKit
import RxSwift
import RxFlow

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let disposeBag = DisposeBag()
    private let coordinator = FlowCoordinator()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        coordinateToAppFlow(with: windowScene)
        coordinateLogger()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

private extension SceneDelegate {
    func coordinateToAppFlow(with scene: UIWindowScene) {
        let window = UIWindow(windowScene: scene)
        self.window = window
        let appFlow = AppFlow(window)
        let appStepper = AppStepper()
        coordinator.coordinate(flow: appFlow, with: appStepper)
        window.makeKeyAndVisible()
    }
    func coordinateLogger() {
        coordinator.rx.willNavigate
            .subscribe { flow, step in
                let currentFlow = "\(flow)".split(separator: " ").last ?? "No Flow"
                print("➡️ will navigate to flow = \(currentFlow) and step = \(step)")
            }
            .disposed(by: disposeBag)
    }
}
