Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA26652
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 12:21:27 -0700
Date: Thu, 30 Nov 2000 17:11:32 -0200 (BRST)
From: "Jorge L. deLyra" <delyra@latt.if.usp.br>
To: Helge Deller <deller@gmx.de>
cc: parisc-linux@thepuffingroup.com, assirati@socrates.if.usp.br
Subject: Re: [parisc-linux] HP 9000/735-125
In-Reply-To: <00113019365203.00309@P100>
Message-ID: <Pine.LNX.3.96.1001130170122.23583A-100000@latt.if.usp.br>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > Just a thought: are you shure, that you did "make palo" and exported
> > palo/lifimage  instead of vmlinux ?

I just did the naive thing and put the precompiled kernel from the site
there. According to the docs on the NFSROOT that might work, I mean, it
says there that there are two alternatives, with and without palo...

> oops, 
> I just saw, that you currently _can_not_ cross-compile..... :-(

Yes, we are working towards this, but I read in the docs that for the time
being you can only cros-compile the kernel on HP-UX, so we must first fix
our HP-UX systems here. In any case, it will take a little while until we
tool up to do the cross-compilation, no matter where...

> But if you still want to download a kernel I can make one available for 
> you.....

This would be very nice! If you do that, please tell me where I can get
it. It might be a goot idea to have this net-bootable lifimage version of
the kernel on the ftp site side-by-side with the precompiled kernel which
is already there, don't you think?

						Many thanks,

----------------------------------------------------------------
        Jorge L. deLyra,  Associate Professor of Physics
            The University of Sao Paulo,  IFUSP-DFMA
       For more information: finger delyra@latt.if.usp.br
----------------------------------------------------------------
