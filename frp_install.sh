#!/usr/bin/env bash
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
                wget https://github.com/fatedier/frp/releases/download/v0.33.0/frp_0.33.0_linux_amd64.tar.gz -O frp_0.33.0_linux_amd64.tar.gz
            fi

            if [[ $output =~ "arm" ]];
             then
               echo "您的设备为 $output 架构，开始安装 $output 包"
               wget https://github.com/fatedier/frp/releases/download/v0.33.0/frp_0.33.0_linux_arm64.tar.gz -O frp_0.33.0_linux_amd64.tar.gz
            fi

             if [[ $output =~ "mips" ]];
             then
                echo "您的设备为 $output 架构，开始安装 $output 包"
                wget https://github.com/fatedier/frp/releases/download/v0.33.0/frp_0.33.0_linux_mips64.tar.gz -O frp_0.33.0_linux_amd64.tar.gz
            fi

    tar -zxvf frp_0.33.0_linux_amd64.tar.gz
    cd /usr/local/frp/frp_0.33.0_linux_amd64
#    touch /etc/systemd/system/frps.service
#    service=/etc/systemd/system/frps.service
#    echo -e "[Unit] \n Description=frps daemon \n After=syslog.target network.target \n Wants=network.target" > $service
#    echo -e "[Service] \n Type=simple \n ExecStart=/usr/local/frp/frp_0.33.0_linux_amd64/frps -c /usr/local/frp/frp_0.33.0_linux_amd64/frps.ini" >> $service
#    echo -e "[Install] \n WantedBy=multi-user.target" >> $service
#                systemctl start frps
#                systemctl enable frps
                ln -s /usr/local/frp/frp_0.33.0_linux_amd64/frpc /usr/local/bin/frpc
                ln -s /usr/local/frp/frp_0.33.0_linux_amd64/frps /usr/local/bin/frps
                echo "安装已经完成啦，看看有没有什么报错信息"
                echo "目录为/usr/local/frp，具体配置您可以到这里查阅：http://116.62.5.97:8181/docs/network_Configration/network_Configration-1c8pb2emeqshp"
                echo "或者到GitHub上查看更多frp的配置样本：https://github.com/fatedier/frp/blob/master/README_zh.md"
                rm -rf ./frp_install.sh
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
