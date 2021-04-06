find target/linux/ramips/* -maxdepth 0 ! -path '*/patches-5.4' -exec rm -Rf '{}' \;
echo -e "\q" | svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/ramips target/linux/ramips
rm -Rf target/linux/ramips/.svn
echo -e "\q" | svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/ramips/patches-5.4 target/linux/ramips/patches-5.4
rm -rf target/linux/ramips/files/drivers/net/ethernet/ralink
svn co https://github.com/x-wrt/x-wrt/trunk/target/linux/ramips/files/drivers/net/ethernet/ralink target/linux/ramips/files/drivers/net/ethernet/ralink

mv -f devices/hiwifi-hc5962/mt7621_hiwifi_hc5962.dts ./target/linux/ramips/dts/
sed -i 's/10.0.0.1/192.168.77.1/g' devices/common/default-settings

sed -i ':a;N;$!ba;s/hiwifi,hc5962)/&|\\\n\thiwifi,hc5962-32m\)/1' ./target/linux/ramips/mt7621/base-files/etc/board.d/02_network
sed -i ':a;N;$!ba;s/d-team,newifi-d2/&|\\\n\thiwifi,hc5962/2' ./target/linux/ramips/mt7621/base-files/etc/board.d/02_network

sed -i 's?admin/status/channel_analysis??' package/feeds/luci/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json
