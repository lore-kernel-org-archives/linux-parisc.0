Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BF19482A
	for <PARISC-LINUX@LISTS.PARISC-LINUX.ORG>; Thu, 14 Jun 2001 07:49:35 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9BA95B007; Thu, 14 Jun 2001 14:45:08 +0100 (BST)
Date: Thu, 14 Jun 2001 14:45:08 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: BOSCHINI@ICIL64.CILEA.IT
Cc: PARISC-LINUX@LISTS.PARISC-LINUX.ORG, BOSCHINI@cilea.it
Subject: Re: [parisc-linux] Re: problem installing on HP735
Message-ID: <20010614144508.Z16532@linuxcare.com>
References: <01K4REDVBWF6001R4D@ICIL64.CILEA.IT>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01K4REDVBWF6001R4D@ICIL64.CILEA.IT>; from BOSCHINI@ICIL64.CILEA.IT on Thu, Jun 14, 2001 at 03:35:07PM +0000

On Thu, Jun 14, 2001 at 03:35:07PM +0000, BOSCHINI@ICIL64.CILEA.IT wrote:
> Hello all, 
> 
> I changed HW, still 735 Apollo, and finally succeeded in going through the
> first install. I got O.S. with no problem but had to do a
> 
> debootstrap sid /target file:/instmnt/debian from shell, since installtion
> procedure seemed to hang (more than 1.5 hr).
> Then I made the system bootbale and rebooted....

Maybe you should have done 'configure base system' before reboot.

> boot starts but then I get a "can not create tty4" and then 
> 
> modprobe: modprobe can't locate module char-mayor-4  
> 
> for many times. 
> 
> Then 
> init respawning too rapidly 
> 
> and finally everything hangs.
> Rebooted in single user. /etc/fstab empty.
> Inserted /, swap and proc , rebooted, but / is mounted in read-only...
> Still get 
> INIT RESPAWNING TOO RAPIDLY....
> 
> any help ?

There are two /etc/inittab files used in install, sounds like you
are still running the first one.

Reboot with init=/bin/sh
mount -o remount,rw /dev/???? /
cd /etc
mv inittab inittab.inst
mv inittab.real inittab
sync
mount -o remount,ro /dev/???? /

Power off/on, and try to boot again.  Might come up, might not.  If
it does, then "dpkg-reconfigure base-config" might let you run the
second half of the install.

The reason you had problems running the install properly is probably
because the 735 has a PCX-T cpu, which is known to have problems with
GLIBC 2.2.1.

Richard
