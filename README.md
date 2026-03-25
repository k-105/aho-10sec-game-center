# aho-10sec-game-center

SwiftUI / SpriteKit ベースで iPhone 向けの「アホ10秒ゲームセンター」を構築する最小実装です。

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

## GitHub サインイン（アカウント/パスワードが分からない場合）
添付画像の画面は「パスワード」ではなく **Personal Access Token (PAT)** を使う方式です。

- **Account**: GitHub のユーザー名（`@` は不要）
- **Token**: GitHub で作成した Personal Access Token

### 手順
1. GitHub にブラウザでログイン
2. 右上プロフィール → **Settings** → **Developer settings** → **Personal access tokens**
3. 必要なスコープ（画面にある `admin:public_key` / `repo` / `user`）を付けてトークン作成
4. 発行直後のトークン文字列をコピーして、アプリの **Token** 欄に貼り付ける

> 注意: トークンは作成時しか全文表示されません。忘れた場合は再表示できないため、新しく作り直してください。
