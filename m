Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 829984863
	for <parisc-linux@lists.parisc-linux.org>; Sun, 23 Sep 2001 08:07:30 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15l9ul-0008Od-00
	for parisc-linux@lists.parisc-linux.org; Sun, 23 Sep 2001 16:07:23 +0200
Date: Sun, 23 Sep 2001 16:00:05 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nfsroot login problems on 720/50
Message-ID: <20010923160005.A30607@dogbert.localdomain>
References: <20010921193553.A11874@dogbert.localdomain> <20010921180529.C32145@megatonmonkey.net> <20010922015609.A14166@dogbert.localdomain> <20010922125826.C6488@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010922125826.C6488@megatonmonkey.net>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

Hello,

On Sat, 22 Sep 2001, Carlos O'Donell Jr. wrote:

> > 
> > Should I try the base tarball (same date... :-( ) or is that known to be
> > bad too?
> >  
> 
> In reality all those tarballs are old, glibc is old... it's all old.
> Usually the problem lies in a bad telnetd that was on those tarballs.
> I think I remember xcompiling telnetd and sticking it into the nfsroot.
> Remember that mounting an nfs root will cause the root to be a readonly
> fs. This raises some large issues, but should still allow you to login.

What if it is a rw,no_root_squash export? Or does the Debian initscript
not support remounting the nfsroot rw? Or is it a limitation of the
Linux kernel?
 
> > I have not modified anything in the nfsroot to use devfs, and I don't
> > think it's in the make oldconfig kernel I'm using, so I'd guess not.
> The nfsroot doesn't care about devfs. Though the kernel does.
> Try make menuconfig and enable devfs. Compile a new kernel, stick it
> in your tftp directory and reboot.

Okay, will do. I've enabled CONFIG_DEVFS_FS and CONFIG_DEVFS_MOUNT.
 
> > I have tried the CD-ROM installer (0.9.2), but kernel on there wouldn't
> > let me get past where init starts (more of this unaligned trap
> > goodness, according to the debian-hppa folks); init was running in some
> > kind of loop or something.
> > 
> 
> Same here with 712/60, 715/50, and 715/33 (though I haven't tested
> it fully since I had a root tarball that was serving the purpose).
> If you can get the system to a semi-running state, you can use apt
> to dist-upgrade to the latest everything. Which is what I've done.
> 
> Though I'm looking at fai.
> 
> > P.S. Are there any 720/50's out there that actually work? :-)
> 
> Check the site. See the hardware list. Find some 720/50 owners and
> email them :)

When booting with the old baseplus, I got the following messages:

INIT: version 2.78 booting
rcS(13): unaligned access to 0x0007dca3 at ip=0x0005d807
Not-handled unaligned insn 0x0cd31200
Unaligned handler failed, ret = -1 INIT: Entering runlevel: 2
<4>rc(16): unaligned access to 0x0007dca3 at ip=0x0005d807
Not-handled unaligned insn 0x0cd31200
Unaligned handler failed, ret = -1 <4>rc(17): unaligned access to
0x0007dca9 at 
ip=0x0005db23
Not-handled unaligned insn 0x0f131200
Unaligned handler failed, ret = -1 
Debian GNU/Linux testing/unstable
pehc base tarball 2001-04-04 see /home/demo/README for more info
bob login: 

Should these concern me, or not?

I'm going to try building a new nfsroot tarball with the latest debs.
Hopefully that will do the trick.

Regards,

Albert
