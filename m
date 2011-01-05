From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: NFS broken in latest 2.6.37-rcX
Date: Wed, 05 Jan 2011 11:36:01 -0600
Message-ID: <1294248961.15356.30.camel@mulgrave.site>
References: <20101222223410.3a5f44c3@zombie>
	 <AANLkTinp3LaW_h91E+44=_-anambaJwja3BFCfG60fUz@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Guy Martin <gmsoft@tuxicoman.be>, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTinp3LaW_h91E+44=_-anambaJwja3BFCfG60fUz@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2010-12-22 at 16:53 -0500, Carlos O'Donell wrote:
> On Wed, Dec 22, 2010 at 4:34 PM, Guy Martin <gmsoft@tuxicoman.be> wrote:
> > It seems that NFS got broken recently.
> > I've bisected this to babddc72a9468884ce1a23db3c3d54b0afa299f0.
> >
> > Both NFS version 2 and 3 are affected. I haven't tested NFS 4.
> >
> > I've been able to reproduce with both 32bit and 64bit kernels using
> > gcc-4.5.1 with the fix for PR46915 included.
> >
> > To reproduce, simply mount an NFS share and try to list the files with
> > ls.
> >
> > When listing the directory, the code seem to be looping in the commit I
> > mentioned. The network traffic goes high and you always see the same
> > packets flowing.
> >
> > In current HEAD, the behavior is slightly different. The process uses
> > 100% and either you get a kernel panic or if you are lucky, you get
> > something like "memory exhausted".
> >
> >
> > I'm not sure how to troubleshoot this further.
> >
> > Any idea ?
> 
> You need to understand the failure mode.
> 
> I would do two things:
> 
> (a) Revert the patch on HEAD and see if it works. This is usually
> convincing proof that something is broken and the patch interacts
> badly with our arch.
> 
> (c) Put printfs in the code to see where it's looping and under what
> conditions.
> 
> Once you have a better grasp of the failure mode you can contact the
> author of the patch and tell them about the breakage, CC linux-parisc,
> and ask for help.
> 
> That would be me plan of attack.

Arm ran into this as well

http://marc.info/?t=129372938100002

It looks to be an inequivalent aliasing problem caused by  writes via
the kernel direct mapping, and reads via vmalloc space.

James


