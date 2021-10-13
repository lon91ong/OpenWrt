
find target/linux/ramips/* -maxdepth 0 ! -path '*/patches-5.4' -exec rm -Rf '{}' \;
echo -e "\q" | svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/ramips target/linux/ramips
rm -Rf target/linux/ramips/.svn
echo -e "\q" | svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/ramips/patches-5.4 target/linux/ramips/patches-5.4

rm -rf include/kernel-version.mk
wget -O include/kernel-version.mk https://raw.githubusercontent.com/coolsnowwolf/lede/master/include/kernel-version.mk

rm -rf package/feeds/custom/mt-drivers
svn export --force https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/mt-drivers package/feeds/custom/mt-drivers

rm -rf devices/common/patches
svn export --force https://github.com/kiddin9/OpenWrt_x86-r2s-r4s/tree/master/devices/common/patches devices/common/patches
sed -i 's/kmod-mt7615d_dbdc/kmod-mt7615d luci-app-mtwifi/g' target/linux/ramips/image/mt7621.mk

sed -i 's?admin/status/channel_analysis??' package/feeds/luci/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json

rm -Rf files/etc/profile.d/sysinfo.sh

sed -i 's/O2/Os/g' include/target.mk

# 修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
rm -rf package/feeds/custom/luci-theme-argon
git clone -b master https://github.com/jerrykuku/luci-theme-argon.git package/feeds/custom/luci-theme-argon

sed -i '/app_update/d' package/feeds/custom/luci-app-bypass/luasrc/controller/bypass.lua

sed -i 's/PKG_VERSION:=1/PKG_VERSION:=2/' package/feeds/custom/luci-app-bypass/Makefile

sed -i 's/ +unzip +lua-maxminddb//' package/feeds/custom/luci-app-bypass/Makefile

sed -i '/status_bottom/d' package/feeds/custom/luci-app-bypass/luasrc/model/cbi/bypass/base.lua

rm -Rf package/feeds/custom/luci-app-bypass/{root/www,root/usr/share/bypass/GeoLite2-Country.mmdb}
