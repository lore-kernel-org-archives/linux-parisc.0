Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2395B4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Sep 2002 04:21:33 -0600 (MDT)
Received: from esiee.fr (grobluk.esiee.fr [147.215.7.22])
	by mail.esiee.fr (Postfix) with ESMTP id 2DCE549CA7
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Sep 2002 12:21:31 +0200 (CEST)
Message-ID: <3D8701AA.4040700@esiee.fr>
Date: Tue, 17 Sep 2002 12:19:22 +0200
From: Thibaut VARENE <varenet@esiee.fr>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] B132L+ crash with mpg123
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

Hi fellows !

I've been experiencing several crashes on B132L+ while playing mp3s with
mpg123, the box was then running 2.4.18-pa21.
I've tried recently with 2.4.19-pa18, and it crashed again.
The crash happens at random time, on random files.

What's worth mentionning is that files are played from a remote NFS
filesystem. (BTW, the console shows "svc: unknown version (0)" when
mounting the NFS system).

So I took my little fingers and I reproduced here what the console
showed me. I hope there is now mistake in this "hand dump", though I
read it twice ;)

HTH,


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/




WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Kernel Fault: Code=15 regs=11ddc640 (Addr=00277e00)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000011000000000000001111 Not tainted
r00-03  00000000 00000023 101feac4 00000200
r04-07  1035c1fc fffff000 1035c010 00000000
r08-11  1035c1fc 00001200 1035c010 1035c010
r12-15  00029f00 1035c25c faf01590 00017000
r16-19  00028678 00028678 00002000 00000e00
r20-23  00001000 00000000 00000001 00001200
r24-27  000001ff 00029f01 00277e00 10290010
r28-31  00000000 ffffffff 11ddc640 101fea8c
sr0-3   00000000 00000246 00000000 00000246
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 0000000 IAOQ: 10263c78 10263c70
   IIR: 0f411222    ISR: 00000000   IOR: 00277e00
   CPU:        0   CR30: 11ddc000  CR31: 10338000
   ORIG_R28: 11ddc7b8
