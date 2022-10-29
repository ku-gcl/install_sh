# このシェルスクリプトについて
Ubuntuをインストールしたときに、シミュレーション環境やフライトコードを構築する。

スクリプト内で以下をダウンロードする。

- 1_install.sh
    - ROS
    - ROS-mocap-optitrack
    - Mission Planner
    - mono
    - Gazebo
    - Ardupilot

- Ardupilotのビルド内容を反映するため一旦再起動

- 2_install.sh
    - GAZEBO-ardupilot-ga
    
# shファイルに実行権限を付与する

```.bash
# bash
chmod 755 ./1_install.sh
```
# shファイルを実行する

```.bash
# bash
./1_install.sh
```