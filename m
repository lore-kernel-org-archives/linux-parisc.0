Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA20269
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Feb 2000 03:41:54 -0700
Sender: mang@mailserv2.iuinc.com
Message-ID: <389FE2A0.29B67888@subcarrier.org>
Date: Tue, 08 Feb 2000 04:32:16 -0500
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: parisc-linux@thepuffingroup.com
References: <20000206143806.A871@alpha.franken.de>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Merging with 2.3.42 today
List-ID: <linux-parisc.vger.kernel.org>

Picking up NFS support seems like a good reason to merge very soon.  The
diff between our current tree (based on 2.3.29) and the latest kernel
version 2.3.42 is large (~350k lines!)

The merge will have conflicts with the following files:
./drivers/block/rd.c:<<<<<<< rd.c
./drivers/char/serial.c:<<<<<<< serial.c
./drivers/net/tulip.c:<<<<<<< tulip.c
./fs/Makefile:<<<<<<< Makefile
./fs/buffer.c:<<<<<<< buffer.c
./include/linux/init.h:<<<<<<< init.h
./include/linux/mm.h:<<<<<<< mm.h
./include/linux/ncp_fs.h:<<<<<<< ncp_fs.h
./init/main.c:<<<<<<< main.c
./kernel/resource.c:<<<<<<< resource.c
./mm/Makefile:<<<<<<< Makefile
./mm/bootmem.c:<<<<<<< bootmem.c
./mm/filemap.c:<<<<<<< filemap.c 
(plus some other spurious conflicts)        

Here's my plan:
- lay down a LINUS_2342_PREMERGE static tag this afternoon (~2pm EST)
- the tree is closed -> no one checks in
- check in the 2.3.42 code
- everyone works on fixing merge problems/regressions only
  - get back to a shell prompt/ping response
- lay down LINUS_2342_DEVEL_BASE
- tree open for new features

Merging will generate large diffs, and most will be unrelated to
PA-RISC.  This is why I ask that no new features be checked in between
the PREMERGE and DEVEL_BASE tags.  Those two tags will isolate the big
changes so that new PA-RISC features are not lost in the
noise.  The whole process should only take an hour if the people who
"own" the files with conflicts are available.

If you want to get a head start, do a "cvs up -j linus2329 -j linus2342
somefile_or_somedir" to merge in Linus' changes between 2.3.29 and
2.3.42 into your working directory.  But please don't check in any fixes
until after Linus' code is merged into the tip.  Thanks for your
cooperation/patience.

I would have done this now, but it would be bad form to leave the tree
broken and go home to sleep.  If someone else wants to start this
earlier in the day, feel free. :)

	- Mike.

Thomas Bogendoerfer wrote:
> 
> in our IRC meeting on friday we had a little discussion whether to merge
> with a more recent 2.3 kernel version or not. I now have a reason why we
> need to update ASAP to a newer kernel. NFS is broken in 2.3.29 :-(
> I'm going to update my local tree to see whether we need to do more work
> for nfs.
