Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA03069
	for <parisc-linux@puffin.external.hp.com>; Fri, 13 Oct 2000 14:27:22 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id C9C967F4
	for <parisc-linux@thepuffingroup.com>; Fri, 13 Oct 2000 13:28:32 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id NAA09820
	for parisc-linux@thepuffingroup.com; Fri, 13 Oct 2000 13:32:54 -0700 (PDT)
Date: Fri, 13 Oct 2000 13:32:54 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010132032.NAA09820@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] tr0/tr1 defines in asmregs.h
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
cr24 and cr25 are not "tempory" registers for parisc-linux.
IMHO, No one should be referencing "tr0/tr1" names in any
assembler code.

Comments?
Should this patch be committed to the CVS tree?

thanks
grant

grundler <526>cvs diff include/asm-parisc/asmregs.h
Index: include/asm-parisc/asmregs.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/asmregs.h,v
retrieving revision 1.4
diff -u -p -r1.4 asmregs.h
--- asmregs.h   2000/06/28 23:38:09     1.4
+++ asmregs.h   2000/10/13 20:07:16
@@ -144,8 +144,10 @@ isr:       .reg    %cr20
 ior:   .reg    %cr21
 ipsw:  .reg    %cr22
 eirr:  .reg    %cr23
-tr0:   .reg    %cr24
-tr1:   .reg    %cr25
+#if 0
+tr0:   .reg    %cr24   /* pointer to kernel address space page directory */
+tr1:   .reg    %cr25   /* pointer to the current user address space pdir */
+#endif
 tr2:   .reg    %cr26
 tr3:   .reg    %cr27
 tr4:   .reg    %cr28
