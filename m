Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D34A4A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 13:24:21 -0700 (MST)
Message-Id: <200102012026.MAA01201@milano.cup.hp.com>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org, amodra@linuxcare.com
Subject: Re: [parisc-linux] $$mulI missing 
In-reply-to: Your message of "Thu, 01 Feb 2001 13:01:52 PST."
             <E14OPvU-0006yu-00@noam.fc.hp.com>
Date: Thu, 01 Feb 2001 12:26:26 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> I didn't think the 64-bit compiler used mulI so didn't include it
> in the millicode routines.  I'm curious what's using it.

    arch/parisc/kernel/parisc_ksyms.c

Exported for (guess what?) CONFIG_MODULE support. :^/

I've committed the following patch. Paul tells me on 64 bit, millicode looks
to be limited to div* and rem*.

grant

diff -u -p -r1.11 parisc_ksyms.c
--- parisc_ksyms.c      2000/12/31 01:42:06     1.11
+++ parisc_ksyms.c      2001/02/01 20:16:08
@@ -97,8 +97,6 @@ extern void $$divI(void);
 extern void $$divU(void);
 extern void $$remI(void);
 extern void $$remU(void);
-extern void $$mulI(void);
-extern void $$mulU(void);
 extern void $$divU_3(void);
 extern void $$divU_5(void);
 extern void $$divU_6(void);
@@ -122,8 +120,6 @@ EXPORT_SYMBOL_NOVERS($$divI);
 EXPORT_SYMBOL_NOVERS($$divU);
 EXPORT_SYMBOL_NOVERS($$remI);
 EXPORT_SYMBOL_NOVERS($$remU);
-EXPORT_SYMBOL_NOVERS($$mulI);
-EXPORT_SYMBOL_NOVERS($$mulU);
 EXPORT_SYMBOL_NOVERS($$divU_3);
 EXPORT_SYMBOL_NOVERS($$divU_5);
 EXPORT_SYMBOL_NOVERS($$divU_6);


Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
