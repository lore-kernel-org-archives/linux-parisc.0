Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD90546F3.dip.t-dialin.net [217.5.70.243])
	by dsl2.external.hp.com (Postfix) with ESMTP id C031B482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Jun 2001 16:54:50 -0600 (MDT)
Date: Tue, 5 Jun 2001 00:52:05 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems with 0.9 ISO Images from mkhppa1.esiee.fr
Message-ID: <20010605005205.B3234@solo.franken.de>
References: <20010604170841.A8900@solo.franken.de> <200106041940.NAA13519@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200106041940.NAA13519@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Mon, Jun 04, 2001 at 01:40:50PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 04, 2001 at 01:40:50PM -0600, Grant Grundler wrote:
> So I don't think it quite works yet - but it's not much more work either.
> I suggest installing 32-bit w/serial console (should work fine) and

that's what I did, just wondered a little bit.

> J282 might have serial on Dino and Clement (ESIEE) just hacked some support

I don't think so, J282 doesn't even have PCI. Right now I can't boot it,
because I've disassembled my computer room, but if memory serves right
serial is attached to either wax or lasi.

> for that...but I know it's not on the 0.9 ISOs. Booting from a lifimage
> (newer kernel plus Dino patch) might work better.

even without having Dino ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
