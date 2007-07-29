From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Boot problem with HPPA 735/125 w/ A1439A CRX
Date: Sun, 29 Jul 2007 14:29:22 -0400 (EDT)
Message-ID: <200707291829.l6TITMPi028794__46329.4052090079$1416624423$gmane$org@hiauly1.hia.nrc.ca>
References: <200707292003.12664.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200707292003.12664.deller@gmx.de> from "Helge Deller" at Jul 29, 2007 08:03:12 pm
List-ID: <linux-parisc.vger.kernel.org>

> > There seems to be an issue with mode "1280x1024".
> 
> Are you running your console in 1280x1024 as well, e.g. what does "fbset -i" reports ?

Believe so.

mode "1280x1024"
    geometry 1280 1024 1280 1024 8
    timings 0 0 0 0 0 0 0
    rgba 8/0,8/0,8/0,0/0
endmode

Frame buffer device information:
    Name        : stifb
    Address     : 0xf9000000
    Size        : 2097152
    Type        : PACKED PIXELS
    Visual      : PSEUDOCOLOR
    XPanStep    : 0
    YPanStep    : 0
    YWrapStep   : 0
    LineLength  : 2048
    MMIO Address: 0xf8100000
    MMIO Size   : 4194304
    Accelerator : No

> What makes me wonder is, that if "startx" works, what is the difference to "gdb/kdm" in respect to Xorg screen confifuration ??

I looked at the gdm config and didn't see anything obvious.  It's the
default config.  In any case, gdm ends up running XKeepsCrashing.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
