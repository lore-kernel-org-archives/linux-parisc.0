From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: add some more machine names to hardware database
Date: Sat, 23 Nov 2013 00:25:43 +0100
Message-ID: <20131122232543.GA21160@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Sadly the correct names for machines which end with a question-mark aren't
known, so let's give it a best-guessed-name.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/hardware.c b/arch/parisc/kernel/hardware.c
index 06cb399..608716f 100644
--- a/arch/parisc/kernel/hardware.c
+++ b/arch/parisc/kernel/hardware.c
@@ -36,6 +36,9 @@
  *	HP PARISC Hardware Database
  *	Access to this database is only possible during bootup
  *	so don't reference this table after starting the init process
+ *
+ *	NOTE: Product names which are listed here and ends with a '?'
+ *	are guessed. If you know the correct name, please let us know.
  */
  
 static struct hp_hardware hp_hardware_list[] = {
@@ -222,7 +225,7 @@ static struct hp_hardware hp_hardware_list[] = {
 	{HPHW_NPROC,0x5DD,0x4,0x81,"Duet W2"},
 	{HPHW_NPROC,0x5DE,0x4,0x81,"Piccolo W+"},
 	{HPHW_NPROC,0x5DF,0x4,0x81,"Cantata W2"},
-	{HPHW_NPROC,0x5DF,0x0,0x00,"Marcato W+? (rp5470)"},
+	{HPHW_NPROC,0x5DF,0x0,0x00,"Marcato W+ (rp5470)?"},
 	{HPHW_NPROC,0x5E0,0x4,0x91,"Cantata DC- W2"},
 	{HPHW_NPROC,0x5E1,0x4,0x91,"Crescendo DC- W2"},
 	{HPHW_NPROC,0x5E2,0x4,0x91,"Crescendo 650 W2"},
@@ -276,9 +279,11 @@ static struct hp_hardware hp_hardware_list[] = {
 	{HPHW_NPROC,0x888,0x4,0x91,"Storm Peak Fast DC-"},
 	{HPHW_NPROC,0x889,0x4,0x91,"Storm Peak Fast"},
 	{HPHW_NPROC,0x88A,0x4,0x91,"Crestone Peak Slow"},
+	{HPHW_NPROC,0x88B,0x4,0x91,"Crestone Peak Fast?"},
 	{HPHW_NPROC,0x88C,0x4,0x91,"Orca Mako+"},
 	{HPHW_NPROC,0x88D,0x4,0x91,"Rainier/Medel Mako+ Slow"},
 	{HPHW_NPROC,0x88E,0x4,0x91,"Rainier/Medel Mako+ Fast"},
+	{HPHW_NPROC,0x892,0x4,0x91,"Mt. Hamilton Slow Mako+?"},
 	{HPHW_NPROC,0x894,0x4,0x91,"Mt. Hamilton Fast Mako+"},
 	{HPHW_NPROC,0x895,0x4,0x91,"Storm Peak Slow Mako+"},
 	{HPHW_NPROC,0x896,0x4,0x91,"Storm Peak Fast Mako+"},
