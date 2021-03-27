find target/linux/ramips/* -maxdepth 0 ! -path '*/patches-5.4' -exec rm -Rf '{}' \;
echo -e "\q" | svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/ramips target/linux/ramips
rm -Rf target/linux/ramips/.svn
echo -e "\q" | svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/ramips/patches-5.4 target/linux/ramips/patches-5.4

sed -i 's?admin/status/channel_analysis??' package/feeds/luci/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json
rm -f ./target/linux/ramips/image/mt7621.mk
cp -f $GITHUB_WORKSPACE/devices/hiwifi-hc5962/mt7621_hiwifi_hc5962-spi.dts ./target/linux/ramips/dts/
cp -f $GITHUB_WORKSPACE/devices/hiwifi-hc5962/mt7621.mk ./target/linux/ramips/image/
sed -i 's/^[ \t]*//g' ./target/linux/ramips/image/mt7621.mk
