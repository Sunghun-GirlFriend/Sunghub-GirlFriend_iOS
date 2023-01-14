import Swinject

final class ReactorAssembly: Assembly {
    func assemble(container: Container) {
        container
            .builder
            .with {
                $0.register(SignInReactor.self) { _ in
                    SignInReactor()
                }
            }
            .buildNoReture
        container
            .builder
            .with {
                $0.register(SignupReactor.self) { r in
                    SignupReactor()
                }
            }
            .buildNoReture
    }
}
