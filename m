Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82EE348BA
	for <parisc-linux@parisc-linux.org>; Mon, 24 Sep 2001 06:46:48 -0600 (MDT)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id OAA23974 for <parisc-linux@parisc-linux.org>; Mon, 24 Sep 2001 14:46:47 +0200 (MET DST)
Message-Id: <sbaf46e9.068@ms-zrt1>
Date: Mon, 24 Sep 2001 14:39:09 +0200
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <fullung@ilink.nis.za>, <parisc-linux@parisc-linux.org>
Subject: Betr.: Re: [parisc-linux] Debian bootfloppies with -pa22 fails
	on 720/50
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>Eek! :-)
>
>After your changes (making case 18 fall through to case 28), I get the
>following happy-and-warm-and-fuzzy message:
>
>...
>VFS: Mounted root (nfs filesystem) readonly.
>init(1): unaligned access to 0x00090cf4 at ip=3D0x000157af
>init[1]: Unaligned data reference 28
>
>     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>PSW: 00000000000001001111111100001111
>r0-3     00000000 1035d973 1010ccb8 10038258
>r4-7     10038648 ffffffff 00000012 faf0004c
>r8-11    00000000 00069c48 000100c4 00014dd8
>r12-15   10348000 00000000 00000000 00000000
>r16-19   10038258 00000000 10348000 00000000
>r20-23   00090cf4 0000001f 00000000 10038258
>r24-27   00000001 00000001 1027b8e0 102a4010
>r28-31   00000000 00000004 10038800 10118338
>sr0-3    00000000 105b60c0 00000000 00000001
>sr4-7    00000000 00000000 00000000 00000000
>
>IASQ: 00000000 00000000 IAOQ: 1010ca64 1010ca68
> IIR: 0e93d222    ISR: 00000001  IOR: 00090cf4
> CPU:        0   CR30: 10038000 CR31: 10350000
> ORIG_R28: 10038600
>Kernel panic: Attempted to kill init!
>
>This doesn't mean much to me, so let me know what you want me to do now.
>:-)
>
Look up the thread on 'nmap -O fails on 712/60' from just 2 weeks ago and
decode this using your own system.map.....

Good luck,
Jurriaan
