Received: from rhirst.linuxcare.com (sleepie.demon.co.uk [194.222.23.208])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id QAA15182
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Nov 2000 16:00:46 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 047E4B007; Thu,  9 Nov 2000 23:00:50 +0000 (GMT)
Date: Thu, 9 Nov 2000 23:00:50 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@puffin.external.hp.com
Message-ID: <20001109230050.H32715@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] strace working
List-ID: <linux-parisc.vger.kernel.org>

I have updated the strace source in our cvs, such that it now
builds a basically working binary.  It requires an up-to-date
kernel.

Outstanding issues:

a) ioctl defines in linux/hppa/ioctlent.h are probably wrong
b) there is a hack in defs.h to get round a problem where the
   libc wrapper for ptrace() isn't getting used
c) there is a struct user defined in defs.h that should probably
   be in the kernel source asm/user.h
d) there are probably more places where we need to add HPPA
   specific code

Richard
