Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA06342
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Dec 2000 18:04:07 -0700
Received: from dot.at (IDENT:plattner@dot-tc01-012.dot.at [212.9.128.52])
	by dns2.dot.at (8.9.3/8.9.2) with ESMTP id CAA04457
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Dec 2000 02:09:26 +0100
Sender: plattner@dns2.dot.at
Message-ID: <3A4940BF.3EB18F61@dot.at>
Date: Wed, 27 Dec 2000 02:07:11 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Same boot problem on a 9000/720/50 HP machine as on 712/60 of Niskanen
List-ID: <linux-parisc.vger.kernel.org>

On my 9000/720 (I have it since one week) I have the same problem
booting the CD 0.5
or
a selfbuild kernel. The kernel boots, but on calling the
init a trap is called with the text:

handle_interruption() pid=1 command='init'

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001011
r0-3     00000000 000c0f38 00033a1b 000c0f3c
r4-7     000c0f38 ffffffff 00000001 0002a1d8
r8-11    c02ac640 00000000 00000000 c0145f30
r12-15   00000000 00000000 00000000 00000000
r16-19   c027b60c 00000000 c02ac000

and so on, running in a loop.


The code is in kernel/traps.c

Further I tried to build a statically linked bash-2.03,
but I had problems setting up the build process to produce
a HP PARISC user program. What I have to do to setup or
prepare default source trees for cross building (the
compiler runs....)

Cheers

	Christoph Plattner


-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
