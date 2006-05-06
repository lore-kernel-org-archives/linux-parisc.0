From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Sat, 6 May 2006 18:44:56 -0400 (EDT)
Message-ID: <200605062244.k46MiuOk029404@hiauly1.hia.nrc.ca>
References: <200603222349.k2MNnoxd028375@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: deller@gmx.de,
 parisc-linux@lists.parisc-linux.org,
 tsg45800@scarlet.be
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200603222349.k2MNnoxd028375@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 22, 2006 06:49:49 pm
List-ID: <linux-parisc.vger.kernel.org>

> Did this bug also affect 32bit kernels?  The reason I ask is I
> had to back out using 2.6.16-pa0 on my c3k.  The most obvious
> symptoms were fsck failures on reboot, iptables error messages
> and unreliable behavior of gnome teminal.

The fsck problem turned out to be the same as reported here:
http://lists.debian.org/debian-kernel/2006/02/msg00153.html.
udev was running out of memory and /dev was getting fully populated.

It might be that the udev package got stuck.  I removed and
reinstalled it.  The hack in the debian bug report also seems
to work.

I believe that the iptables problem can be fixed by a config
update but I haven't test it.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
