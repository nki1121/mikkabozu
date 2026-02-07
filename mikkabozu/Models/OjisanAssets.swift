import Foundation

// MARK: - おじさんの表情定義

// おじさんの表情
enum OjisanExpression: String, Codable, CaseIterable {
    case normal = "ojisan_normal"
    case shy = "ojisan_shy"
}

// MARK: - 髪型・装着物定義

// 頭に生えるもの
enum HairStyle: String, Codable, CaseIterable {
    case bald = "ojisan_normal"             // ハゲ
    case vellusHair = "vellus_hair"  // 産毛
    case barcode = "ojisan_hair_barcode"           // バーコード
    case pompadour = "ojisan_hair_pompadour"       // リーゼント
    case afro = "ojisan_hair_afro"                 // アフロ
    case afroGod = "ojisan_hair_afro_god"         // アフロ・ゴッド
     
    var displayName: String {
        switch self {
        case .bald: return "すっぴん"
        case .vellusHair: return "産毛"
        case .barcode: return "哀愁のバーコード"
        case .pompadour: return "すっぴん"
        case .afro: return "アフロ"
        case .afroGod: return "アフロ・ゴッド"
        }
    }
}
