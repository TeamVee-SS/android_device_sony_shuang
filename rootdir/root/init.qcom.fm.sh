#!/system/bin/sh
# Copyright (c) 2009-2011, 2015, The Linux Foundation. All rights reserved.
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

setprop hw.fm.init 0

FM_MODE=$(getprop hw.fm.mode)
FM_VERSION="199217"
FM_LOG_TAG="qcom-fm"
FM_LOG_NAME="$0:"

loge() {
  /system/bin/log -t ${FM_LOG_TAG} -p e "${FM_LOG_NAME} $@"
}

logi() {
  /system/bin/log -t ${FM_LOG_TAG} -p i "${FM_LOG_NAME} $@"
}

logi "In FM Shell Script"
logi "FM Mode: ${FM_MODE}"
logi "FM Version: ${FM_VERSION}"

# Usage: fm_qsoc_patches <fm_chipVersion> <enable/disable WCM>
case ${FM_MODE} in
  "normal")
    logi "Inserting the radio transport module"
    echo 1 > /sys/module/radio_iris_transport/parameters/fmsmd_set
    /system/bin/fm_qsoc_patches ${FM_VERSION} 0
    ;;
  "wa_enable")
    /system/bin/fm_qsoc_patches ${FM_VERSION} 1
    ;;
  "wa_disable")
    /system/bin/fm_qsoc_patches ${FM_VERSION} 2
    ;;
  *)
    logi "Default case"
    /system/bin/fm_qsoc_patches ${FM_VERSION} 0
    ;;
esac

FM_QSOC_EXIT_CODE=$?
case ${FM_QSOC_EXIT_CODE} in
  0)
    logi "FM QSoC calibration and firmware download succeeded!"
    ;;
  *)
    loge "FM QSoC firmware download and/or calibration failed!"
    loge "Exited with code ${FM_QSOC_EXIT_CODE}"
    exit ${FM_QSOC_EXIT_CODE}
    ;;
esac

setprop hw.fm.init 1

exit 0
