Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (A6d12.pppool.de [213.6.109.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC1EE487A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Oct 2001 06:58:53 -0600 (MDT)
Date: Tue, 2 Oct 2001 14:57:01 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] Additional Address cleanup
Message-ID: <20011002145701.B3747@solo.franken.de>
References: <20010921104838.A2049@beavis.ybsoft.com> <3BAF13BC.3090302@hrzpub.tu-darmstadt.de> <20010924215918.A23464@beavis.ybsoft.com> <3BB0BFF9.50708@hrzpub.tu-darmstadt.de> <20010925210035.A22586@solo.franken.de> <3BB8A3FC.7090304@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3BB8A3FC.7090304@hrzpub.tu-darmstadt.de>; from rscholz@hrzpub.tu-darmstadt.de on Mon, Oct 01, 2001 at 07:12:28PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 01, 2001 at 07:12:28PM +0200, Rüdiger Scholz wrote:
> I'm glad i'm not the only one with this problem. And even someone knows 
> the solution for the problem. ;-). I also disabled my add-on card the 
> same way, and then the sti-stuff worked quite fine. But it would be 
> cooler to use the second card, too.

sure, after having fixed the X problem I had with artist/viz-eg cards
I've spend some time looking at HCRX. I've found one problem, when we
load the color for the HCRX, the card locks up, probably because we
do a whole color map load per setcolreg() call. I've changed that
and the card doesn't lock up anymore. But either I get wrong colors
without colormap loading or I have some strange looking stuff "behind"
the normal screen content. It looks like either we need to initialize
the Z-Buffer (I'll try without, when I get home) or some overlay/attribute
planes need a better treatment.

> But you already have a patch? I can only help with testing and a little 
> bit of debugging as all of my fingers are thumbs ;-)

right now I'm not at home (and behind a 28.8k modem connection) and I only
have a C200 with me, which has other STI problems. So it will take a little
bit more time, to get the HCRX going.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
