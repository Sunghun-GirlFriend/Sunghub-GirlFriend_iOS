import Swinject

final class ReactorAssembly: Assembly {
    func assemble(container: Container) {
        container
            .builder
            .with {
                $0.register(OnboardingReactor.self) { _ in
                    OnboardingReactor()
                }
            }
            .buildNoReture
    }
}
