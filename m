Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id XAA04119
	for <parisc-linux@puffin.external.hp.com>; Sun, 19 Nov 2000 23:00:23 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by palrel1.hp.com (Postfix) with ESMTP id C967FEC0
	for <parisc-linux@puffin.external.hp.com>; Sun, 19 Nov 2000 22:02:33 -0800 (PST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id XAA24123 for parisc-linux@puffin.external.hp.com; Sun, 19 Nov 2000 23:01:20 -0700 (MST)
Date: Sun, 19 Nov 2000 23:01:20 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200011200601.XAA24123@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: A500 and glibc woes
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


Ingo,

>
> finally we've got a A500 for palinux testing. Unfortunately
> we have some problems with it.
> A 32 bit kernel complains about a very old firmware and claims
> "that machine will probably never run linux"  But in fact, it
> will :-)

Actually, there are no plans to ever support the A500 on a 32 bit
kernel. The A500 only has 64 bit firmware, so in order to support
it we would need to write a 32->64 bit firmware translation layer.

...

> A 64 bit Kernel boots fine and recognizes all available hardware
> including the additional 100BT card. But it traps with the init
> which comes with the latest nfsroot tarball. I built a new one
> from the sourcesw of debians sysvlinux-2.78 and it does not trap
> anymore, but the kernel told me about unimplemented 32 syscalls.
> At this point I tried to build a 64 bit glibc in order to get
> a crt1.o , which is needed to builf for a 64bit init.
>

Well, it might seem crazy, but our short term plans do not include
supporting a 64 bit user environment on the 64 bit kernel.  Long term I
believe this will happen, but as you have already seen, work needs to be
done to support 64 bit glibc, shared libraries, etc.

So, in order to get the A500 to boot, we need to support the 32 bit user
environment on a 64 bit kernel.  We've only recently gotten to the point
where the 64 bit kernel gets far enough to start running user space
applications.  The problem is that we need to write translations for many
system calls, since type sizes (and the structures those types are in) are
different between 32 bit and 64 bit (the ugliest case is the ioctl system
call).

In summary, the A500 currently won't work, but since it is one of the
machines that HP has targetted for Linux support, you can be sure that
this will change fairly soon.

John Marvin
jsm@fc.hp.com
