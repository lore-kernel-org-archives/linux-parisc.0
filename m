Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8325E482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 12:21:13 -0600 (MDT)
Date: Thu, 23 Aug 2001 14:21:10 -0400 (EDT)
From: <nick@snowman.net>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 netbooting
In-Reply-To: <20010823181407.890B4482A@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.21.0108231418490.16296-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I'm not even getting that far.  I can't get the linux kernel to start
booting, I always get errors along the lines of 
Current command line:
vmlinux HOME=/ TERM=vt100 root=/dev/nfs nfsroot=172.16.1.1:/mnt
console=ttyS0
 0: vmlinux
 1: HOME=/
 2: TERM=vt100
 3: root=/dev/nfs
 4: nfsroot=172.16.1.1:/mnt
 5: console=ttyS0
Edit which field?
(or 'b' to boot with this command line)? b
Kernel: partition 0 file vmlinux
ERROR: Read from boot device failed (status = -3).
byteio_read: seekread() returned -1 expected 2048

I'm assumeing paramater 0 is set wrong, but I've tried 0/vmlinux and
vmlinux, neither work.  What should I set it to?  Should I use a different
lif image?  Where can I get a lifimage known to work for this?
	Thanks
		Nick

On Thu, 23 Aug 2001, Helge Deller wrote:

> On Thursday 23 August 2001 18:58, nick@snowman.net wrote:
> > Hi, I'm trying to get a C180 booting entirely off the network.  I can load
> > a lifimage over bootp, however then I'm stuck.  There is a vmlinux
> > attached to the lifimage, but I can't figure out how to tell the loader to
> > boot that and use an NFSroot.  I have found a few suggestions (vmlinux
> > HOME=/ TERM=linux root=/dev/nfs nfsroot=mynfs:/dir) and that dosen't seem
> > to work.  Do I need a special lifimage?
> > 	Nick
> 
> Hi Nick,
> 
> you forgot to mention which kernel version you booted.
> In case you use a newer 2.4 kernel you'll have to add "ip=bootp" and should use 
> an ip-address instead of <mynfs> in the nfsroot parameter.
> 
> Greetings,
> Helge
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
