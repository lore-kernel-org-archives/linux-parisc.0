Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 098D74A19
	for <parisc-linux@parisc-linux.org>; Mon,  5 Mar 2001 17:39:23 -0700 (MST)
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: New XC available was Re: [parisc-linux] 64-bit compiler millicode
 update
In-Reply-To: Message from Matthew Wilcox <matthew@wil.cx>
   of "Fri, 02 Mar 2001 20:10:08 GMT." <20010302201008.G24088@parcelfarce.linux.theplanet.co.uk>
References: <E14YdVL-0000NE-00@noam.fc.hp.com> <bame@fc.hp.com>
 <20010302012631.C62DB37CB2@carmen.fc.hp.com>  <20010302201008.G24088@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Mar 2001 17:41:55 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010306004155.3A22137CB2@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox writes...

> On Thu, Mar 01, 2001 at 06:26:31PM -0700, Matt Taggart wrote:
> > The full xc with this change and also the recent glibc changes is now 
> > available at,
> > 
> > ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20010301.tar.g
> z
> 
> There's something wrong with the compiler:
> 
> /opt/palinux/lib/gcc-lib/hppa-linux/2.97/tradcpp0: /lib/libc.so.6:
> 	version `GLIBC_2.2' not found (required by
> 	/opt/palinux/lib/gcc-lib/hppa-linux/2.97/tradcpp0)
> 
> we're trying to track it down.  in the meantime, use your current toolchain
> and the libgcc.a from /opt/palinux/lib/gcc-lib/hppa64-linux/2.97/

OK, the problem was that I built the xc on a system running Debian unstable 
which has glibc 2.2.2. So the xc didn't work on systems with an older glibc. 
I'd always gotten away with it up until now. So from now on I will build all 
xc's on a system no newer than the Debian stable release (currently potato, 
glibc 2.1.3).

I have placed a new xc at,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20010305.tar.gz

This xc includes Alan Modra's recent merge to upstream 20010204.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
