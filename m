Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 03CD5482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Jan 2002 02:30:45 -0700 (MST)
Message-ID: <3C4E8289.EB6C5FE6@hpfrcu81.france.hp.com>
Date: Wed, 23 Jan 2002 10:29:45 +0100
From: phi 4369 <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
To: Enrik Berkhan <Enrik.Berkhan@planb.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] vmlinux header for savecrash.
References: <15417.3793.688638.629130@gargle.gargle.HOWL> <20020107034615.9BFD64839@dsl2.external.hp.com> <E16T74R-0002Ko-00@noam.fc.hp.com> <20020123095705.A8923@electra.intern.planb.de>
Content-Type: text/plain; charset=us-ascii
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Hmm, so why don't let palo calculate a CRC32 or MD5 (if affordable)
> over the image it is about to boot and pass this as parameter that will
> be saved in the dump? This would be very independent of filesystem
> changes in the time between boot and crash (e.g. installing a new kernel
> moving everything around in /boot). This could also be done for an
> initrd image if used. And it still works if you have more than one
> kernel image with the same "version" lying around.
> 

Having the CRC at dump time doesn't add more than just the utsname (i.e the
uname -a if you wish) as the utsname does have the uniq signature of the os
version PLUS the build time. So it is not possible to have 2 kernel with the
exact same version AND the same build time if they are different, or not only
different but compiled at different time.

The problem afterward at next reboot (while the dump seat in the dump area,
often the swap area) and while sometime rebooting a recovery kernel, i.e not
the one that just dumped, is to run savescrah, and have savecrash placing the
core along with its accompagnying kernel (and the loaded module too, more on
that later).

Finding the kernel who crash assuming a signature, mean then a scan of all the
kernel we could find on the machime, with simple heuristic we could reduce
this to / and /boot, then compare the utsname (version build time) for each.
This is rather brute force and it will be our 1st implementation, until we can
find the boot kernel path probably given by palo as palo is the one that can
get interactivly any kernel path....

Ultimatly if we can't figure out what was the kernel who crashed, we can ask
interactivly :-(

Cheers,
Phi




--
mailto:Philippe_Benard@hp.com
WTEC HP-UX kernel debugging tools
