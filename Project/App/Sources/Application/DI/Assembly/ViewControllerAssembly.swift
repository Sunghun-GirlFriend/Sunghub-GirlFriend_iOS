import Swinject

final class ViewControllerAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container
            .builder
            .with {
            }
            .buildNoReture
    }
}
