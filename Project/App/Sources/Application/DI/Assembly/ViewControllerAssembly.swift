import Swinject

final class ViewControllerAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container
            .builder
            .with {
                $0.register(OnboardingViewController.self) {
                    OnboardingViewController(reactor: $0.resolve(OnboardingReactor.self)!)
                }
            }
            .buildNoReture
    }
}
