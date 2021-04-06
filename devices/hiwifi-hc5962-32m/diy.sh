mv -f devices/hiwifi-hc5962-32m/mt7621_hiwifi_hc5962-32m.dts ./target/linux/ramips/dts/
sed -i 's/10.0.0.1/192.168.77.1/g' devices/common/default-settings
sed -i ':a;N;$!ba;s/hiwifi,hc5962/&|\\\n\t&-32m/1' ./target/linux/ramips/mt7621/base-files/etc/board.d/02_network
sed -i ':a;N;$!ba;s/hiwifi,hc5962)/hiwifi,hc5962-32m\)/1' ./target/linux/ramips/mt7621/base-files/etc/board.d/02_network
cat >> ./target/linux/ramips/image/mt7621.mk <<EOF
define Device/hiwifi_hc5962-32m
  $(Device/uimage-lzma-loader)
  IMAGE_SIZE := 32384k
  DEVICE_VENDOR := HiWiFi
  DEVICE_MODEL := HC5962-32M
  DEVICE_PACKAGES := kmod-mt7603 kmod-mt76x2 wpad-openssl
endef
TARGET_DEVICES += hiwifi_hc5962-32m
EOF

#sed -i 's?admin/status/channel_analysis??' package/feeds/luci/luci-mod-status/root/usr/share/luci/menu.d/luci-mod-status.json
