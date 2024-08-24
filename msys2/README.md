

-----------------------------------------------------------------------
- ★ msys2/mingw64 のインストール

-- 公式HPで最新バージョンを確認
　
    https://www.msys2.org/
	
-- install_msys2.bat の年月日を編集する

-- install_msys2.bat install_msys2_packages.bat のインストール先ドライブを編集する

-- install_msys2.bat install_msys2_packages.bat を Windows のHDDにコピーして実行
 パッケージのインストールで、「Y/n」を聞いてくるけど、操作の必要なし
 どちらも複数回実行して問題ない
 　前者はインストール済みなら、インストールは実行されない
 　校舎はインストール済みなら、最新版へのアップデートが行われる

-----------------------------------------------------------------------
- ★ .dotfiles のインストール

-- git clone https://github.com/hiraieject/.dotfiles を実行

-- mingw64 シェル起動して、以下を実行

    cd .dotfiles
	sh 00_bootstrap_msys2.sh

-- シェルを一旦終了、再度起動して、以下を実行

    cd .dotfiles
	sh 00_bootstrap_common.sh

