public enum QuestStatus: String, Codable, CaseIterable {
    case complete = "Complete"
    case running = "RUNNING"
    case before = "BEFORE"
    case wait = "WAIT"
    case terminate = "TERMINATE"
    case restart = "RESTART"
}
