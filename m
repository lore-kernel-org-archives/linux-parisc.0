Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA22000
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Sep 1999 09:02:04 -0600
Received: by wallace.ece.rice.edu
	via sendmail from stdin
	id <m11OjFz-000LEGC@wallace.ece.rice.edu> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Wed, 8 Sep 1999 10:03:31 -0500 (CDT)
Date: Wed, 8 Sep 1999 10:03:31 -0500
From: "Ross J. Reedstrom" <reedstrm@wallace.ece.rice.edu>
To: Frank Benke <frank.benke@student.uni-tuebingen.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: THANK YOU for the Linuxdays (fwd)
Message-ID: <19990908100331.A24655@wallace.ece.rice.edu>
References: <Pine.LNX.4.10.9909080952580.18299-100000@linux21.zdv.uni-tuebingen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.9909080952580.18299-100000@linux21.zdv.uni-tuebingen.de>; from Frank Benke on Wed, Sep 08, 1999 at 10:05:34AM +0200
List-ID: <linux-parisc.vger.kernel.org>

Frank - 
Have you spent much time reading the linux-kernel mailing list? Linus is
usually little swayed by 'popular opinion' as to what features go into
the kernel. The principle criteria are that any new feature not hurt
other features, and that the quality of the code is good. This petition
drive reminds me of ~3 years ago, when some people following the GGI
(General Graphics Interface) project wanted to get the early alpha
code adopted into the mainstream kernel. In my opinion (and that of
many kernel list regulars) the 'campaign' _slowed_ acceptance, rather
than helping. In fact, the basic underlying architecture (a generic
framebuffer interface) came into the mainstream kernel from the ports
to architectures(SPARC, I seem to recall) that required it, and was
eventually adapted to the i386 architecture, as well.

So, I'm not convinced that a petition is going to help at all, and
might hurt. If Linus Torvalds has rejected the lvm patches based on 'I
don't think many people need this' (which is _not_ a usual criteria),
it might help a little, to let the developers of the LVM patches point
to as interest. But they should have download logs indicating a lot of
people grabbing the patches, which says the same thing, doesn't it? I'm
glad the patches work well for you. Be happy features like this can be
developed by third parties. Help the LVM developers create clean code
that patches in easily, and it'll end up in the kernel.

Ross

Ob.PA-RISC: Sorry my first post here is off topic. Perhaps I can
salvage that.  I've just aquired what I believe to be a HP9000 730/66
a.k.a. 'King Cobra' workstation. I haven't much time to play with it
right now, but I _will_ be following this list, and trying to get your
work up and running on it. Hopefully, this isn't too different from other
7XX machines. Anyone know of any 'gotcha's ? (Oh, and I have zero HP/UX
experience (all Irix and Linux background).


On Wed, Sep 08, 1999 at 10:05:34AM +0200, Frank Benke wrote:
> hello folks;
> 
> since you all seem to be interested in linux and are somehow related to
> the comercial use of it, i strongly encourage you to sign the petition for
> including the logical volume management in the linux kernel. linus
> concidered lvm as NOT important and is not convinced that this include is
> of common interest. this petition shall convince him otherwise.
> 
> the website is found at http://linux.msede.com/lvm .
> 
> if you have friends and colleagues, which might think positive about lvm,
> please inform them and ask them to sign as well. logical volume management
> is as important as filesystem-journaling and the entire lvm in its alpha
> release runs quite well here at gis.
> 
> thanks for your attention
> 
> regards frank
> 
> 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

-- 
Ross J. Reedstrom, Ph.D., <reedstrm@rice.edu> 
NSBRI Research Scientist/Programmer
Computer and Information Technology Institute
Rice University, 6100 S. Main St.,  Houston, TX 77005
