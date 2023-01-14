import Swinject

final class ReactorAssembly: Assembly {
    func assemble(container: Container) {
        container
            .builder
            .with {
                $0.register(SignInReactor.self) { _ in
                    SignInReactor()
                }
                $0.register(HomeReactor.self) { _ in
                    HomeReactor()
                }
            }
            .buildNoReture
    }
}
