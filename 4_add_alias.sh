#!/bin/bash

BASHRC="$HOME/.bashrc"

ALIASES=$(cat << 'EOF'

# Custom Aliases
alias add_command='source ~/.bashrc'
alias edit_command='nano ~/.bashrc'
alias cm='cd ~/catkin_ws && catkin_make'
alias cs='cd ~/catkin_ws/src'
alias cw='cd ~/catkin_ws'
alias ros_add='source ~/catkin_ws/devel/setup.bash'
alias ros_set_ip='export ROS_IP=192.168.11.7'
alias ros_set_uri='export ROS_MASTER_URI=http://192.168.11.7:11311'
alias roscore_kill='killall -9 roscore && killall -9 rosmaster'

EOF
)

# 既にエイリアスが存在するかチェックして、なければ追加
if ! grep -q "Custom Aliases" "$BASHRC"; then
    echo "$ALIASES" >> "$BASHRC"
    echo "エイリアスを~/.bashrcに追加しました。"
else
    echo "エイリアスは既に~/.bashrcに存在します。"
fi


SOURCE_CMD="source ~/catkin_ws/devel/setup.bash"
# 既に追加されているか確認
if ! grep -Fxq "$SOURCE_CMD" "$BASHRC"; then
    echo "$SOURCE_CMD" >> "$BASHRC"
    echo "✅ $SOURCE_CMD を ~/.bashrc に追加しました。"
else
    echo "⚠️ 既に ~/.bashrc に $SOURCE_CMD が存在します。"
fi

# .bashrc を再読み込み
source "$BASHRC"
echo "🔄 ~/.bashrc を再読み込みしました。"