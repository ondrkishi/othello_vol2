# othello_vol2

Flutterで作成したオセロアプリ

# 目的

riverpodを使ったことが無かったのでその学習のため

# 状態管理

hooks_riverpod（ただしhooksについては現状未使用）

# 設計
MVVM

### M(Model)
オセロのゲームの状態を管理するデータクラスやページの定義などを格納
riverpodで使用するデータに関してはfreezedでイミュータブル型で生成

### V(View)

見た目
UIを生成して操作に応じたイベントをVMに送信する

### VM(ViewModel)

riverpodのプロバイダー、StateNotifierの定義
オセロをする上での裏側の処理はここにまとまっている
