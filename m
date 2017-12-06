From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH] ipmi_si: fix crash on parisc
Date: Wed, 6 Dec 2017 04:25:44 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1712060052170.12854@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: openipmi-developer@lists.sourceforge.net,
        linux-parisc@vger.kernel.org
To: Corey Minyard <minyard@acm.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch fixes ipmi crash on parisc introduced in the kernel 4.15-rc.
The pointer io.io_setup is not initialized and thus it causes crash in
try_smi_init when attempting to call new_smi->io.io_setup.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/char/ipmi/ipmi_si_parisc.c |    2 ++
 1 file changed, 2 insertions(+)

Index: linux-4.15-rc2/drivers/char/ipmi/ipmi_si_parisc.c
===================================================================
--- linux-4.15-rc2.orig/drivers/char/ipmi/ipmi_si_parisc.c	2017-12-06 01:19:49.000000000 +0100
+++ linux-4.15-rc2/drivers/char/ipmi/ipmi_si_parisc.c	2017-12-06 06:40:12.000000000 +0100
@@ -10,6 +10,8 @@ static int __init ipmi_parisc_probe(stru
 {
 	struct si_sm_io io;
 
+	memset(&io, 0, sizeof(io));
+
 	io.si_type	= SI_KCS;
 	io.addr_source	= SI_DEVICETREE;
 	io.addr_type	= IPMI_MEM_ADDR_SPACE;
