Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA22378
	for <parisc-linux@puffin.external.hp.com>; Mon, 8 Jan 2001 03:29:37 -0700
From: rule@freegates.be
Received: from www-data by webmail.tiscalinet.be with local (Exim 3.12 #1)
	id 14FZbq-00027c-00
	for parisc-linux@thepuffingroup.com; Mon, 08 Jan 2001 11:33:02 +0100
To: parisc-linux@thepuffingroup.com
Message-ID: <978949982.3a59975e2655e@webmail.tiscalinet.be>
Date: Mon, 08 Jan 2001 11:33:02 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] error booting with recent cvs linux kernel
List-ID: <linux-parisc.vger.kernel.org>

Hello all,

When booting a kernel, compiled from CVS update today, with CVS
gcc/binutils/glibc/palo from CVS, I get the following error :

(I use STI console, following is copied from screen)

INIT: version 2.78 booting
break 0,0: pid=9 command='rcS'
rcS[9]: breakpoint 0

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001011
r0-3% 00000000 c02bc800 00000000 00000000
r4-7% 00000000 00000000 00000000 00000000
r8-11% 00000000 00000000 00000000 00000000
r12-15% 00000000 00000000 00076808 c011ef58
r16-19% c3c80600 c3c80000 00076808 00000001
r20-23% c3fce860 c3fce860 00000000 c3fce840
r24-27% c3fffd40 00001000 00000000 c024c000
r28-31% 00000000 00000000 c3c80a00 c012a134
sr0-3% 00000000 00000000 00000000 00000003
sr4-7% 00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 00000000 00000004
 IIR: 00000000    ISR: 00000000  IOR: c3c00008
ORIG_R28: 00000000

The box boots fine with a backup kernel, compiled late december of last year.

Kind regards,
Roel Teuwen


-------------------------------------------------
This mail sent through IMP: webmail.tiscalinet.be
