#!/system/bin/sh
# *********************************************************************
# * Copyright 2011 (C) Sony Ericsson Mobile Communications AB.        *
# * Copyright 2012 (C) Sony Mobile Communications AB.                 *
# * All rights, including trade secret rights, reserved.              *
# *********************************************************************
#

# use product specific script if exist.
if [ -f '/init.usbmode.product.sh' ] ; then
  exit `/init.usbmode.product.sh`
fi

TAG="usb"
VENDOR_ID=0FCE
PID_PREFIX=0
#/*[Arima JimCheng 20131014] support PC Companion++*/
CDROM_ENABLE=0
#/*[Arima JimCheng 20131014] support PC Companion--*/

get_pid_prefix()
{
  case $1 in
    "mass_storage")
      PID_PREFIX=E
      ;;

    "mass_storage,adb")
      PID_PREFIX=6
      ;;

    "mtp")
      PID_PREFIX=0
      ;;

    "mtp,adb")
      PID_PREFIX=5
      ;;

    "mtp,cdrom")
      PID_PREFIX=4
#/*[Arima JimCheng 20131014] support PC Companion++*/
      CDROM_ENABLE=1
#/*[Arima JimCheng 20131014] support PC Companion--*/
      ;;

    "mtp,cdrom,adb")
      PID_PREFIX=4
#/*[Arima JimCheng 20131014] support PC Companion++*/
      CDROM_ENABLE=1
#/*[Arima JimCheng 20131014] support PC Companion--*/
# Don't enable ADB for PCC mode.
      USB_FUNCTION="mtp,cdrom"
      ;;

    "rndis")
      PID_PREFIX=7
      ;;

    "rndis,adb")
      PID_PREFIX=8
      ;;

    "ncm")
      PID_PREFIX=1
      ;;

    "ncm,adb")
      PID_PREFIX=2
      ;;

    *)
      /system/bin/log -t ${TAG} -p e "unsupported composition: $1"
      return 1
      ;;
  esac

  return 0
}

set_engpid()
{
  case $1 in
#/*[Arima JimCheng 20131004] Modify SoMC USB PID ++*/
#    "mass_storage,adb") PID_PREFIX=6 ;;
#    "mtp,adb") PID_PREFIX=5 ;;
    "mass_storage,adb"|"adb,mass_storage")
      PID_PREFIX=6
      USB_FUNCTION="diag,adb,serial,mass_storage"
      ;;
    "mtp,adb"|"adb,mtp")
      PID_PREFIX=5
      USB_FUNCTION="diag,adb,serial,mtp"
      ;;
#/*[Arima JimCheng 20131004] Modify SoMC USB PID --*/
    *)
      /system/bin/log -t ${TAG} -p i "No eng PID for: $1"
      return 1
      ;;
  esac

  PID=${PID_PREFIX}146
#/*[Arima JimCheng 20131004] Modify SoMC USB PID ++*/
#  USB_FUNCTION=${1},serial,diag,rmnet
#/*[Arima JimCheng 20131004] Modify SoMC USB PID --*/
  echo diag > /sys/class/android_usb/android0/f_diag/clients
  echo smd,tty > /sys/class/android_usb/android0/f_serial/transports
  echo smd,bam > /sys/class/android_usb/android0/f_rmnet/transports

  return 0
}

PID_SUFFIX_PROP=$(/system/bin/getprop ro.usb.pid_suffix)
USB_FUNCTION=$(/system/bin/getprop sys.usb.config)
ENG_PROP=$(/system/bin/getprop persist.usb.eng)

get_pid_prefix ${USB_FUNCTION}
if [ $? -eq 1 ] ; then
  exit 1
fi

PID=${PID_PREFIX}${PID_SUFFIX_PROP}

echo 0 > /sys/class/android_usb/android0/enable
echo ${VENDOR_ID} > /sys/class/android_usb/android0/idVendor

if [ ${ENG_PROP} -eq 1 ] ; then
  set_engpid ${USB_FUNCTION}
fi

echo ${PID} > /sys/class/android_usb/android0/idProduct
/system/bin/log -t ${TAG} -p i "usb product id: ${PID}"

echo 0 > /sys/class/android_usb/android0/bDeviceClass
echo 0 > /sys/class/android_usb/android0/bDeviceSubClass
echo 0 > /sys/class/android_usb/android0/bDeviceProtocol
#/*[Arima JimCheng 20131014] support PC Companion++*/
echo ${CDROM_ENABLE} > /sys/class/android_usb/android0/f_mass_storage/lun/cdrom
#/*[Arima JimCheng 20131014] support PC Companion--*/

echo ${USB_FUNCTION} > /sys/class/android_usb/android0/functions
/system/bin/log -t ${TAG} -p i "enabled usb functions: ${USB_FUNCTION}"

echo 1 > /sys/class/android_usb/android0/enable

exit 0
