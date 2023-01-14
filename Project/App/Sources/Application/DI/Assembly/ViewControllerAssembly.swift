import Swinject

final class ViewControllerAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container
            .builder
            .with {
                $0.register(SignInViewController.self) {
                    SignInViewController(reactor: $0.resolve(SignInReactor.self)!)
                }
            }
            .buildNoReture
        container
            .builder
            .with {
                $0.register(CreateViewController.self) {
                    CreateViewController(reactor: $0.resolve(CreateReactor.self)!)
                }
            }
            .buildNoReture
    }
}
