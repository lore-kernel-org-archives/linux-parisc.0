Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 611BE4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Jan 2003 13:49:23 -0700 (MST)
Message-Id: <200301072049.h07KnF1F023893@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Problem with weak symbols
To: b.gunreben@web.de (b.gunreben)
Date: Tue, 7 Jan 2003 15:49:15 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E1AD095.FA5CF165@web.de> from "b.gunreben" at Jan 7, 2003 02:05:25 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> I have a problem with weak symbols on parisc. If I use the following
> small program, the result should be always (nil), but it isn´t:

I believe the enclosed binutils patch will fix the problem.  I will
install it after a little more testing.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2003-01-07  John David Anglin  <dave.anglin@nrc.gc.ca>

	* elf32-hppa.c (final_link_relocate): For all DP relative relocations,
	adjust addil instructions if the symbol has no section.

Index: elf32-hppa.c
===================================================================
RCS file: /cvs/src/src/bfd/elf32-hppa.c,v
retrieving revision 1.92
diff -u -3 -p -r1.92 elf32-hppa.c
--- elf32-hppa.c	12 Dec 2002 10:17:14 -0000	1.92
+++ elf32-hppa.c	7 Jan 2003 20:15:48 -0000
@@ -3416,15 +3416,14 @@ final_link_relocate (input_section, cont
     case R_PARISC_DPREL14R:
     case R_PARISC_DPREL14F:
     /* For all the DP relative relocations, we need to examine the symbol's
-       section.  If it's a code section, then "data pointer relative" makes
-       no sense.  In that case we don't adjust the "value", and for 21 bit
-       addil instructions, we change the source addend register from %dp to
-       %r0.  This situation commonly arises when a variable's "constness"
+       section.  If it has no section or if it's a code section, then
+       "data pointer relative" makes no sense.  In that case we don't
+       adjust the "value", and for 21 bit addil instructions, we change the
+       source addend register from %dp to %r0.  This situation commonly
+       arises for undefined weak symbols and when a variable's "constness"
        is declared differently from the way the variable is defined.  For
        instance: "extern int foo" with foo defined as "const int foo".  */
-      if (sym_sec == NULL)
-	break;
-      if ((sym_sec->flags & SEC_CODE) != 0)
+      if (sym_sec == NULL || (sym_sec->flags & SEC_CODE) != 0)
 	{
 	  if ((insn & ((0x3f << 26) | (0x1f << 21)))
 	      == (((int) OP_ADDIL << 26) | (27 << 21)))
