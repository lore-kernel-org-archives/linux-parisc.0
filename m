Return-Path: <Soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6FF58488E
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Apr 2004 00:46:27 -0600 (MDT)
Date: Wed, 14 Apr 2004 08:45:38 +0200
Message-ID: <40711E550000569F@ocpmta2.freegates.net>
From: "Joel Soete" <Soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
To: "Ryan Bradetich" <rbradetich@uswest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Grant Grundler <grundler@parisc-linux.org>,
	PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello Ryan,

>I finally had some time to compile a kernel and boot some systems today
>so I tested the latest CVS head on my C200 and a J200 to see if I could
>duplicate the problem you are seeing.
>
>The J200 is basically a dual processor C100 so it hould be very close
>to the C110 (i.e. no PCI, EISA based, etc)  The device names are
>different so I am not sure if it is close enough but I still think it is
>a relevant data point.
>
No more clue sorry

[snip]

>Would you be interested in trying the lifimage I complied and
>successfully booted on both the J200 and the C110?

Just a stupid question: where can I grab this lifimage?

> If the lifimage
>boots on your system then we localize the problem down to possible tool
>chain or .config problem (I used the defconfig).

Right I forgot to test defconfig.

That said, to get you more detail on my pb:
 - in genral i can reach to boot the system with 2.6.5-paX
 - the pb occurs when I try high i/o rate on disk (ie  a find, a fsck ,
a tar or some time a simple cp of the kernel from a fs to another one)
 - the pb can also occurs at boot time if a fs is not clear (a fsck is
so requested) or if a raid partition has to be sync (ie once again high i/o
rate on disks).

Thanks for your attention,

   Joel


PS: This system boot and mainly works always fine with a 2.4 and 2.6.3-rc1-pa3
(this is mainly this last one I used as reference), so I exclude hw pb ;)
(execpted that the battery saving system time (and more) has to be replaced)

hmm, I also read back my first report of a pb on this c110 and noticed that
everything appears for me when I tried 2.6.4-pa[12]. I so try to grab cvs
kernel tree dated of the Makefile 2.6.3-rc1-pa3 and a saved tbz of 2.6.4-pa2
to build a diff. The diff file is of about 14Mb :_(

Historically there was not a lot of big changes specific to parisc between
those releases: the main one being the jejb change in ccio-dma (and related).
I so try to revert it and it seems to works better (with 2 different config
file)
until system hang at boot again because it has to re-sync a md (the root)
device. It seems so that ccio-dma changes was not the cause but much better
a revelator of a hidden pb (In fact I never reach to work with 2.6 on this
c110 without replacing cio_mem_ratio = 4 by 2)







----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
