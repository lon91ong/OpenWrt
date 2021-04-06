rm -Rf files/etc/profile.d/sysinfo.sh

rm -rf target/linux include
svn co https://github.com/x-wrt/x-wrt/trunk/target/linux target/linux
svn co https://github.com/x-wrt/x-wrt/trunk/include

sed -i 's?admin/status/channel_analysis??' package/feeds/luci/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json
rm -rf target/linux/ramips/files/drivers/net/ethernet/ralink
svn co https://github.com/x-wrt/x-wrt/trunk/target/linux/ramips/files/drivers/net/ethernet/ralink target/linux/ramips/files/drivers/net/ethernet/ralink

mv -f devices/k2-psg1218a/mt7620a_k2_psg1218a.dts ./target/linux/ramips/dts/
sed -i 's/10.0.0.1/192.168.77.1/g' devices/common/default-settings
sed -i 's/phicomm,psg1218a/&|\\\n\tk2,psg1218a/g' ./target/linux/ramips/mt7620/base-files/etc/board.d/02_network

cat >> ./target/linux/ramips/image/mt7620.mk <<EOF
define Device/k2_psg1218a
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Phicomm
  DEVICE_MODEL := PSG1218
  DEVICE_VARIANT:= Ax
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += psg1218 psg1218a
endef
TARGET_DEVICES += k2_psg1218a
EOF

sed -i 's/O2/Os/g' include/target.mk

sed -i '/unsplash.com/d' package/feeds/custom/luci-theme-edge/luasrc/view/themes/edge/sysauth.htm

sed -i 's?<img src="<%=media%>/background/3.jpg" alt="img"/>??' package/feeds/custom/luci-theme-edge/luasrc/view/themes/edge/sysauth.htm

rm -f package/feeds/custom/luci-theme-edge/htdocs/luci-static/edge/background/3.jpg

sed -i '/app_update/d' package/feeds/custom/luci-app-bypass/luasrc/controller/bypass.lua

sed -i 's/PKG_VERSION:=1/PKG_VERSION:=2/' package/feeds/custom/luci-app-bypass/Makefile

sed -i 's/ +unzip +lua-maxminddb//' package/feeds/custom/luci-app-bypass/Makefile

sed -i '/status_bottom/d' package/feeds/custom/luci-app-bypass/luasrc/model/cbi/bypass/base.lua

rm -Rf package/feeds/custom/luci-app-bypass/{root/www,root/usr/share/bypass/GeoLite2-Country.mmdb}
