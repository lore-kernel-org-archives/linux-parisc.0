Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (ottawa.linuxcare.com [216.208.98.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id D6BF1482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Jul 2001 09:25:11 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 4FCF7B00C; Wed, 25 Jul 2001 16:26:52 +0100 (BST)
Date: Wed, 25 Jul 2001 16:26:52 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Scammell, David" <David.Scammell@uk.wmmercer.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 715/33 disk and kernel make dep problems
Message-ID: <20010725162652.B1252@linuxcare.com>
References: <99F41EF55D11D511818600D0B74749C496F41D@wchrntms01.uk.wmmercer.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <99F41EF55D11D511818600D0B74749C496F41D@wchrntms01.uk.wmmercer.com>; from David.Scammell@uk.wmmercer.com on Thu, Jul 19, 2001 at 03:22:18PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 19, 2001 at 03:22:18PM +0100, Scammell, David wrote:
> 
> Hi,
> 
> I installed with 9.2, no problems, updated with apt-get.
> 
> I'd like to build my own kernel to test out a disk problem I have.
> 
> When I attempt anything which would fill the scsi disk queue with pending
> writes
> (e.g. tar xf kernel.tar), then machine hangs, I get some messages on the
> serial
> console which I've not got them written down yet, but these include a mount
> read
> only message. I'm using an old 2Gb disk (info not to hand, I'm at work), but
> no so
> old it shouldn't handle tagged writes. I'd like to change the queue depth
> and bus
> sync speed (looks like its set at 20Mhz, not 10Mhz) to see if this makes a
> difference.

Could you try with disconnect/reselect turned off?  Should be able
to do that by booting with "sim700=nodisc:0xff".

Richard
