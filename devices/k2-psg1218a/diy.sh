sed -i 's/10.0.0.1/192.168.77.1/g' devices/common/default-settings
sed -i 's/<0x50000 0x7b0000>/<0x50000 0xfb0000>/g' target/linux/ramips/dts/mt7620a_phicomm_psg1218.dtsi
sed -i 's/<0x50000 0x7b0000>/<0x50000 0xfb0000>/g' target/linux/ramips/dts/mt7620a_phicomm_psg1218a.dts
