Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3703B496D
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 09:09:19 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D85B@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "'John Marvin'" <jsm@udlkern.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Cc: "Uetrecht, Daniel J." <uetrecht@umr.edu>
Subject: RE: [parisc-linux] HP-UX binary compatibility
Date: Thu, 4 Oct 2001 10:07:59 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Cool. Looks to be working. 

Looks like the most noticeable missing syscalls are the sig* ones as you've
mentioned below. (Would be nice to get a syscall wrapper lookup table so it
at least would spit out the name of the unwrapped syscall.)

Is there any reasonable way to trace the hpux binaries? strace doesn't see
anything past the exec. Looks like I'm able to run lmutil/lmgrd, but they
get a hostid of 0. 

It's the uname call that's returning the zero:

inst2:/products/hpux# chroot /products/hpux /uname -a
Linux inst2 2.4.9-pa #3 Thu O parisc inst2 #3 Thu O
inst2:/products/hpux# chroot /products/hpux /uname -i
inst2

troot-halley(11)> uname -a
HP-UX halley B.10.20 A 9000/735 2002000004 two-user license
troot-halley(12)> uname -i
2002000004

It's that 2002000004 that I need. That appears to be the idnumber field of
the uname results. Should be simple enough to adjust the system call code as
needed, especially since I'll just need to return a known value in my case.
(Presuming that's the mechanism the the lmgrd fetches is with. If it uses
the lanscan approach, that'll be harder.)

-- Nathan

> -----Original Message-----
> From: John Marvin [mailto:jsm@udlkern.fc.hp.com]
> Sent: Thursday, October 04, 2001 6:57 AM
> To: parisc-linux@lists.parisc-linux.org
> Subject: [parisc-linux] HP-UX binary compatibility
> 
> 
> 
> I just committed a patch that restores some of the elementary HP-UX
> binary compatibility functionality. Shared libraries also work. But
> there is a ton of more work to do. Lots of wrappers need to be written
> (see the arch/parisc/hpux directory for files that contain the support
> for this functionality). One major missing piece is signal support.
> Mapping ioctl arguments is another significant effort ...
> 
> John
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
