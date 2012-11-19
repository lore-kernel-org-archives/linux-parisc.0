From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 343/493] parisc: remove use of __devinitdata
Date: Mon, 19 Nov 2012 13:24:52 -0500
Message-ID: <1353349642-3677-343-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: gregkh@linuxfoundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

CONFIG_HOTPLUG is going away as an option so __devinitdata is no
longer needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org> 
Cc: Helge Deller <deller@gmx.de> 
Cc: linux-parisc@vger.kernel.org 
---
 arch/parisc/kernel/hardware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/hardware.c b/arch/parisc/kernel/hardware.c
index 80e4135..f7752f6 100644
--- a/arch/parisc/kernel/hardware.c
+++ b/arch/parisc/kernel/hardware.c
@@ -38,7 +38,7 @@
  *	so don't reference this table after starting the init process
  */
  
-static struct hp_hardware hp_hardware_list[] __devinitdata = {
+static struct hp_hardware hp_hardware_list[] = {
 	{HPHW_NPROC,0x01,0x4,0x0,"Indigo (840, 930)"},
 	{HPHW_NPROC,0x8,0x4,0x01,"Firefox(825,925)"},
 	{HPHW_NPROC,0xA,0x4,0x01,"Top Gun (835,834,935,635)"},
@@ -1230,7 +1230,7 @@ static struct hp_cpu_type_mask {
 	unsigned short model;
 	unsigned short mask;
 	enum cpu_type cpu;
-} hp_cpu_type_mask_list[] __devinitdata = {
+} hp_cpu_type_mask_list[] = {
 
 	{ 0x0000, 0x0ff0, pcx    },  /* 0x0000 - 0x000f */
 	{ 0x0048, 0x0ff0, pcxl   },  /* 0x0040 - 0x004f */
-- 
1.8.0

