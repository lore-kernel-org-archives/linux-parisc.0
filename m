Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8FD07482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Sep 2001 10:30:51 -0600 (MDT)
Date: Sat, 22 Sep 2001 16:30:43 +0000
From: Richard Allen <ra@hp.is>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C360 install fails
Message-ID: <20010922163043.A16403@hp.is>
References: <20010921135335.E11577@hp.is> <20010921213801.K24917@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010921213801.K24917@linuxcare.com>; from rhirst@linuxcare.com on Fri, Sep 21, 2001 at 09:38:01PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 21, 2001 at 09:38:01PM +0100, Richard Hirst wrote:

> On booting, my C360 says
> 
> 1. Raven U/L2 Dino RS-232 (10) at 0xf2003000, versions 0x6, 0x0, 0x8c, 0x0, 0x0 
> 3. Raven+ w SE FWSCSI Core RS-232 (10) at 0xffd05000, versions 0x56, 0x0, 0x8c, 0x0, 0x0
> ...
> ttyS00 at iomem 0xffd05800 (irq = 154) is a 16550A 
> ...
> 
> So 0xffd05805 looks like a reasonable address for it to try and access.
> 
> Does it crash at the same place if you try again?

I didnt give up and I tried all kinds og combinations.  I noticed
when I was booting off the CD (for the tenth time I think) that
the install kernel was 32 bit so I opted for that one a I got further.
I actually got so far as it began installing packages, but crashed
at random places in the package installation.

I then loopback mounted the ISO image and NFS exported it and did the
install via NFS and then finally it worked.

Then when I had the system up and running I was adding extra packages
(telnetd, openssl and openssh) when it crashed again.

I now have it in a pretty good state. Ive "apt-get upgrade" every package
and installed all the development environment and compiled yesterdays
kernel snapshot.

bofh:~# uname -a
Linux bofh 2.4.9-pa24 #2 Fri Sep 21 20:40:31 UTC 2001 parisc unknown
bofh:~# uptime
 16:29:35 up 19:10,  1 user,  load average: 0.00, 0.00, 0.00

Not a single crash since I booted the new kernel so Im very hopeful
that Ive gained some stability.

Now to find an area I can contribute to :)

-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
