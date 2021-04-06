mv -f devices/hiwifi-hc5962/mt7621_hiwifi_hc5962.dts ./target/linux/ramips/dts/
sed -i 's/10.0.0.1/192.168.77.1/g' devices/common/default-settings

sed -i ':a;N;$!ba;s/hiwifi,hc5962)/hiwifi,hc5962-32m\)/1' ./target/linux/ramips/mt7621/base-files/etc/board.d/02_network
sed -i ':a;N;$!ba;s/d-team,newifi-d2/hiwifi,hc5962|\\\n\t&/2' ./target/linux/ramips/mt7621/base-files/etc/board.d/02_network
#sed -i 's?admin/status/channel_analysis??' package/feeds/luci/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json
