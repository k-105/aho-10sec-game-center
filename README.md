# aho-10sec-game-center

SwiftUI / SpriteKit ベースで iPhone 向けの「10選のアホゲームセンター」を構築する最小実装です。

## 現在の状態
- タイトル画面
- ホーム画面
- 3本のミニゲーム（ヅラ防衛 / ハンコ / 会議）
- リザルト画面
- UserDefaults ベースの保存
- Game Center / StoreKit 2 / 日替わりミッションの雛形

## 実装メモ
- Linux 環境のため、`xcodebuild` による実機向けコンパイル確認は未実施です。
- Xcode 側では iOS App ターゲットを作成し、`Aho10SecGameCenter/` 配下のファイルを追加してください。
- StoreKit 設定ファイルは `Resources/StoreKit/Aho10SecGameCenter.storekit` にあります。
