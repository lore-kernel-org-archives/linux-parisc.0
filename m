Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA02662
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Jul 2000 16:34:26 -0600
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m139bFr-001VspC@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Tue, 4 Jul 2000 16:33:23 -0600 (MDT)
Message-Id: <m139bFr-001VspC@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: alan@linuxcare.com.au, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs
Date: Tue, 04 Jul 2000 16:33:18 -0600
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>


Unfortunately it looks like a couple of us are unable to build
working user-space executables with the no-%r8 linker.  I tried re-linking
with the old (16-June) one and that works (but of course that linker
can't link large executables).  So starting with:

	main(){}

I used both the 16-June and today's binutils.  It appears the "broken"
executable is running or sleeping (unlikely?) and it doesn't panic
the system.  I disassembled both versions and the _init sections are
a bit different, which isn't surprising, but also doesn't look right
to me.  Here's the one which works, using the old %r8 stub method:

000010b4 <_init>:
    10b4:       6b c2 3f d9     stw rp,-14(sr0,sp)
    10b8:       37 de 00 80     ldo 40(sp),sp
    10bc:       6b d3 3f c1     stw r19,-20(sr0,sp)
    10c0:       6b c4 3f 81     stw r4,-40(sr0,sp)
    /* jsr through stub to __gmon_start */
    10c4:       e5 00 22 f4     be,l 1178(sr4,r8),%sr0,%r31
    10c8:       08 13 02 44     copy r19,r4
    /* jsr through stub to __do_global_ctors_aux */
    10cc:       e5 00 22 bc     be,l 115c(sr4,r8),%sr0,%r31
    10d0:       08 00 02 40     nop
    10d4:       4b c2 3f 59     ldw -54(sr0,sp),rp
    10d8:       e8 40 c0 00     bv r0(rp)
    10dc:       4f c4 3f 81     ldw,mb -40(sr0,sp),r4

And here's the new one which fails.  Looks like maybe the %rp is
not being set, or the linker's overwriting a branch in a funny
way or something:

000010bc <_init>:
    10bc:       6b c2 3f d9     stw rp,-14(sr0,sp)
    10c0:       37 de 00 80     ldo 40(sp),sp
    10c4:       6b d3 3f c1     stw r19,-20(sr0,sp)
    10c8:       6b c4 3f 81     stw r4,-40(sr0,sp)
    /* jsr through local stub to __gmon_start */
    10cc:       e8 5f 1f c5     b,l 10b4 <_init-0x8>,rp
    10d0:       08 13 02 44     copy r19,r4
    /* branch to __do_global_ctors_aux !!! rp was never set !!! */
    10d4:       20 2b 40 00     ldil 56000,r1
    10d8:       e0 20 26 ba     be,n 35c(sr4,r1)
    /* nullified instruction -- otherwise it'd be an infinite loop */
    10dc:       e8 5f 1f e5     b,l 10d4 <_init+0x18>,rp
    10e0:       08 00 02 40     nop
    10e4:       4b c2 3f 59     ldw -54(sr0,sp),rp
    10e8:       e8 40 c0 00     bv r0(rp)
    10ec:       4f c4 3f 81     ldw,mb -40(sr0,sp),r4

Help?

	-Paul Bame
