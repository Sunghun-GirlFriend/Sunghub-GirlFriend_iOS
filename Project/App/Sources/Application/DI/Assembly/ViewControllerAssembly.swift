import Swinject

final class ViewControllerAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container
            .builder
            .with {
                $0.register(SignInViewController.self) {
                    SignInViewController(reactor: $0.resolve(SignInReactor.self)!)
                }
                $0.register(SignupViewController.self) {
                    SignupViewController(reactor: $0.resolve(SignupReactor.self)!)
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
                $0.register(QuestSelectViewController.self) {
                    QuestSelectViewController(reactor: $0.resolve(QuestSelectReactor.self)!)
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
