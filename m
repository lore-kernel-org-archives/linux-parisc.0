Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust171.bre.cable.ntl.com [213.105.88.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3CD6482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 May 2001 07:53:50 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id AD8BFB008; Mon, 28 May 2001 14:51:09 +0100 (BST)
Date: Mon, 28 May 2001 14:51:09 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Cc: amodra@one.net.au
Subject: Re: [parisc-linux] elflink.h (elf_bfd_final_link)
Message-ID: <20010528145109.A25745@linuxcare.com>
References: <20010528184653.B11349@squeak.one.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010528184653.B11349@squeak.one.net.au>; from amodra@one.net.au on Mon, May 28, 2001 at 06:46:53PM +0930
List-ID: <linux-parisc.vger.kernel.org>

On Mon, May 28, 2001 at 06:46:53PM +0930, amodra@one.net.au wrote:
> Not calling elf_link_output_extsym has the effect that the back-end
> finish_dynamic_symbol routine isn't called, which means various hacks
> are needed like the following:

I built a new binutils from pehc:~amodra/binutils-current, which has
this patch, and it produces a working find and make.

So, we need a new binutils, and a check for more broken binaries.
This check seems to do it, someone can roll it in to plt-checker.

for i in /bin/* /sbin/* /usr/bin/* /usr/sbin/*; do if readelf -r $i 2> /dev/null | grep -q R_PARISC_NONE; then echo ===== $i =====; fi; done

Things I know have a problem are find, make, modutils.  libmagick++5
has also been reported.  However, I don't have much installed, so
someone need to run the check over the archive, I guess.

I still have an issue with the binaries produced from a modutils
build though (e.g depmod), which still have a R_PARISC_NONE in
them.  I've tar-ed up my build tree, as pehc:~rhirst/modutilsbug.tgz
The libc, etc are as per the ones in findbug.tgz.  The binaries do
seem to work, but Alan says R_PARISC_NONE is indicative of a linker
bug.

Many thanks to Alan for his help!

Richard
