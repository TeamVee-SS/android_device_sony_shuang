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

#include <stdio.h>
#include <stdlib.h>

#include "log.h"
#include "property_service.h"
#include "util.h"
#include "vendor_init.h"

#include "init_msm.h"

void init_msm_properties(unsigned long msm_id, unsigned long msm_ver,
                         char *board_type)
{
    char baseband_version[92];
    char model_number[92];
    FILE *get_model;

    UNUSED(msm_id);
    UNUSED(msm_ver);
    UNUSED(board_type);

    // Print only supported devices
    get_model =
        popen("/sbin/busybox printf $(/sbin/busybox strings "
              "/dev/block/platform/msm_sdcc.1/by-name/LTALabel | /sbin/busybox "
              "grep -o -e 'D2004' -e 'D2005' -e 'D2104' -e 'D2105' -e 'D2114')",
              "r");
    fgets(model_number, sizeof(model_number), get_model);
    pclose(get_model);

    // Check if it's Xperia D20/D21 Series
    if (strstr(model_number, "D20") || strstr(model_number, "D21")) {
        property_set("ro.product.device", model_number);
        property_set("ro.product.model", model_number);
    } else {
        property_set("ro.product.device", "falconss");
        property_set("ro.product.model", "falconss");
    };

    // All of D21 Series is DualSIM
    if (strstr(model_number, "D21")) {
        property_set("persist.radio.multisim.config", "dsds");
        property_set("persist.multisim.config", "dsds");
        property_set("ro.multi.rild", "true");
    };

    // Get baseband version just for log
    property_get("gsm.version.baseband", baseband_version);
    ERROR("Found %s gsm baseband setting build properties for %s device\n",
          baseband_version, model_number);
}
