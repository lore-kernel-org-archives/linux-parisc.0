Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 937794829
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 06:54:03 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17zzIm-0002cE-00; Fri, 11 Oct 2002 13:54:00 +0100
Date: Fri, 11 Oct 2002 13:54:00 +0100
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk@pp.fishpool.fi>
Cc: Thibaut VARENE <varenet@esiee.fr>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] hardware features of 712-60 ?
Message-ID: <20021011135400.J18545@parcelfarce.linux.theplanet.co.uk>
References: <20021011132811.6e84c1d8.varenet@esiee.fr> <Pine.LNX.4.21.0210111454200.24681-100000@hal.pp.fishpool.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <Pine.LNX.4.21.0210111454200.24681-100000@hal.pp.fishpool.fi>; from q-funk@pp.fishpool.fi on Fri, Oct 11, 2002 at 03:22:14PM +0300
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Oct 11, 2002 at 03:22:14PM +0300, Martin-Éric Racine wrote:
> 2) Memory:  which module?  In which dialogue?

do you know of any linux architecture where you have to turn on a
configuration option to access your _ram_?  ok, x86 has that lame
1GB/4GB/64GB question, but parisc doesn't ask you a question about it.
why are you complaining?

> 3) Optional RS-232:  which module?  In which dialogue?

it says "serial driver" right after it.  the precise option you need to
turn on is :
      bool '   serial port on GSC support' CONFIG_SERIAL_GSC

> 6) Floppy:  which module?  PC Floppy definitely doesn't work.

no, nobody's made the floppy drive work yet.

> 8) Parallel:  which modules?  LASI/ASP builtin, or PC-style hardware too?

just LASI/ASP.

> b) SCSI:  HP LASI SCSI support for 53c700/710, or NCR53c7,8xx SCSI support too?

just the former.

> d) Optional BA:  which module?  In which dialogue?
> e) Core BA:  which module?  In which dialogue?

dep_bool '  Lasi I/O support' CONFIG_GSC_LASI $CONFIG_GSC

is this really so hard?

-- 
Revolutions do not require corporate support.
