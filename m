Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA01866
	for <parisc-linux@puffin.external.hp.com>; Sat, 29 Jul 2000 01:09:24 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel1.hp.com (Postfix) with ESMTP id 73D9A436
	for <parisc-linux@thepuffingroup.com>; Sat, 29 Jul 2000 01:11:25 -0600 (MDT)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id BAA04443 for parisc-linux@thepuffingroup.com; Sat, 29 Jul 2000 01:11:21 -0600 (MDT)
Date: Sat, 29 Jul 2000 01:11:21 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200007290711.BAA04443@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] New Linux Gateway Page
List-ID: <linux-parisc.vger.kernel.org>



I recently checked in changes to move the linux gateway page out of the
user address space and into the kernel address space (this was discussed
many months ago on this list).

Temporarily, to make the transition easier, the old linux gateway page
still exists.  I'm hoping that Paul Bame/Matt Taggart will build a new set
of programs for ramdisks and nfsroot's.  I also assume that one of them
will checkin the changes to glibc to support the new gateway page and post
a new tool chain tarball (Paul has already built a tool chain for it,
which I used for some testing, so he just needs to check the stuff in once
he finishes testing).  Once everything is switched over, I can remove the
old gateway page.

Some notes regarding the changes:

1)I modified the kernel version of unistd.h to reflect the new syscall
  method.

2) The new syscall method relies on the kernel setting sr2 to point
to the space of the new gateway page. If the user program modifies sr2
then syscalls will stop working for that process. Note that this
applies only to Linux native apps.

3) Once I remove the old gateway page I will also move the setup of
the HP-UX gateway page into the som specific code, so only som executables
will have this page sitting in the middle of their address space.

4) During the transition, arch/parisc/kernel/syscall.S has code for the
two (old and new) linux gateway pages essentially duplicated. If you
change code for one page, try to remember to change it for the other
page.

5) Even though signals currently use a signal return path on the old
gateway page, signals should still work using the new gateway page (as
long as the old gateway page remains around). I'll need to make some
changes before I can actually remove the old linux gateway page.

6) NOTE:  The location of the linux gateway page is mapped to virtual page
zero in the kernel space.  Since gateway pages are execute only, this page
will still serve the purpose of trapping null pointer dereferences.
HOWEVER, the trap type will be different.  Before, a null pointer
dereference would cause a trap type 15 (Data TLB Miss), now it will
produce a trap type 26 (Data memory access rights violation).  Note that
execution through a null indirect function pointer (while executing in the
kernel) will hit a series of break instructions at the beginning of the
page (the actual syscall entry point starts at 0x100).  Right now break
instructions just cause a "Halted" message and a register dump.  I'll fix
that when I get back from vacation (if someone doesn't beat me to it).

I'll be on vacation for the next week (doing rocketry for a whole week
at the NAR's national launch/competition in Canon City, CO). I'll be
back the week following.

John Marvin
jsm@fc.hp.com
