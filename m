Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA28777
	for <parisc-linux@puffin.external.hp.com>; Sun, 9 Jul 2000 13:10:51 -0600
From: willy@thepuffingroup.com
Received: from ottawa.linuxcare.com (HELO vodka.thepuffingroup.com) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 9 Jul 2000 19:12:19 -0000
Date: Sun, 9 Jul 2000 14:06:57 -0400
To: "Brian S. Julin" <bri@mojo.calyx.net>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] e2fsprogs available
Message-ID: <20000709140657.W1920@vodka.thepuffingroup.com>
References: <20000630194149.EE49F37E33@carmen.fc.hp.com> <Pine.BSO.4.21.0007091433510.14827-100000@mojo.calyx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSO.4.21.0007091433510.14827-100000@mojo.calyx.net>; from Brian S. Julin on Sun, Jul 09, 2000 at 02:42:59PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jul 09, 2000 at 02:42:59PM -0400, Brian S. Julin wrote:
> Verified to work on a 715/64 with the LASI/SCSI driver.  Except for the
> mounting part, as I don't have a mount binary yet...

you can use -mount, it's a sash builtin.

> Also, in case anyone was wondering, the cross-compiler problems
> from ALPHA seem to have been fixed.  I've booted an ALPHA-compiled kernel.

excellent, that wasn't tested...

> I tried compiling a native binutils, but all the binaries cause
> a page fault when run, so I must be missing a configure flag or something.
> (Why is it that configure --help just never seems to do the trick :(  )
> Would it be a problem that I installed glibc in the nfsroot tree and
> then ln'd my i386's /usr/local/hppa1.1-linux/lib to there?
> 
> GCC won't build a native, complains about a missing nss symbol.

tried --static-nss?

-- 
The Sex Pistols were revolutionaries.  The Bay City Rollers weren't.
