rm -Rf files/etc/profile.d/sysinfo.sh
rm -rf target/linux/ramips
svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/ramips target/linux/ramips
rm -rf target/linux/ramips/files/drivers/net/ethernet/ralink
svn co https://github.com/x-wrt/x-wrt/trunk/target/linux/ramips/files/drivers/net/ethernet/ralink target/linux/ramips/files/drivers/net/ethernet/ralink
sed -i 's/10.0.0.1/192.168.77.1/g' devices/common/default-settings
#sed -i 's/<0x50000 0x7b0000>/<0x50000 0xfb0000>/g' target/linux/ramips/dts/mt7620a_phicomm_psg1218*
mv -f devices/k2-psg1218a/mt7620a_phicomm_psg1218a.dts ./target/linux/ramips/dts/
