Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-01.iinet.net.au [203.59.24.16])
	by dsl2.external.hp.com (Postfix) with SMTP id 7051A482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 09:32:07 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.neep.com.au (8.9.3/8.9.3/Debian/GNU) id XAA03262
	for parisc-linux@parisc-linux.org; Fri, 13 Apr 2001 23:31:57 +0800
Date: Fri, 13 Apr 2001 23:31:54 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Booting 735/99
Message-ID: <20010413233152.F8797@neep.com.au>
References: <007701c0c415$3f4779a0$1401a8c0@peewee>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <007701c0c415$3f4779a0$1401a8c0@peewee>; from mvdw73@one.net.au on Fri, Apr 13, 2001 at 10:28:27PM +1000
List-ID: <linux-parisc.vger.kernel.org>

Matthew van de Werken said:
> I have a 735/99, onto which I'd like to install hppa-linux. However, I don't
> have any of the usual methods of installing software (I have no bootable
> CD-ROM, no tape, no network (without linux - chicken and egg problem).
> 
> Hwever, I *do* have a SCSI disk and a linux-x86 box onto which I can mount
> this disk temporarily. What I'd like to be able to do is to dump a disk
> image onto this disk, then transfer it to the 735, and boot from there. Is
> this possible? Is there a disk image somewhere I can use for this?

By "no network" do you mean the 735 doesn't have a network interface?
Or it does, but there's no network for you to connect it to?

If you're able to move that i386 Linux box to where the 735 is, or
vice-versa, so that you can connect them via Ethernet, then that would
likely be the easiest option.  Then with a bootp server (or a dhcpd that
can do bootp, eg the ISC dhcp server) on the Linux box you can serve the
735 a kernel to boot from and an NFS filesystem to mount.

As far as making that SCSI disk bootable to the HP, I have no idea if
this would work but you could try taking the current (out-of-date) CD
image from the FTP site and just writing it to the SCSI disk with dd.
I don't think a partition table written on the i386 would be readable by
the HP box though.

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
