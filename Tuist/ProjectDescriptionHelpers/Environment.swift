import ProjectDescription

public enum Environment {
    public static let appName: String =  "Sunghun-GirlFriend-iOS"
    public static let targetName: String = "Sunghun-GirlFriend-iOS"
    public static let targetTestName: String = "\(targetName)Tests"
    public static let targetUITestName: String = "\(targetName)UITests"
    public static let targetScript: [TargetScript] = []
    public static let organizationName: String = "Sunghun-GirlFriend"
    public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "13.0", devices: [.iphone, .ipad])
    public static let platform: Platform = .iOS
    public static let baseSetting: SettingsDictionary = SettingsDictionary()
}
