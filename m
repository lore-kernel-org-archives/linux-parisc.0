Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail1.nwe.de (mail1.nwe.de [195.226.126.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id E39014834
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Mar 2003 06:04:31 -0700 (MST)
Received: from gfrw1044.bocc.de (pD9E2790C.dip.t-dialin.net [217.226.121.12])
	(authenticated (0 bits))
	by mail1.nwe.de (8.12.8/8.11.0) with ESMTP id h2ED4MgO024479
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Mar 2003 14:04:29 +0100 (CET)
Date: Fri, 14 Mar 2003 14:04:17 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: RFC: mmap patch
In-Reply-To: <20030309144225.O3865@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.44.0303141351000.23830-100000@gfrw1044.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi,

since the patch was included in CVS, several modules fail to load with
unresolved external __flush_dcache_page.

This should fix it:

# cvs diff -u parisc_ksyms.c
Index: parisc_ksyms.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/parisc_ksyms.c,v
retrieving revision 1.44
diff -u -r1.44 parisc_ksyms.c
--- parisc_ksyms.c      11 Jan 2003 20:10:46 -0000      1.44
+++ parisc_ksyms.c      14 Mar 2003 12:49:49 -0000
@@ -127,6 +127,7 @@
 #include <asm/cache.h>
 EXPORT_SYMBOL(flush_kernel_dcache_range_asm);
 EXPORT_SYMBOL(flush_kernel_dcache_page);
+EXPORT_SYMBOL(__flush_dcache_page);
 EXPORT_SYMBOL(flush_all_caches);

 #include <asm/unistd.h>

--jochen
