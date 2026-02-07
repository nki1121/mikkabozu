import Foundation

// おじさんの見た目を決定するロジック
struct OjisanManager {
    
    /// 習慣の状態から、おじさんの見た目（髪型・表情）を返す関数
    static func determineState(for habit: Habit) -> HairStyle {
        
        // 継続数
        let count = habit.totalCount
        
        // 継続数による成長判定
        switch count {
        case 0:
            return .bald
            
        case 1...3:
            return .vellusHair
            
        case 4...7:
            return .barcode
            
        case 8...14:
            return .pompadour
            
        case 15...21:
            return .afro
        
        default: // 22日以上は全て「アフロ・ゴッド」
            return .afroGod
        }
    }
}
