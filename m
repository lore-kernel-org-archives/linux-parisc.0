Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from romano (romano-nyswri.cfe.cornell.edu [132.236.139.186])
	by dsl2.external.hp.com (Postfix) with ESMTP id DDE7B4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 12:47:40 -0600 (MDT)
Subject: Re: [parisc-linux] RTC and FB on 735/125
From: Steve Pacenka <spacenka@lightlink.com>
To: Yves Bodack <bodack@stud.fh-heilbronn.de>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <003001c26327$d0db42e0$1f96078d@acid>
References: 
	<03ab01c26266$2416dea0$1f96078d@acid><20020922220323.0113cbca.varenet@esiee.
	 fr><03bf01c2627c$9a5147c0$1f96078d@acid>
	<03ed01c26280$4dfb5c90$1f96078d@acid> <1032793227.1848.222.camel@romano>
	<003001c26327$d0db42e0$1f96078d@acid>
Content-Type: text/plain
Date: 23 Sep 2002 14:46:16 -0400
Message-Id: <1032806776.2868.19.camel@romano>
Mime-Version: 1.0
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

On Mon, 2002-09-23 at 13:36, Yves Bodack wrote:
> hi steve,
> great, this did the trick. thank's a lot. it's quite slow, but it works in
> true color :)

Yves,

It's faster than the Macintosh Quadra 610 (another Linux victim) that
I'm typing on now :^) .

Could you please post your experience at getting X applications to work
now that you have X and a desktop?  I got basic gnome things to work
flawlessly, but failed on my 735/99 with xmms, xemacs, and galeon or
mozilla.


The CRX24 framebuffer also works at 8 bit color, a bit faster.  A minor
patch to one file in the kernel is needed (duplicating a few lines that
apply to another card's depth selection in the same file) and a kernel
boot argument is needed to (optionally) cause the kernel to start video
in 8 bit mode instead of the default 32.  

The hard drive I patched this on is recycled into another type of box,
but Helge Deller can guess what's needed just from this description.

-- regards, SP

> 
> greetings yves...
> 
> 
> From: "Steve Pacenka" <spacenka@lightlink.com>
> Subject: Re: [parisc-linux] RTC and FB on 735/125
> 
> 
> > On Sun, 2002-09-22 at 17:37, Yves Bodack wrote:
> > > replying to myself ...
> > >
> > > > and with 8 bpp it says:
> > > >
> > > > (EE) FBDev(0): No Display subsection in Screen section "Default
> Screen"
> > > for
> > > > depth/fbbpp 24/24
> > > > (EE) Screen(s) found, but none have a usable configuration.
> > > > Fatal server error:
> > > > no screens found
> > >
> > > same with 16 or 32 bpp :(
> >
> >
> > Try the following in XF86Config-4
> >
> > Section Screen
> >    ... (whatever else you need here) ...
> >
> >    DefaultDepth 24
> >    DefaultFbBpp 32
> >
> >    SubSection Display
> >       Depth 24
> >       Modes "1280x1024"
> >    EndSubSection
> >
> > EndSection
> >
> > -- SP
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
