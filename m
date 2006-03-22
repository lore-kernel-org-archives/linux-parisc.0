From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Wed, 22 Mar 2006 18:49:49 -0500 (EST)
Message-ID: <200603222349.k2MNnoxd028375@hiauly1.hia.nrc.ca>
References: <200603222330.19695.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tsg45800@scarlet.be
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200603222330.19695.deller@gmx.de> from "Helge Deller" at Mar 22, 2006 11:30:19 pm
List-ID: <linux-parisc.vger.kernel.org>

> > That's why I said I need to fix STIfb.... :-)
> 
> It's fixed now in CVS (2.6.16-pa2).
> Even X11 on stifb with 64bit kernel works...

Did this bug also affect 32bit kernels?  The reason I ask is I
had to back out using 2.6.16-pa0 on my c3k.  The most obvious
symptoms were fsck failures on reboot, iptables error messages
and unreliable behavior of gnome teminal.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
