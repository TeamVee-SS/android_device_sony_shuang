/*
   Copyright (c) 2014, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include "init_msm.h"

void init_msm_properties(unsigned long msm_id, unsigned long msm_ver, char *board_type)
{
    char device[PROP_VALUE_MAX];
    char bbversion[92];
    FILE *fp;

    UNUSED(msm_id);
    UNUSED(msm_ver);
    UNUSED(board_type);

    fp = popen("/system/xbin/strings /dev/block/platform/msm_sdcc.1/by-name/TA | /system/bin/grep -o -e 'D2004' -e 'D2005' -e 'D2104' -e 'D2105' -e 'D2114' | /system/xbin/head -1", "r");
    fgets(bbversion, sizeof(bbversion), fp);
    pclose(fp);

    property_set("ro.product.device", bbversion);
    property_set("ro.product.model", bbversion);

    if (strstr(bbversion, "D2004") || strstr(bbversion, "D2005")) {
        property_set("persist.radio.multisim.config", "none");
        property_set("persist.multisim.config", "none");
        property_set("ro.multi.rild", "false");
    } else if (strstr(bbversion, "D2104") || strstr(bbversion, "D2105") || strstr(bbversion, "D2114")) {
        property_set("persist.radio.multisim.config", "none");
        property_set("persist.multisim.config", "none");
        property_set("ro.multi.rild", "false");
    } else {
        property_set("persist.test.config", "WTF");
    };

    property_get("ro.product.device", device);
    ERROR("Found %s baseband setting build properties for %s device\n", bbversion, device);
}
