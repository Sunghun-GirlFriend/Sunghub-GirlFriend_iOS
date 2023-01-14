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
                $0.register(SignupViewController.self) {
                    SignupViewController(reactor: $0.resolve(SignupReactor.self)!)
                }
            }
            .buildNoReture
        container
            .builder
            .with {
                $0.register(Signup2ViewController.self) {
                    Signup2ViewController(reactor: $0.resolve(SignupReactor.self)!)
                }
            }
            .buildNoReture
        container
            .builder
            .with {
                $0.register(Signup3ViewController.self) {
                    Signup3ViewController(reactor: $0.resolve(SignupReactor.self)!)
                }
            }
            .buildNoReture
    }
}
