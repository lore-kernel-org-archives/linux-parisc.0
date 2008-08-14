From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: X won't start with VisEG and 2.6.22.19
Date: Thu, 14 Aug 2008 17:24:21 -0400 (EDT)
Message-ID: <20080814212422.447EC4E4A@hiauly1.hia.nrc.ca>
References: <48A49B70.9030706@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: gmsoft@tuxicoman.be, kraxel@goldbach.in-berlin.de,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <48A49B70.9030706@gmx.de> from "Helge Deller" at Aug 14, 2008 10:54:08 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The problem is really caused by hw/xfree86/fbdevhw/fbdevhw.c.
> 
> The driver sets a video mode and then checks if the syscall modified the 
> parameters with the function fbdev_modes_equal():

The maintainers for the fbdevhw.c and fbmem.c files need to be contacted
to determine what fbmem.c is allowed to change and what what fbdev_modes_equal
should be checking.  It's possible Debian is messing with the code as well,
so a Debian bug report wouldn't hurt.

Thanks for looking into this.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
