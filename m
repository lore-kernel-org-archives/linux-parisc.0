Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA18675
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 09:20:58 -0700
Subject: Re: [parisc-linux] CVS linux Vs. -test10
To: gibreel@pobox.com (Stephen Zander)
Date: Thu, 30 Nov 2000 16:16:18 +0000 (GMT)
Cc: grundler@cup.hp.com (Grant Grundler), matthew@wil.cx (Matthew Wilcox),
        parisc-linux@puffin.external.hp.com
In-Reply-To: <877l5lvq3k.fsf@rabbit.fire-swamp.net> from "Stephen Zander" at Nov 30, 2000 12:09:03 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E141WNg-0007Sk-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Oooh, there's a reason for me to finally get the 712/80 under my desk
> to be more than a foot-rest.  I'll see what I can do about this.
> 
> Note that the likelihood of Debian releasing woody anytime soon is
> vanishingly small, so this dosen't have to happen Right Now.

My experiences with building Red Hat 7 so far are mostly good. I don't think
there will be many actual changes needed to build Debian packages either. I've
made very little that isnt 'use -fPIC' 'dont optimise C++'
