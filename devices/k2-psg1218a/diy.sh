rm -Rf files/etc/profile.d/sysinfo.sh

rm -rf target/linux include
svn co https://github.com/x-wrt/x-wrt/trunk/target/linux target/linux
svn co https://github.com/x-wrt/x-wrt/trunk/include

sed -i 's?admin/status/channel_analysis??' package/feeds/luci/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json
rm -rf target/linux/ramips/files/drivers/net/ethernet/ralink
svn co https://github.com/x-wrt/x-wrt/trunk/target/linux/ramips/files/drivers/net/ethernet/ralink target/linux/ramips/files/drivers/net/ethernet/ralink

sed -i 's/10.0.0.1/192.168.77.1/g' devices/common/default-settings
sed -i 's/<0x50000 0x7b0000>/<0x50000 0xfb0000>/g' target/linux/ramips/dts/mt7620a_phicomm_psg1218a.dts
