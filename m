Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 323F34A19
	for <parisc-linux@parisc-linux.org>; Fri,  2 Mar 2001 13:13:26 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14YvsO-0000rX-00; Fri, 02 Mar 2001 20:10:08 +0000
Date: Fri, 2 Mar 2001 20:10:08 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: New XC available was Re: [parisc-linux] 64-bit compiler millicode update
Message-ID: <20010302201008.G24088@parcelfarce.linux.theplanet.co.uk>
References: <E14YdVL-0000NE-00@noam.fc.hp.com> <bame@fc.hp.com> <20010302012631.C62DB37CB2@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010302012631.C62DB37CB2@carmen.fc.hp.com>; from taggart@carmen.fc.hp.com on Thu, Mar 01, 2001 at 06:26:31PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Mar 01, 2001 at 06:26:31PM -0700, Matt Taggart wrote:
> The full xc with this change and also the recent glibc changes is now 
> available at,
> 
> ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20010301.tar.gz

There's something wrong with the compiler:

/opt/palinux/lib/gcc-lib/hppa-linux/2.97/tradcpp0: /lib/libc.so.6:
	version `GLIBC_2.2' not found (required by
	/opt/palinux/lib/gcc-lib/hppa-linux/2.97/tradcpp0)

we're trying to track it down.  in the meantime, use your current toolchain
and the libgcc.a from /opt/palinux/lib/gcc-lib/hppa64-linux/2.97/

-- 
Revolutions do not require corporate support.
