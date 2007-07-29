From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Boot problem with HPPA 735/125 w/ A1439A CRX
Date: Sun, 29 Jul 2007 13:17:35 -0400 (EDT)
Message-ID: <200707291717.l6THHZI5027278__32286.1405824826$1416624423$gmane$org@hiauly1.hia.nrc.ca>
References: <200707291843.47136.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 kurtm22@netscape.net
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200707291843.47136.deller@gmx.de> from "Helge Deller" at Jul 29, 2007 06:43:46 pm
List-ID: <linux-parisc.vger.kernel.org>

> On Sunday 29 July 2007, Helge Deller wrote:
> > Yes, could you please try this patch ?
> 
> Could you please try the attached patch instead.
> This should be correct.

While we are on frame buffer issues, I'm still having troubles
with VisEG in c3750.  While the problems have changed with time,
X fails to start using either gdb or kdm.  It will start using
startx.

I had to disable AIGLX xorg.conf.  After doing this, there are no
errors in the gdb/kdm logs.  The only issue I see is the following
in the Xorg.0.log:

(II) Setting vga for screen 0.
(**) FBDEV(0): Depth 8, (--) framebuffer bpp 8
(==) FBDEV(0): Default visual is PseudoColor
(==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
(II) FBDEV(0): hardware: stifb (video memory: 2048kB)
(II) FBDEV(0): checking modes against framebuffer device...
(II) FBDEV(0):  mode "1280x1024" test failed
...

There seems to be an issue with mode "1280x1024".

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
