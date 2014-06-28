From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: add C8000/1GHz serial ports to hardware database
Date: Sat, 28 Jun 2014 17:44:51 +0200
Message-ID: <20140628154451.GA3536@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/hardware.c b/arch/parisc/kernel/hardware.c
index 608716f..a976a77 100644
--- a/arch/parisc/kernel/hardware.c
+++ b/arch/parisc/kernel/hardware.c
@@ -1210,7 +1210,8 @@ static struct hp_hardware hp_hardware_list[] = {
 	{HPHW_FIO, 0x004, 0x00320, 0x0, "Metheus Frame Buffer"}, 
 	{HPHW_FIO, 0x004, 0x00340, 0x0, "BARCO CX4500 VME Grphx Cnsl"}, 
 	{HPHW_FIO, 0x004, 0x00360, 0x0, "Hughes TOG VME FDDI"}, 
-	{HPHW_FIO, 0x076, 0x000AD, 0x00, "Crestone Peak RS-232"},
+	{HPHW_FIO, 0x076, 0x000AD, 0x0, "Crestone Peak Core RS-232"},
+	{HPHW_FIO, 0x077, 0x000AD, 0x0, "Crestone Peak Fast? Core RS-232"},
 	{HPHW_IOA, 0x185, 0x0000B, 0x00, "Java BC Summit Port"}, 
 	{HPHW_IOA, 0x1FF, 0x0000B, 0x00, "Hitachi Ghostview Summit Port"}, 
 	{HPHW_IOA, 0x580, 0x0000B, 0x10, "U2-IOA BC Runway Port"}, 
