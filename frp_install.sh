#!/usr/bin/env bash

#---------------------------------------------------------------
#welcome to use frp one setup install porgamme
#author:sddkwolf time:2020-11-23 15:16:59"
#---------------------------------------------------------------


function install {
    clear
    read -r -p "确认安装frp吗？ [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
            echo "开始安装，安装地址为/usr/local/frp....."
              mkdir -p /usr/local/frp
              cd /usr/local/frp
              echo "开始下载frp包"
            #判断CPU架构下载不同的安装包
            output=`arch`
            if [[ $output =~ "x86" ]];
             then
                echo "您的设备为 $output 架构，开始安装 $output 包"
                wget http://litterdevice.top:8000/frp/frp_0.34.1_linux_amd64.tar.gz -O frp-packet.tar.gz
            fi

            if [[ $output =~ "arm" ]];
             then
               echo "您的设备为 $output 架构，开始安装 $output 包"
               wget http://litterdevice.top:8000/frp/frp_0.34.1_linux_arm64.tar.gz -O frp-packet.tar.gz
            fi

             if [[ $output =~ "mips" ]];
             then
                echo "您的设备为 $output 架构，开始安装 $output 包"
                wget http://litterdevice.top:8000/frp/frp_0.34.1_linux_mips64.tar.gz -O frp-packet.tar.gz
            fi

    tar -zxvf frp-packet.tar.gz
                    ###############压缩包内的名称
    cd /usr/local/frp/frp_0.34.1
                ln -s /usr/local/frp/frp_0.34.1/frpc /usr/local/bin/frpc
                ln -s /usr/local/frp/frp_0.34.1/frps /usr/local/bin/frps
                chmod -R 755 /usr/local/frp/frp_0.34.1
                echo "安装已经完成啦，看看有没有什么报错信息"
                echo "目录为/usr/local/frp，具体配置您可以到这里查阅：http://116.62.5.97:8181/docs/network_Configration/network_Configration-1c8pb2emeqshp"
                echo "或者到GitHub上查看更多frp的配置样本：https://github.com/fatedier/frp/blob/master/README_zh.md"
                ;;

    [nN][oO]|[nN])
                echo "退出安装脚本"
                exit
                ;;

*)
                echo "输入错了，再确认一下"
                exit 1
                ;;
esac
}

function un_install {
  clear
  read -r -p "确认删除FRP吗？这将会清空/usr/local/frp/下面的所有内容! [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
  echo "开始删除..."
    rm -rf /usr/local/frp/
    rm -rf /usr/local/bin/frps
    rm -rf /usr/local/bin/frpc
		;;

    [nN][oO]|[nN])
	  exit 1
       	;;

    *)
		echo "Invalid input..."
		exit 1
		;;
esac
}

function start_frpc {
  clear
  frpc -c /usr/local/frp/frp_0.34.1/frpc.ini
}

function start_frps {
  clear
  frpc -c /usr/local/frp/frp_0.34.1/frps.ini
}


function menu {
clear
echo
echo -e "\t\t\tOne-step—instll-frp"
echo "  "
echo -e "\t\t\t1. 安装frp"
echo -e "\t\t\t2. 卸载frp"
echo -e "\t\t\t3. 启动frpc"
echo -e "\t\t\t4. 启动frps"
echo "  "
echo -en "\t\t\tEnter option Ctrl+C to exit:"
echo "  "

###########################
if [ -d "/usr/local/frp" ];
then
   echo -e "\t\t\t\033[34m当前状态: 已安装\033[0m"
else
   echo -e "\t\t\t\033[41;37m当前状态: 未安装\033[0m"
fi
######################
read -n 1 option
}




while [ 1 ]
do
    menu
    case $option in
    0)
        break ;;
    1)
        install ;;
    2)
        un_install ;;
    3)
        start_frpc ;;
    4)
        start_frps ;;
    *)
        clear
        echo "sorry,wrong selection" ;;
    esac
    echo -en "\n\n\t\thit any to contunue"
    read -n 1 line
done
clear
