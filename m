Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA25952
	for <parisc-linux@puffin.external.hp.com>; Tue, 31 Oct 2000 17:44:07 -0700
From: Helge Deller <deller@gmx.de>
Date: Wed, 1 Nov 2000 01:45:52 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
To: "Thomas Marteau" <marteaut@esiee.fr>, <parisc-linux@thepuffingroup.com>
References: <002a01c03f88$0a20d580$a832d793@esiee.fr> <00102701504600.00370@P100>
In-Reply-To: <00102701504600.00370@P100>
Subject: Re: [parisc-linux] The new PS/2 Keyboard Driver
MIME-Version: 1.0
Message-Id: <00110101455208.00343@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Friday 27 October 2000 01:50, Helge Deller wrote:
> On Thursday 26 October 2000 22:05, Thomas Marteau wrote:
> 
> > > 
> > Hello everyone,
> > 
> > We've just updated the PS/2 keyboard driver. The leds and interrupt
> > functions work really well on a 712 workstation and also B132 now. The
> > updated driver files are available on our website. It works better than
> > under HP UX for the B 132 ;->
> > 
> > http://www.esiee.fr/~djoudim
> > 
> > The ESIEE Port Team in Paris.
> > 
> > Here is the patch:
> > 
> > diff -urN linux/drivers/char/gsc_ps2.c linux-parisc/drivers/char/gsc_ps2.c
> > --- linux/drivers/char/gsc_ps2.c Thu Oct 26 21:06:54 2000
> > +++ linux-parisc/drivers/char/gsc_ps2.c Thu Oct 26 21:34:00 2000
> > @@ -7,6 +7,11 @@
> >  [.............]
> 
> > diff -urN linux/drivers/char/keyb_at.c linux-parisc/drivers/char/keyb_at.c
> > --- linux/drivers/char/keyb_at.c Thu Oct 26 21:07:00 2000
> > +++ linux-parisc/drivers/char/keyb_at.c Thu Oct 26 21:23:16 2000
> > [........]
> 
> Hi Thomas,
> 
> Thanks for your patch. 
> But I don't think it's a good idea to change a common file like keyb_at.c, 
> which is used in most other arches too. This patch surely breaks their 
> keyboard support and more than that I'm sure, that Linus will not accept 
this 
> patch, when the time is come to integrate parisc into the official kernel.
> 
> Isn't there any other solution as for example to #ifdef the code or create 
a 
> new keyb_at.c for parisc (Yes I know, both of those aren't clean too.) ?
> 
> Helge Deller


Hi folks,

I need to correct myself on this topic. The ESIEE-team made a great patch and 
didn't changed any globally used file.  keyb_at.c is just used in the current 
parisc-port, and so it's ok to change that file.

I just committed their changes to the CVS, and in the same cycle tried to 
clean up the code. In the same step I renamed the original filenames to some 
hopefully better ones.

Since I don't own myself a real HP PS/2 keyboard (it's just an PC-AT one with 
a small DIN to PS/2-connector), it would be great to get some feedback if I 
did the Right Thing.

Helge.
