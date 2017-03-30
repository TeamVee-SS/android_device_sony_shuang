/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

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
#include <fcntl.h>
#include <unistd.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#define MODELNUMBER "/proc/modelnumber"
#define BUF_SIZE         64
#define STRCONV_(x)      #x
#define STRCONV(x)       "%" STRCONV_(x) "s"
static char tmp[BUF_SIZE];

void ds_properties();

static int read_file2(const char *fname, char *data, int max_size)
{
    int fd, rc;

    if (max_size < 1)
        return 0;

    fd = open(fname, O_RDONLY);
    if (fd < 0) {
        ERROR("failed to open '%s'\n", fname);
        return 0;
    }

    rc = read(fd, data, max_size - 1);
    if ((rc > 0) && (rc < max_size))
        data[rc] = '\0';
    else
        data[0] = '\0';
    close(fd);

    return 1;
}

void ds_properties()
{
        property_set("persist.radio.multisim.config", "dsds");
        property_set("persist.radio.dont_use_dsd", "true");
        property_set("ro.telephony.ril.config", "simactivation");
}

void vendor_load_properties()
{
    std::string device;
    int rc;
    static char modelnumber[BUF_SIZE];

    rc = read_file2(MODELNUMBER, tmp, sizeof(tmp));
    if (rc) {
        sscanf(tmp, STRCONV(BUF_SIZE), modelnumber);
    }

    property_set("ro.product.device", modelnumber);
    property_set("ro.product.model", modelnumber);

    if (strstr(modelnumber, "D2004")) {
        property_set("ro.build.description", "D2004-user 4.4.2 20.1.A.2.19 7Pd_Xw release-keys");
        property_set("ro.build.fingerprint", "Sony/D2004/D2004:4.4.2/20.1.A.2.19/7Pd_Xw:user/release-keys");
    } else if (strstr(modelnumber, "D2005")) {
        property_set("ro.build.description", "D2005-user 4.4.2 20.1.A.2.19 7Pd_Xw release-keys");
        property_set("ro.build.fingerprint", "Sony/D2005/D2005:4.4.2/20.1.A.2.19/7Pd_Xw:user/release-keys");
    } else if (strstr(modelnumber, "D2104")) {
        ds_properties();
        property_set("ro.build.description", "D2104-user 4.4.2 20.1.B.2.29 4rd_Xw release-keys");
        property_set("ro.build.fingerprint", "Sony/D2104/D2104:4.4.2/20.1.B.2.29/4rd_Xw:user/release-keys");
    } else if (strstr(modelnumber, "D2105")) {
        ds_properties();
        property_set("ro.build.description", "D2105-user 4.4.2 20.1.B.2.29 4rd_Xw release-keys");
        property_set("ro.build.fingerprint", "Sony/D2105/D2105:4.4.2/20.1.B.2.29/4rd_Xw:user/release-keys");
    } else if (strstr(modelnumber, "D2114")) {
        ds_properties();
        property_set("ro.build.description", "D2114-user 4.4.2 20.1.B.2.30 4bd_Xw release-keys");
        property_set("ro.build.fingerprint", "Sony/D2114/D2114:4.4.2/20.1.B.2.30/4bd_Xw:user/release-keys");
    };

    device = property_get("ro.product.device");
    ERROR("setting build properties for %s device\n", device.c_str());
}
