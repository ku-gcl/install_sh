#!/bin/bash
cd ~/Downloads
# URLからMission Plannerのzipファイルをダウンロード
wget https://firmware.ardupilot.org/Tools/MissionPlanner/MissionPlanner-latest.zip
# zipファイルを解凍する
# 以下の記事より、文字化けを防ぐため、zipファイルの解凍にはunarを使用する。
# https://qiita.com/supersaiakujin/items/c6b54e9add21d375161f
sudo apt install unar
# HOME directoryにzipを解凍
cd ~/
unar ~/Downloads/MissionPlanner-latest.zip
# MissionPlanner-latestというフォルダが作成される。
# MissionPlannerというフォルダ名に変更
mv ~/MissionPlanner-latest ~/MissionPlanner