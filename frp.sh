#!/usr/bin/env bash
echo "1. 安装frp"
echo "2. 卸载frp"
################安装状态
if [ -d "/usr/local/frp" ];
then
   echo -e "\033[34m当前状态: 已安装\033[0m"
else
   echo -e "\033[41;37m当前状态: 未安装\033[0m"
fi
read -p "请用数字选择安装/删除: " i
case "$i" in
1)
  echo "开始安装..."
  echo "正在下载frp脚本..."
  wget  https://github.com/tiny-wolf/one-step-install-frp/blob/master/frp_install.sh -O frp_install.sh
  bash frp_install.sh
  ;;
2)
  echo "开始删除..."
rm -rf /usr/local/frp/
rm -rf /usr/local/bin/frps
rm -rf /usr/local/bin/frpc
  ;;
esac

