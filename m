From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH] add pa8900 CPUs to hardware inventory
Date: Wed, 20 Feb 2008 15:53:02 -0600
Message-ID: <1203544382.3109.46.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch adds the known pa8900 CPUs to the inventory list and removes
the Crestone Peak one which apparently never escaped into the wild.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

---

diff --git a/arch/parisc/kernel/hardware.c b/arch/parisc/kernel/hardware.c
index 18ba4cb..1a7c30d 100644
--- a/arch/parisc/kernel/hardware.c
+++ b/arch/parisc/kernel/hardware.c
@@ -274,7 +274,17 @@ static struct hp_hardware hp_hardware_list[] __initdata = {
 	{HPHW_NPROC,0x887,0x4,0x91,"Storm Peak Slow"},
 	{HPHW_NPROC,0x888,0x4,0x91,"Storm Peak Fast DC-"},
 	{HPHW_NPROC,0x889,0x4,0x91,"Storm Peak Fast"},
-	{HPHW_NPROC,0x88A,0x4,0x91,"Crestone Peak"},
+	{HPHW_NPROC,0x88C,0x4,0x91,"Orca Mako+"},
+	{HPHW_NPROC,0x88D,0x4,0x91,"Rainier/Medel Mako+ Slow"},
+	{HPHW_NPROC,0x88E,0x4,0x91,"Rainier/Medel Mako+ Fast"},
+	{HPHW_NPROC,0x894,0x4,0x91,"Mt. Hamilton Fast Mako+"},
+	{HPHW_NPROC,0x895,0x4,0x91,"Storm Peak Slow Mako+"},
+	{HPHW_NPROC,0x896,0x4,0x91,"Storm Peak Fast Mako+"},
+	{HPHW_NPROC,0x897,0x4,0x91,"Storm Peak DC- Slow Mako+"},
+	{HPHW_NPROC,0x898,0x4,0x91,"Storm Peak DC- Fast Mako+"},
+	{HPHW_NPROC,0x899,0x4,0x91,"Mt. Hamilton Slow Mako+"},
+	{HPHW_NPROC,0x89B,0x4,0x91,"Crestone Peak Mako+ Slow"},
+	{HPHW_NPROC,0x89C,0x4,0x91,"Crestone Peak Mako+ Fast"},
 	{HPHW_A_DIRECT, 0x004, 0x0000D, 0x00, "Arrakis MUX"}, 
 	{HPHW_A_DIRECT, 0x005, 0x0000D, 0x00, "Dyun Kiuh MUX"}, 
 	{HPHW_A_DIRECT, 0x006, 0x0000D, 0x00, "Baat Kiuh AP/MUX (40299B)"}, 
