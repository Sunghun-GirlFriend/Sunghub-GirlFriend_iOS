import Swinject

final class ViewControllerAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container
            .builder
            .with {
                $0.register(SignInViewController.self) {
                    SignInViewController(reactor: $0.resolve(SignInReactor.self)!)
                }
                $0.register(HomeViewController.self) {
                    HomeViewController(reactor: $0.resolve(HomeReactor.self)!)
                }
                $0.register(RankViewController.self) {
                    RankViewController(reactor: $0.resolve(RankReactor.self)!)
                }
                $0.register(MyPageViewController.self) {
                    MyPageViewController(reactor: $0.resolve(MyPageReactor.self)!)
                }
            }
            .buildNoReture
    }
}
