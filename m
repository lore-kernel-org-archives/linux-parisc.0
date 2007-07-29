From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: Boot problem with HPPA 735/125 w/ A1439A CRX
Date: Sun, 29 Jul 2007 20:03:12 +0200
Message-ID: <200707292003.12664.deller__10662.6953850084$1416624423$gmane$org@gmx.de>
References: <200707291717.l6THHZI5027278@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200707291717.l6THHZI5027278@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 29 July 2007, John David Anglin wrote:
> > On Sunday 29 July 2007, Helge Deller wrote:
> > > Yes, could you please try this patch ?
> > 
> > Could you please try the attached patch instead.
> > This should be correct.
> 
> While we are on frame buffer issues, I'm still having troubles
> with VisEG in c3750.  While the problems have changed with time,
> X fails to start using either gdb or kdm.  It will start using
> startx.
> 
> I had to disable AIGLX xorg.conf.  After doing this, there are no
> errors in the gdb/kdm logs.  The only issue I see is the following
> in the Xorg.0.log:
> 
> (II) Setting vga for screen 0.
> (**) FBDEV(0): Depth 8, (--) framebuffer bpp 8
> (==) FBDEV(0): Default visual is PseudoColor
> (==) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
> (II) FBDEV(0): hardware: stifb (video memory: 2048kB)
> (II) FBDEV(0): checking modes against framebuffer device...
> (II) FBDEV(0):  mode "1280x1024" test failed
> ...
> 
> There seems to be an issue with mode "1280x1024".

Are you running your console in 1280x1024 as well, e.g. what does "fbset -i" reports ?
What makes me wonder is, that if "startx" works, what is the difference to "gdb/kdm" in respect to Xorg screen confifuration ??

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
