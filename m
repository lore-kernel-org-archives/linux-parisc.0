Return-Path: <rollei@tiscalinet.it>
Received: from smtp0.libero.it (smtp0.libero.it [193.70.192.33])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7FA434868
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  8 Jan 2004 02:57:28 -0700 (MST)
Sender: multix@dsl2.external.hp.com
Message-ID: <3FFD29CF.F10EBE14@tiscalinet.it>
Date: Thu, 08 Jan 2004 10:58:39 +0100
From: Riccardo <rollei@tiscalinet.it>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] scsi problem on a scorpio (715)
References: <3FFC9A15.6FA66B2@tiscalinet.it>
	<Pine.LNX.4.58.0401072226130.5327@brain.fop.ns.ca>
	<20040108025218.GA20732@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii
Cc: parisc linux <parisc-linux@lists.parisc-linux.org>,
	Steve Bromwich <hppa@fop.ns.ca>
Reply-To: rollei@tiscalinet.it
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Help! The machine just doesn't come up anymore! After the screengrap I
posted the kernel dies with a panic...

This time I hooked up a monitor during the whole startup and I notice
some details:
- both eth0 and scsi0 drivers complain about not being able to allcoate
"consistent memory" is this ok? doesn't sound nice.
- there is always a printout saying "kernel bug found in slab.c" with
also a line number which at the moment I can't read (hooked up
themonitor to another computer to be able to write this mail).

Grant Grundler wrote:
 
> The drives shipped with workstations had "Write Cache Enable" (aka WCE)
> turned on by default.  Not good if you really care about your data.
> But Tag queue depth of 2 works great because the drive will immediately
> report "success" until it's on-board cache was full.
I'm currently not using HP drives but two disk drives that worked fine
in a sun workstation and a macintosh, IIRC. Both worked fine with
NetBSD, OpenBSD and some other os's.

I really did a sort of razzia dismantling half of my server and
workstations when I first tried installing linux to get some working
drives. I remember trying out several IBM DFHSS and similar drives of
the 1, 2 GB size. 
The original HP 525MB scsi drives (rebranded Quantum ProDriveLPS 525S)
gave problems too. I have one of those unused and this is the one I used
to test the kernel again.

Currently the machine has a Seagate ST566 (palo and user home as well as
scratch) and a IBM DORS 2GB disk with root. They both are reported as
scsi-2...

 
> >  as the 715
> > is a workstation it might be worth trying setting tags to 2 and seeing
> > what happens?
> 
> Unless performance is more important than strict correctness, I still
> reccommend tag queue depth of 8 and disable "Write Cache" setting.
> Reducing queue depth further typically only limits performance.
> 
> I suspect something else is wrong in Riccardo's case. But it wouldn't
> hurt disable queue tags completely and see if that is at least stable.
Indeed, since I'm not using HP drives. I looked at the jumpers of the HP
relabeled disk and I found none regarding caching.
But does tag queueing affect the controller the disks or both? Either
all my disks are bugged or...

A later post in this thread mentions that setting tag to 0 is not a good
idea and that 2 or 4 would be a resonable value.


I already have quite poor scsi performance. running hdparm -tT yields me
about 8-10 MB buffer but only about 1.5MB/sec non-buffer read! I'd
expect more something around the 4-5Mb/sec range...

-Ric

PS. I hope someone has a suggestion for revitalizing my scorpio. Hooking
up an external CD to get the gentoo live-cd and then reinstalling is a
nuisance
PPS: right now root partition is raiser, so at least I don't loose data
when the sytem freezes and the genoo portage tree doesn't fill up my
disk with small files. SOmeone suggested Raiser being not stable,
howewer since the freeze happens already at MKFS (ext2/ext3 too) and
also did happen on a previous install some weeks ago with ext2 file
system (on a different, HP branded disk!) I think it is unrelated. The
scsi driver sees the problem (or something else affects the scsi driver,
some cache flushing for example)
