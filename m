Return-Path: <david.everly@mci.com>
Received: from omzesmtp04.mci.com (omzesmtp04.mci.com [199.249.17.14])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77533487A
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  9 Apr 2004 10:50:54 -0600 (MDT)
Received: from pmismtp01.wcomnet.com ([166.38.62.36])
	by firewall.mci.com (Iplanet MTA 5.2)
	with ESMTP id <0HVW0008BX5WJN@firewall.mci.com> for
	parisc-linux@lists.parisc-linux.org;
	Fri, 09 Apr 2004 16:44:21 +0000 (GMT)
Date: Fri, 09 Apr 2004 10:44:19 -0600
From: David Everly <david.everly@mci.com>
Subject: Re: [parisc-linux] Re: 0.9 release (HP 9000/800/K580 install problem)
In-reply-to: <20040409113100.GA1716@csu6223286.mcilink.com>
To: The PA/Linux ESIEE Team <puffin@esiee.fr>,
	parisc-linux@lists.parisc-linux.org
Message-id: <20040409164419.GA2405@csu6223286.mcilink.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii; x-action=pgp-signed
References: <20040408231826.GB32148@csu6223286.mcilink.com>
	<20040409094050.639494f0.puffin@esiee.fr>
	<20040409113100.GA1716@csu6223286.mcilink.com>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Some more information that invalidates some thing I said below:

/dev/ttyB0 was in fact already installed (/target/dev/ttyB0 when
booting from the CD to check), even though the inittab line
seems to fail when booting and trying to run base-config

Any ideas of what I might change?

On Fri, Apr 09, 2004 at 05:31:00AM MDT, david.everly@mci.com wrote:
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
> > > reboot.  Upon reboot I got the following message and could not finish
> > > the install:
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
> > > Any suggestions on what I do now to either re-install or continue from
> > > this point?
> > > 
> > > Thanks,
> > > Dave.
> -- 
> David.Everly@mci.com
>       IM: deckrider@jabber.org
>    GnuPG: E1B6 40B6 B73F 695E 0D3B  644E 6427 DD74 8527 B9AF
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

- -- 
David.Everly@mci.com
   V-Net:       622-3286
   Phone: 1-719-535-3286
   Pager: 1-800-PAGE-MCI # 140-1311
      IM: deckrider@jabber.org
   GnuPG: E1B6 40B6 B73F 695E 0D3B  644E 6427 DD74 8527 B9AF

http://agilemanifesto.org/principles.html
http://www.expita.com/nomime.html

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAdtLjZCfddIUnua8RAhRPAKCmQjYlfGapqHCSxjiatPkgYmSBhwCfV/2F
QhMSWJHJoZbJNVYVxMATqoc=
=WWEN
-----END PGP SIGNATURE-----
