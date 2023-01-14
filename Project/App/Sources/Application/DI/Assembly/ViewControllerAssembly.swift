import Swinject

final class ViewControllerAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container
            .builder
            .with {
                $0.register(SignInViewController.self) {
                    SignInViewController(reactor: $0.resolve(SignInReactor.self)!)
                }
                $0.register(MainViewController.self) {
                    MainViewController(reactor: $0.resolve(MainReactor.self)!)
                }
            }
            .buildNoReture
    }
}
