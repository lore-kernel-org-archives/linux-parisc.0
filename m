Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18506482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  5 Jul 2003 17:53:37 -0600 (MDT)
Message-Id: <200307052353.h65NrZF4025169@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] warning: minor abi change
To: grundler@parisc-linux.org (Grant Grundler)
Date: Sat, 5 Jul 2003 19:53:34 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030705230834.GB9682@dsl2.external.hp.com> from "Grant Grundler" at Jul 5, 2003 05:08:34 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> 1) Dave warned us last December about __canonicalize_funcptr_for_compare
>    and gcc-3.3. "make modules_install" fails with this symbol missing in:
> 
>    	drivers/ide/ide-disk.o (fixed in patch but won't be committed)
> 	drivers/scsi/aic79xx/aic79xx.o
> 	fs/smbfs/smbfs.o
> 	lib/zlib_deflate/zlib_deflate.o
> 
>    Having no clue how to properly fix this in either the toolchain
>    or where to find the man page for __canonicalize_funcptr_for_compare(),
>    I disabled the last three in my .config and hacked ide-disk.c
>    to use (void *) for comparisons.
>    Any volunteer to write some sample code for this?

Instead of adding (void *) to each comparison, you could add a kernel
version of __canonicalize_funcptr_for_compare:

__canonicalize_funcptr_for_compare:
	bv %r0(%r2)
	copy %r26,%r28

or for PA 2.0

__canonicalize_funcptr_for_compare:
        bve (%r2)
	copy %r26,%r28

I think there was a possible solution along these lines posted on the list
a few months ago (joel?).

This solution assumes that canonicalization is unnecessary in the kernel.
Probably, in most cases it is.  However, if you really need to canonicalize
a function pointer from user space, then you are going to have to figure
out how to call into the dynamic loader from the kernel.  This obviously
isn't very safe.  So, possibly this implies that function pointers passed
in syscalls should be canonicalized before the kernel is entered (i.e.,
glibc should do the canonicalization).

As far as kernel modules go, I don't know how function pointers are
handled.  If you pass a function pointer from one module to another,
does it need canonicalization?  If canonicalization is never necessary
in the kernel, possibly I could add a GCC option to disable canonicalization.

Sorry, about the lack of documentation.  To see what the function does,
it's currently necessary to look in the GCC gcc/config/pa directory.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
