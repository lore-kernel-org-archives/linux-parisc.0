Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.epost.de (unknown [193.28.100.166])
	by dsl2.external.hp.com (Postfix) with ESMTP id 911874831
	for <parisc-linux@parisc-linux.org>; Wed, 10 Sep 2003 07:19:53 -0600 (MDT)
Message-ID: <3F5F24D9.7030800@epost.de>
Date: Wed, 10 Sep 2003 15:19:21 +0200
From: Sebastian Brueckner <sebastian.brueckner@epost.de>
MIME-Version: 1.0
To: debian-hppa@lists.debian.org, parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] HP B132L hangs
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

Hi!

In the last few days the B132l I use as DSL router completely hung 3 
times. Every time requiring a power cycle to revive it. It is running 
Debian testing with kernel 2.4.18-hppa.

To test the machine I tried to compile a new kernel. After compiling a 
few files everything hung and spit out the following messages:

scsi0: (2:0) Synchronous at offset 8, period 100ns
scsi0: (2:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =Read (10) 00 00 35 e2 00 00 00 18 00
scsi0: Bus Reset detected, executing command 10081c00, slot 00010520, 
dsp 000902 failing command because of reset, slot 00010520, cmnd 10081c00
  failing command because of reset, slot 00010654, cmnd 10081a00
  failing command because of reset, slot 00010788, cmnd 10081800
  failing command because of reset, slot 000108bc, cmnd 10081600
  failing command because of reset, slot 000109f0, cmnd 10081400
  failing command because of reset, slot 00010b24, cmnd 10081200
  failing command because of reset, slot 00010c58, cmnd 10081000
  failing command because of reset, slot 00010d8c, cmnd 10082e00
  failing command because of reset, slot 00010ec0, cmnd 10082c00
  failing command because of reset, slot 00010ff4, cmnd 10082a00
  failing command because of reset, slot 00011128, cmnd 10082800
  failing command because of reset, slot 0001125c, cmnd 10082600
  failing command because of reset, slot 00011390, cmnd 10082400
  failing command because of reset, slot 000114c4, cmnd 10082200
  failing command because of reset, slot 000115f8, cmnd 10082000
  failing command because of reset, slot 0001172c, cmnd 100a4e00
scsi0: (2:0) Synchronous at offset 8, period 100ns
scsi0: (2:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
          len = 6, cmd =Read (10) 00 00 35 e2 00 00 00 18 00
scsi0: Bus Reset detected, executing command 10081c00, slot 00010520, 
dsp 000902 failing command because of reset, slot 00010520, cmnd 10081c00
  failing command because of reset, slot 00010654, cmnd 10081a00
  failing command because of reset, slot 00010788, cmnd 10081800

... and so on and so forth ...

The power seitch does nothing, only power cycling helps. I tried 
compiling the kernel again with the same results...

What do these messages mean? Is the hd defective or is it some problem 
with the scsi bus?

The machine worked flawlessly for half a year... I have no idea what 
went wrong!

Thanks in advance,
   Sebastian
