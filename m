Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm1.tiscalinet.be (spoolm1.tiscalinet.be [212.35.2.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id E78E8482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 13:04:28 -0600 (MDT)
Sender: jso@dsl2.external.hp.com
Message-ID: <3BC891AB.84075276@freebel.net>
Date: Sat, 13 Oct 2001 19:10:35 +0000
From: Soete Joel <joel.soete@freebel.net>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel panic with -pa48
References: <1002899016.3bc70648db602@webmail.tiscalinet.be> <20011012162722.C14205@parcelfarce.linux.theplanet.co.uk> <1002908535.3bc72b77e40fd@webmail.tiscalinet.be> <20011012184953.F25868@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> On Fri, Oct 12, 2001 at 07:42:15PM +0200, joel.soete@freebel.net wrote:
> > Oct 12 17:22:34 palinux2 kernel: scsi0: (6:0) Synchronous at offset 8, period 100ns
> > Oct 12 17:22:34 palinux2 kernel: scsi0 (6:0) New error handler wants to abort
> > command
> > Oct 12 17:22:34 palinux2 kernel: ^I0x12 00 00 00 ff 00
> > Oct 12 17:22:34 palinux2 kernel: scsi0 (6:0) New error handler wants device reset
> > Oct 12 17:22:34 palinux2 kernel: ^I0x12 00 00 00 ff 00
> > Oct 12 17:22:34 palinux2 kernel: scsi0 (6:0) New error handler wants BUS reset,
> > cmd 1006e800
> > Oct 12 17:22:34 palinux2 kernel: ^I0x12 00 00 00 ff 00
> > Oct 12 17:22:34 palinux2 kernel: scsi0: Bus Reset detected, executing command
> > 1006e800, slot 00010520, dsp 00070528[0528]
> > Oct 12 17:22:34 palinux2 kernel:  failing command because of reset, slot
> > 00010520, cmnd 1006e800
> 
> Last time I saw output like this was on a machine whose disc was making
> very painful noises as it attempted to spin up.  Could this be the case
> for your machine?

No, neither the internal (scsi0 (6:0)) neither the external (scsi (3:0)
my hppa linux disk) do not made any noise.
But you have right: it is a long time ago that I boot on this disk (on
which I install the old mklinux for the curiosity), it may be failed
now? I will test it and let you inform.

Joel
