#!/system/bin/sh
# Copyright (c) 2009-2013, The Linux Foundation. All rights reserved.
# Copyright (C) 2016, TeamVeeSS. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

for file in /proc/sys/net/ipv6/conf/*
	do echo 0 > $file/accept_ra_defrtr
done
echo 1 > /proc/sys/net/ipv6/conf/default/accept_ra_defrtr

if [ -c /dev/msm_dsps -o -c /dev/sensors ]; then
	chmod -h 775 /persist/sensors
	chmod -h 664 /persist/sensors/sensors_settings
	chown -h system.root /persist/sensors/sensors_settings
	mkdir -p /data/misc/sensors
	chmod -h 775 /data/misc/sensors
	start sensors
fi

if ls /sys/module/qpnp_charger/parameters/charger_monitor; then
	chown -h root.system /sys/module/qpnp_charger/parameters/*
	chown -h root.system /sys/class/power_supply/battery/input_current_max
	chown -h root.system /sys/class/power_supply/battery/input_current_trim
	chown -h root.system /sys/class/power_supply/battery/input_current_settled
	chown -h root.system /sys/class/power_supply/battery/voltage_min
	chmod -h 0664 /sys/class/power_supply/battery/input_current_max
	chmod -h 0664 /sys/class/power_supply/battery/input_current_trim
	chmod -h 0664 /sys/class/power_supply/battery/input_current_settled
	chmod -h 0664 /sys/class/power_supply/battery/voltage_min
	chmod -h 0664 /sys/module/qpnp_charger/parameters/charger_monitor
	start charger_monitor
fi

case `getprop ro.board.platform` in
    "msm8610")
        echo 4 > /sys/module/lpm_levels/enable_low_power/l2
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/suspend_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu1/standalone_power_collapse/idle_enabled
        echo 1 > /sys/module/msm_pm/modes/cpu0/power_collapse/idle_enabled
        # Start mpdecision
        start mpdecision
    ;;
esac

case `getprop ro.boot.emmc` in
    "true")
        chown -h system /sys/devices/platform/rs300000a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown -h system /sys/devices/platform/rs300100a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac
