#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/10.10.10.2/g' openwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

#3. Replace with JerryKuKu’s Argon
#rm openwrt/package/lean/luci-theme-argon -rf

#4. 版本号里显示一个自己的名字
sed -i "s/OpenWrt /Lunseil build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" openwrt/package/lean/default-settings/files/zzz-default-settings

#5. 修改主机名
sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt'' openwrt/package/lean/default-settings/files/zzz-default-settings

#6. 替换默认主题为 luci-theme-netgear
sed -i 's/luci-theme-bootstrap/luci-theme-netgear/' feeds/luci/collections/luci/Makefile
