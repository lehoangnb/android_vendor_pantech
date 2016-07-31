#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 14329856 598d85fedcf6af700f81373d15942eafbaa2ee12 11556864 966d6548dee300e7e4e0b793cd305e8f3f199bcc
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:14329856:598d85fedcf6af700f81373d15942eafbaa2ee12; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:11556864:966d6548dee300e7e4e0b793cd305e8f3f199bcc EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 598d85fedcf6af700f81373d15942eafbaa2ee12 14329856 966d6548dee300e7e4e0b793cd305e8f3f199bcc:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
