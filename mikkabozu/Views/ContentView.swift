import SwiftUI

struct ContentView: View {
    // 動作確認用の「習慣データ」
    @State private var demoHabit = Habit(title: "Swiftの勉強")
    
    // おじさんの現在の髪型を計算
    var currentHairStyle: HairStyle {
        return OjisanManager.determineState(for: demoHabit)
    }

    var body: some View {
        VStack(spacing: 30) {
            
            VStack(spacing: 10) {
                Text(demoHabit.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("継続日数: \(demoHabit.totalCount)日")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                Text("現在の状態: \(currentHairStyle.displayName)")
                    .font(.caption)
                    .padding(5)
                    .background(Color.yellow.opacity(0.3))
                    .cornerRadius(5)
            }
            .padding(.top, 50)
            
            // おじさん表示
            ZStack {

                // 髪型
                Image(currentHairStyle.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    
            }
            .frame(height: 350)
            
            Spacer()
            
            // 操作エリア：実行ボタン
            Button(action: {
                // ボタンを押すと、現在時刻をログに追加
                let newLog = Date()
                demoHabit.completedDates.append(newLog)
                
                // 感覚的なフィードバック（振動）
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            }) {
                Text("今日もやった！")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)
            
            // デバッグ用：リセットボタン
            Button("リセット（ハゲに戻す）") {
                demoHabit.completedDates = []
            }
            .foregroundColor(.red)
            .padding(.bottom, 20)
        }
        .padding()
    }
}

// プレビュー用
#Preview {
    ContentView()
}
