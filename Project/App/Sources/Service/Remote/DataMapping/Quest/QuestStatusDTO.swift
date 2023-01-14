import Foundation

public struct QuestStatusDTO: Encodable {
    public init(hour: Int, status: QuestStatus) {
        self.hour = hour
        self.status = status
    }

    public let hour: Int
    public let status: QuestStatus
}
