Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-01.iinet.net.au [203.59.24.16])
	by dsl2.external.hp.com (Postfix) with SMTP id 004F1482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Jun 2001 12:16:30 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id CAA09076
	for parisc-linux@lists.parisc-linux.org; Fri, 8 Jun 2001 02:15:23 +0800
Date: Fri, 8 Jun 2001 02:15:21 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Apollo 735/99 hangs after booting from CDROM
Message-ID: <20010608021517.T12793@neep.com.au>
References: <F214YiMCIqtQvAauNjV0001bb18@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <F214YiMCIqtQvAauNjV0001bb18@hotmail.com>; from mikewerneke@hotmail.com on Thu, Jun 07, 2001 at 03:51:22AM -0000
List-ID: <linux-parisc.vger.kernel.org>

Mike,

Do you have a serial terminal?  Or just a null modem cable and a
"borrowed" Windows PC, perhaps?  You could convert the ISO into the
serial-boot one using the sector0 file from the 0.9 release directory
and see if you can boot the box with your serial terminal or null modem
cable to a terminal emulator program on another workstation.

An easy way to test the original ISO image from which you burned the CD
is to mount the .iso file under Linux (any architecture) as a loopback
iso9660 filesystem.  There are also published checksums to compare
against the .iso file.  You can also check the md5sums of the kernel
images on your burnt CD against those within the mounted .iso file.

(Sorry I cannot be more helpful but I have not yet got the 0.9 iso file
burnt onto a CD yet.)

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
