Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D8A848C5
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 18:27:50 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel7.hp.com (Postfix) with ESMTP id 834CA8054E1
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 20:27:49 -0500 (EST)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id SAA05161
	for parisc-linux@lists.parisc-linux.org; Fri, 8 Mar 2002 18:27:34 -0700 (MST)
Date: Fri, 8 Mar 2002 18:27:34 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200203090127.SAA05161@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Swap space limitions for Linux on parisc
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

> Forget about swapping over NFS.  It's prone to deadlock under
> stress.  I think we support 2GB/file and up to 8 files, but I may be
> underestimating... John would know.

For a 32 bit kernel:
    128 Gb per file, up to 32 files for a total of 4 Tb.

However, there are two limitations that you have to work around to get that:

    1) mkswap was never modified for parisc, so I believe it sets a limit
    of 2 Gb.  I once hacked a version of it, but I never got around to
    submitting the change, because I had some questions about some
    comments in the code that I believed were out of date, but wasn't sure,
    put it on the backburner, and dropped the ball.

    Anyway, I believe the change was simple, and I tested at least a 16 Gb
    swap partition at one time.

    2) Although we can support 32 swap files, Linux currently has a limit
    of 8. However, I think the only change to allow 32 is to change
    MAX_SWAPFILES in include/linux/swap.h to 32. I don't think there are
    any other intrinsic limitations there.

    3) Note that a swap map is allocated for each swap file.  The swap map
    takes 2 bytes for each page of swap.  This swap map is vmalloc'd, so
    that places another limitation on the total swap size.  The vmalloc
    address space starts after the end of physical memory, so the more
    physical memory you add, the LESS swap space you can have.  But that
    isn't likely to become an issue until you need more than a terabyte of
    swap space.

For a 64 bit kernel the size of a swap partition can be even larger than
128 Gb.  But I really can't say how much larger, because there are a bunch
of variables that get involved and I don't have the time to try to muddle
through them all. Some of those variables:

    1) Disk size limits / Disk addressing limits
    2) swap partition format limits
    3) physical memory limits (limits size of all swap maps)
    4) vmalloc address space limits (limits size of all swap maps)

Note that I didn't mention the SWP_OFFSET limit, which is the main limitation
for the 32 bit kernel. For a 32 bit kernel we dedicate 25 bits to swap
offset, which gives us the 128 Gb limit (2^25 x 4K page size). For a 64
bit kernel we have 57 bits, so that is not the limiting factor. One of
the above will set the limit.

John

P.S. Note that we don't support 64 bit user space processes yet, so you
would probably find it difficult to consume extreme amounts of swap
space, since each process can only address ~4Gb of memory.
