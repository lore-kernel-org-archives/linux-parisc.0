Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 46DEC48A5
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 05:23:04 -0600 (MDT)
Date: Mon, 24 Sep 2001 13:22:34 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: Jurij Smakov <jurijus@theophys.kth.se>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Debian bootfloppies with -pa22 fails on 720/50
In-Reply-To: <20010924120501.A8276@dogbert.localdomain>
Message-ID: <Pine.NEB.4.33.0109241319010.9317-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Albert,

> Thanks for the reply. I was considering exactly this course of action.
> Hopefully I can spot something then. I'll post my findings here. :-)
>
> I was also thinking of adding some debug output to init itself.
> Seemingly it gets run, and during that process the kernel loses it...?

There are some issues with 720 boxes. This old patch at least gets me
started, although some alignment faults remain for some user space tools:

"Our" CPUs are very old. So there must be a line added in
the arch/parisc/kernel/trap.c file. In the handle_interruption()
you must add the line
        `case 18:'
where
        `case 15:'
        `case 26:'
is in the code, because these old CPUs use an older method of
"reporting" page faults, etc...

There was a second patch posted some time ago, but that one didn't work
for me:

Index: traps.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/traps.c,v
retrieving revision 1.52
diff -u -p -r1.52 traps.c
--- traps.c	2001/09/06 09:44:07	1.52
+++ traps.c	2001/09/15 16:52:13
@@ -322,6 +322,11 @@ void handle_interruption(int code, struc
 		fault_address = regs->ior;
 		parisc_terminate("Non access data tlb fault!",regs,code,fault_address);

+	case 18: /* PCX-S processors don't use 26, 27, 28 */
+		if (regs->ior & 3)
+			goto unaligned_d_access;
+		/* Fall through */
+
 	case 15:
 	case 26:
 		fault_address = regs->ior;
@@ -416,7 +421,8 @@ void handle_interruption(int code, struc
 		force_sig_info(SIGSEGV, &si, current);
 		return;

-	case 28:  /* Unaligned just causes SIGBUS for now */
+ unaligned_d_access:
+	case 28:
 		handle_unaligned(regs);
 #if 0
 		die_if_kernel("Unaligned data reference", regs, code);

Cheers,
Jochen
