Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7533D482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Oct 2001 11:49:55 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15s6RV-0007RY-00; Fri, 12 Oct 2001 18:49:53 +0100
Date: Fri, 12 Oct 2001 18:49:53 +0100
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>,
	Grant Grundler <grundler@puffin.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel panic with -pa48
Message-ID: <20011012184953.F25868@parcelfarce.linux.theplanet.co.uk>
References: <1002899016.3bc70648db602@webmail.tiscalinet.be> <20011012162722.C14205@parcelfarce.linux.theplanet.co.uk> <1002908535.3bc72b77e40fd@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1002908535.3bc72b77e40fd@webmail.tiscalinet.be>; from joel.soete@freebel.net on Fri, Oct 12, 2001 at 07:42:15PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Oct 12, 2001 at 07:42:15PM +0200, joel.soete@freebel.net wrote:
> Oct 12 17:22:34 palinux2 kernel: scsi0: (6:0) Synchronous at offset 8, period 100ns
> Oct 12 17:22:34 palinux2 kernel: scsi0 (6:0) New error handler wants to abort
> command
> Oct 12 17:22:34 palinux2 kernel: ^I0x12 00 00 00 ff 00
> Oct 12 17:22:34 palinux2 kernel: scsi0 (6:0) New error handler wants device reset
> Oct 12 17:22:34 palinux2 kernel: ^I0x12 00 00 00 ff 00
> Oct 12 17:22:34 palinux2 kernel: scsi0 (6:0) New error handler wants BUS reset,
> cmd 1006e800
> Oct 12 17:22:34 palinux2 kernel: ^I0x12 00 00 00 ff 00
> Oct 12 17:22:34 palinux2 kernel: scsi0: Bus Reset detected, executing command
> 1006e800, slot 00010520, dsp 00070528[0528]
> Oct 12 17:22:34 palinux2 kernel:  failing command because of reset, slot
> 00010520, cmnd 1006e800

Last time I saw output like this was on a machine whose disc was making
very painful noises as it attempted to spin up.  Could this be the case
for your machine?

-- 
Revolutions do not require corporate support.
