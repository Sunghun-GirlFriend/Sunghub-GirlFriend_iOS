import Swinject

final class ReactorAssembly: Assembly {
    func assemble(container: Container) {
        container
            .builder
            .with {
                $0.register(SignInReactor.self) { _ in
                    SignInReactor()
                }
                $0.register(SignUpReactor.self) { _ in
                    SignUpReactor()
                }
                $0.register(HomeReactor.self) { _ in
                    HomeReactor()
                }
                $0.register(RankReactor.self) { _ in
                    RankReactor()
                }
                $0.register(MyPageReactor.self) { _ in
                    MyPageReactor()
                }
            }
            .buildNoReture
        container
            .builder
            .with {
                $0.register(CreateReactor.self) { _ in
                    CreateReactor()
                }
            }
            .buildNoReture
    }
}
