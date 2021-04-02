find target/linux/ramips/* -maxdepth 0 ! -path '*/patches-5.4' -exec rm -Rf '{}' \;
echo -e "\q" | svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/ramips target/linux/ramips
rm -Rf target/linux/ramips/.svn
echo -e "\q" | svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/ramips/patches-5.4 target/linux/ramips/patches-5.4

cp -f $GITHUB_WORKSPACE/devices/hiwifi-hc5962/mt7621_hiwifi_hc5962.dts ./target/linux/ramips/dts/mt7621_hiwifi_hc5962.dts
sed -i 's/10.0.0.1/192.168.77.1/g' devices/common/default-settings

sed -i 's?admin/status/channel_analysis??' package/feeds/luci/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json
