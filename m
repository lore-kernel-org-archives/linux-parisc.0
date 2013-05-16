From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: add rp5470 entry to machine database
Date: Thu, 16 May 2013 22:42:39 +0200
Message-ID: <20130516204239.GA1018@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/hardware.c b/arch/parisc/kernel/hardware.c
index f7752f6..9e2d2e4 100644
--- a/arch/parisc/kernel/hardware.c
+++ b/arch/parisc/kernel/hardware.c
@@ -222,6 +222,7 @@ static struct hp_hardware hp_hardware_list[] = {
 	{HPHW_NPROC,0x5DD,0x4,0x81,"Duet W2"},
 	{HPHW_NPROC,0x5DE,0x4,0x81,"Piccolo W+"},
 	{HPHW_NPROC,0x5DF,0x4,0x81,"Cantata W2"},
+	{HPHW_NPROC,0x5DF,0x0,0x00,"Marcato W+? (rp5470)"},
 	{HPHW_NPROC,0x5E0,0x4,0x91,"Cantata DC- W2"},
 	{HPHW_NPROC,0x5E1,0x4,0x91,"Crescendo DC- W2"},
 	{HPHW_NPROC,0x5E2,0x4,0x91,"Crescendo 650 W2"},
