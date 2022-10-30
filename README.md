# このシェルスクリプトについて
Ubuntuをインストールしたときに、シミュレーション環境やフライトコードを構築するためのシェルスクリプト。
シェルスクリプト内で以下をダウンロードする。

- 1_install.sh
    - ROS
    - ROS-mocap-optitrack
        - OptiTrackでのセンシング情報をROSで配信するためのPlugin
    - Mission Planner
        - Pixhawkへの書き込み、Pixhawkからのセンシング情報の取得をするためのアプリ
    - mono
        - Linuxでexeファイルを実行するためのアプリ
    - Gazebo
        - ロボットを3次元空間に描画するアプリ
    - Ardupilot
        - Pixhawkに搭載するフライトコード

- 1_install.shが終了した後、Ardupilotのビルド内容を反映するため一旦再起動する。

- 2_install.sh
    - gazebo-ardupilot
        - GazeboとArdupilotを連携するためのPlugin

# コードのダウンロード
GitHubから以下のコマンドでクローン（ダウンロード）する。

```.bash
# bash
# HOMEディレクトリに移動
cd ~/
# http通信でクローンするとき
git clone https://github.com/ku-gcl/install_sh.git
# sshでクローンする時
# git clone git@github.com:ku-gcl/install_sh.git
```
    
# shファイルに実行権限を付与する

```.bash
# bash
# install_shフォルダに移動
cd ~/install_sh
chmod 755 ./1_install.sh
chmod 755 ./2_install.sh
```
# shファイルを実行する

```.bash
# bash
cd ~/install_sh
./1_install.sh
# ダウンロード開始
# Ardupilotがダウンロードされたら一旦再起動される。
# --再起動後--
cd ~/install_sh
./2_install.sh
```

