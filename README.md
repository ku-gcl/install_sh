# このシェルスクリプトについて

Ubuntu をインストールしたときに、シミュレーション環境やフライトコードを構築するためのシェルスクリプト。

## インストール内容

シェルスクリプト内で以下をダウンロードする。

| No. | ファイル名   | インストール内容    | 説明                                                                       |
| :-: | :----------- | :------------------ | :------------------------------------------------------------------------- |
|  1  | 1_install.sh | ROS Noetic          | ROS                                                                        |
|     |              | ROS-mocap-optitrack | OptiTrack でのセンシング情報を ROS で配信するための Plugin                 |
|     |              | Mission Planner     | Pixhawk への書き込み、Pixhawk からのセンシング情報の取得をするためのアプリ |
|     |              | mono                | Linux で exe ファイルを実行するためのアプリ                                |
|     |              | Gazebo              | ロボットを 3 次元空間に描画するアプリ                                      |
|     |              | Ardupilot           | Pixhawk に搭載するフライトコード                                           |
|     |              | VSCode              | コードエディタ                                                             |
|  2  | 2_install.sh | gazebo_ardupilot    | Gazebo と Ardupilot を連携するための Plugin                                |
|     |              | mavros              | フライトコードへの API を提供する Plugin                                   |
|     |              | px4_sim_pkg         | ミッションを定義した自作コード                                             |
|  3  | 3_install.sh | VSCode              | コードエディタ                                                             |
|     |              | ROS Noetic          | ROS                                                                        |
|     |              | mavros              | フライトコードへの API を提供する Plugin                                   |
|     |              | px4_sim_pkg         | ミッションを定義した自作コード                                             |

## インストール手順

### Ubuntu PC の場合

#### コードのダウンロード

GitHub から以下のコマンドでクローン（ダウンロード）する。

```bash
# bash
# HOMEディレクトリに移動
cd ~/
# http通信でクローンするとき
git clone https://github.com/ku-gcl/install_sh.git
# sshでクローンする時
# git clone git@github.com:ku-gcl/install_sh.git
```

#### sh ファイルに実行権限を付与する

```bash
# bash
# install_shフォルダに移動
cd ~/install_sh
chmod 755 1_install.sh 2_install.sh
```

#### sh ファイルを実行する

```bash
# bash
cd ~/install_sh
./1_install.sh
# ダウンロード開始
# Ardupilotのビルド内容を反映するため一旦再起動される。

# --再起動後--
cd ~/install_sh
./2_install.sh
```

### Raspberry Pi の場合

```bash
git clone https://github.com/ku-gcl/install_sh.git
cd ~/install_sh
chmod 755 3_raspberrypi_setup.sh
./3_raspberrypi_setup.sh

# 再起動
sudo reboot
```

## alias の追加

ターミナルで以下のコマンドを追加。

```bash
# VSCodeがインストールされている場合
code ~/.bashrc

# VSCodeが無い場合
nano ~/.bashrc
```

ファイルが開いたら、最下行に、[alias.txt](alias.txt)の内容を全コピー＆ペーストする。
追加した alias を有効化するために、以下のコマンドを実行。

```bash
source ~/.bashrc
```

以降は追加した alias が使用できるようになる。

使用例

```bash
# aliasを追加
edit_command

# aliasを有効化
add_command

# gazebo起動
gazebo_copter
```

### VSCode の手動インストールの手順

以下のリンクから、VSCode の deb ファイルをダウンロードすること。

[https://code.visualstudio.com/download](https://code.visualstudio.com/download)

以下のコマンドを実行

```bash
cd ~/Downloads

sudo apt install 先ほどインストールしたvscodeのdebファイル
# 例
# sudo apt install ./code_1.73.1-1667966450_arm64.deb
```
