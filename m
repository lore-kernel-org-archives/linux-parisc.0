Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC8A24829
	for <parisc-linux@parisc-linux.org>; Thu,  5 Dec 2002 17:16:33 -0700 (MST)
Received: from security.hp.com (cranston.fc.hp.com [15.1.44.224])
	by atlrel7.hp.com (Postfix) with ESMTP id 1B3A880510B
	for <parisc-linux@parisc-linux.org>; Thu,  5 Dec 2002 19:16:29 -0500 (EST)
Date: Thu, 5 Dec 2002 17:16:09 -0700
From: LaMont Jones <lamont@hp.com>
To: LaMont Jones <lamont@b180.mmjgroup.com>
Cc: lamont@hp.com
Message-ID: <20021206001609.GB26722@cranston.fc.hp.com>
References: <20021205221845.GA22847@b180.mmjgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021205221845.GA22847@b180.mmjgroup.com>
Resent-Message-Id: <20021206001624.EF5AB12134@security.hp.com>
Subject: [parisc-linux] Re: airo.c fix for hppa and others
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, Dec 05, 2002 at 03:18:45PM -0700, LaMont Jones wrote:

And lets not forget the (already committed?) dino patch:

lamont

diff -ur x/kernel-source-2.4.19-hppa/drivers/gsc/dino.c kernel-source-2.4.19-hppa/drivers/gsc/dino.c
--- x/kernel-source-2.4.19-hppa/drivers/gsc/dino.c	2002-07-14 13:51:42.000000000 -0600
+++ kernel-source-2.4.19-hppa/drivers/gsc/dino.c	2002-12-04 07:07:52.000000000 -0700
@@ -251,7 +251,7 @@
 	unsigned long flags; \
 	spin_lock_irqsave(&(DINO_DEV(d)->dinosaur_pen), flags); \
 	/* tell HW which IO Port address */ \
-	gsc_writel((u32) addr & ~3, d->base_addr + DINO_PCI_ADDR); \
+	gsc_writel((u32) addr, d->base_addr + DINO_PCI_ADDR); \
 	/* generate I/O PORT read cycle */ \
 	v = gsc_read##type(d->base_addr+DINO_IO_DATA+(addr&mask)); \
 	spin_unlock_irqrestore(&(DINO_DEV(d)->dinosaur_pen), flags); \
