Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA28358
	for <parisc-linux@puffin.external.hp.com>; Sun, 9 Jul 2000 12:41:38 -0600
Date: Sun, 9 Jul 2000 14:42:59 -0400 (EDT)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] e2fsprogs available
In-Reply-To: <20000630194149.EE49F37E33@carmen.fc.hp.com>
Message-ID: <Pine.BSO.4.21.0007091433510.14827-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Fri, 30 Jun 2000, Matt Taggart wrote:
> Using the above I was able to natively partition, mke2fs, mount, create files, 
> execute files, umount, and fsck using the scsi disk in my 712.

Verified to work on a 715/64 with the LASI/SCSI driver.  Except for the
mounting part, as I don't have a mount binary yet...

Also, in case anyone was wondering, the cross-compiler problems
from ALPHA seem to have been fixed.  I've booted an ALPHA-compiled kernel.

I tried compiling a native binutils, but all the binaries cause
a page fault when run, so I must be missing a configure flag or something.
(Why is it that configure --help just never seems to do the trick :(  )
Would it be a problem that I installed glibc in the nfsroot tree and
then ln'd my i386's /usr/local/hppa1.1-linux/lib to there?

GCC won't build a native, complains about a missing nss symbol.

--
Brian S. Julin
