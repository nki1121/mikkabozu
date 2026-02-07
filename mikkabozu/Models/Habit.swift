import Foundation

struct Habit {

    // ストアドプロパティ
    var id: UUID
    var title: String
    var createAt: Date
    var completedDates: [Date]
    
    // イニシャライザ
    init(title: String) {
        self.id = UUID()
        self.title = title
        self.createAt = Date()
        self.completedDates = []
    }
    
    // 現在の継続回数
    var totalCount: Int { // 計算型プロパティ
        return completedDates.count
    }
    
    // 最後に実行した日
    var lastCompletedDate: Date? {
        return completedDates.max()
    }
    
    // 今日すでに実行済みか？
    var isCompletedToday: Bool {
        guard let lastDate = lastCompletedDate else { return false }
        return Calendar.current.isDateInToday(lastDate)
    }
    
}
