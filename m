Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 887B8482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 15:25:09 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Steve Pacenka <spacenka@lightlink.com>
Subject: Re: [parisc-linux] RTC and FB on 735/125
Date: Mon, 23 Sep 2002 23:23:10 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <03ab01c26266$2416dea0$1f96078d@acid> <200209232217.45577.deller@gmx.de> <1032815056.3209.115.camel@romano>
In-Reply-To: <1032815056.3209.115.camel@romano>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200209232323.10789.deller@gmx.de>
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

On Monday 23 September 2002 23:04, Steve Pacenka wrote:
> On Mon, 2002-09-23 at 16:18, Helge Deller wrote:
> > On Monday 23 September 2002 20:46, Steve Pacenka wrote:
> > > The CRX24 framebuffer also works at 8 bit color, a bit faster.  A minor
> > > patch to one file in the kernel is needed (duplicating a few lines that
> > > apply to another card's depth selection in the same file) and a kernel
> > > boot argument is needed to (optionally) cause the kernel to start video
> > > in 8 bit mode instead of the default 32.
> > >
> > > The hard drive I patched this on is recycled into another type of box,
> > > but Helge Deller can guess what's needed just from this description.
> >
> > Hi Steve,
> >
> > I don't have a CRX24 and can't test anything.
> > If you could post a patch here I could add it to the kernel.
>
> Good day Helge,
>
> I can't test easily either, or generate formal patches, since my 735
> w/CRX24 is in a display at our computer recycle shop.
>
>
> From memory, after consulting CVS today --
>
> 1. In drivers/video/sti/stifb.c
>
> Inside function
>    int __init
>    stifb_init_fb(struct sti_struct *sti, int force_bpp)
>
>
> old:
>
> 	case S9000_ID_A1439A:	/* CRX24/A1439A */
> 		bpp = 32;
> 		break;
>
>
> new (insert three lines below the case):
> 	case S9000_ID_A1439A:	/* CRX24/A1439A */
> 		if (force_bpp == 8 || force_bpp == 32)
> 			bpp = force_bpp;
> 		else
> 			bpp = 32;
> 		break;
>
>
> This is copied from HCRX initialization in the same switch.
>
>
> 2. To activate include in the kernel boot arguments (PALO or interrupt
> boot with ESC):
>
>    video=stifb:bpp:8
>
> This is also recognized
>
>    video=stifb:bpp:32
>
> but that is the default.
>
>
> 3. To use with X, set the DefaultDepth to 8 in XF86Config-4 (leaving
> fbbpp at 32), or
>
>    startx -- -depth 8
>
> Requires a depth 8 subsection in the monitor size section.
>
>
> Perhaps Yves can test?
>
> -- cheers, SP


Thanks Steve,

I've applied this patch to 2.4.19-pa20.

Greetings,
Helge
