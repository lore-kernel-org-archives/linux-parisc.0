Return-Path: <varenet@esiee.fr>
Received: from mail.zigoo.net (d050.dhcp212-198-139.noos.fr [212.198.139.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 363BD487A
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  9 Apr 2004 10:49:26 -0600 (MDT)
Date: Fri, 9 Apr 2004 18:49:21 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: david.everly@mci.com
Subject: Re: [parisc-linux] Re: 0.9 release (HP 9000/800/K580 install problem)
Message-Id: <20040409184921.7cf1f5a5.varenet@esiee.fr>
In-Reply-To: <20040409113100.GA1716@csu6223286.mcilink.com>
References: <20040408231826.GB32148@csu6223286.mcilink.com>
	<20040409094050.639494f0.puffin@esiee.fr>
	<20040409113100.GA1716@csu6223286.mcilink.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I have just checked on a system installed using that particular netinst,
ttyB0 is well created:

varenet@Tigrou:~$ ls -l /dev/ttyB0 
crw-rw----    1 root     dialout   60,   0 Jun  7  2002 /dev/ttyB0

You're the second person to report that problem on the mailing list (check
the archive) and I just can't figure out what's wrong with your setup.

I don't have any box requiring the use of ttyB0 handy to make some tests
here, but the ttyB0 stuff has been in the netinsts for quite a while now
and has been reported to work fine.

Anyway, check that mail, it seems that's there's a solution with newer
kernels, with a new major number for /dev/ttyB0:
http://lists.parisc-linux.org/pipermail/parisc-linux/2004-April/022830.html

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://www.pateam.org/


On Fri, 09 Apr 2004 05:31:00 -0600
david.everly@mci.com wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Thank you for your fast reply!
> 
> I installed the base system from the netinst ISO.  There seemed to be
> no option to install from the network during this stage.  I'm wondering
> if somehow /dev/ttyB0 was not created when the base system was installed
> (even though it was there on the CD used for the install).  I think
> maybe this device is not needed for all hardware, but is needed for my
> particular setup, which would explain why it works for some others.
> 
> If this is the case, would you have any information as to how I can
> boot from the netinst CD, open a shell and add /dev/ttyB0 to the
> permanent installation?
> 
> Or perhaps I'm way off base here and you have some better
> instructions.   :)
> 
> I'm more familiar with using Debian i386, so I have another small
> (perhaps stupid) question about palinux:  is there a limit to partitions
> on one disk?  The reason I asked is I tried to make four partitions on
> one 9G drive (the first was type f0, the remaining three were linux).
> The installer could only see the first two linux partitions and not
> the third linux partition.  Thus, I revised my plan and only used two
> linux partitions on that drive.
> 
> Thank you again,
> Dave.
> 
> On Fri, Apr 09, 2004 at 01:40:50AM MDT, The PA/Linux ESIEE Team wrote:
> > This looks very strange to me since 2.4.21-pa6 is known to be working
> > just fine for any supported box.
> > 
> > I can see one pitfall though: have you installed base system from the
> > netinst ISO or from network?
> > 
> > HTH,
> > 
> > Thibaut VARENE
> > The PA/Linux ESIEE Team
> > http://www.pateam.org/
> > 
> > On Thu, 08 Apr 2004 17:18:27 -0600
> > "David Everly" <david.everly@mci.com> wrote:
> > 
> > > Hi,
> > > 
> > > I tried to install the following on HP 9000/800/K580:
> > > 
> > > http://www.pateam.org/cd-images/testing/palinux-2.4.21-pa6-20030718-netinst.iso
> > > 
> > > After installing kernel, configuring network, etc. it came time to
> > > reboot.  Upon reboot I got the following message and could not
> > > finish the install:
> > > 
> > > Starting periodic command scheduler: cron
> > > /bin/sh: /dev/ttyB0: No such device
> > > /bin/sh: /dev/ttyB0: No such device
> > > /bin/sh: /dev/ttyB0: No such device
> > > /bin/sh: /dev/ttyB0: No such device
> > > /bin/sh: /dev/ttyB0: No such device
> > > /bin/sh: /dev/ttyB0: No such device
> > > /bin/sh: /dev/ttyB0: No such device
> > > /bin/sh: /dev/ttyB0: No such device
> > > /bin/sh: /dev/ttyB0: No such device
> > > /bin/sh: /dev/ttyB0: No such device
> > > INIT: Id "T0" respawning to fast: disabled for 5 minutes
> > > INIT: no more processes left in this runlevel
> > > 
> > > Any suggestions on what I do now to either re-install or continue
> > > from this point?
> > > 
> > > Thanks,
> > > Dave.
> - -- 
> David.Everly@mci.com
>       IM: deckrider@jabber.org
>    GnuPG: E1B6 40B6 B73F 695E 0D3B  644E 6427 DD74 8527 B9AF
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
> 
> iD8DBQFAdol0ZCfddIUnua8RAkyrAJwNAMVn0GTm5+EZfFG/fQkS70x0qQCfUUfn
> S6PuwNXOcpBwxihYV9llGww=
> =cn2C
> -----END PGP SIGNATURE-----
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
