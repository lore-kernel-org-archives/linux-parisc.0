Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (lt200001.hrz.uni-oldenburg.de [134.106.156.150])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB00148B4
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 11:09:23 -0600 (MDT)
Received: (from tsbogend@localhost)
	by solo.franken.de (8.11.6/8.11.6) id f8TH8lI13717
	for parisc-linux@lists.parisc-linux.org; Sat, 29 Sep 2001 19:08:47 +0200
Date: Sat, 29 Sep 2001 19:08:47 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010929190847.A13532@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Comments to 2.4.9-pa28
List-ID: <linux-parisc.vger.kernel.org>

Hi,

during my stay here in Oldenburg I've got a really nice looking X11 desktop
on a B180 workstation (even colors are looking sane now). While I was
hunting for stifb bugs, the real hard bugs have been in shm handling. The
first one was a problem with flushing the shm page to memory before the
user process uses it. The more annoying one was a mismatch between
shmid_ds from kernel and glibc. Because of that the X server thought it
got passed zero sized shared memory segments from the X clients and
refused to use it. That was the reason for getting really strange pictures,
when using wmaker or enlightenment, which both use MIT-SHM extension very
much. I've changed the kernel representation of shmid_ds, but we could also
change the glibc one. But this would force a recompilation of all programs,
which are using shmctl (.., IPC_STAT, ..).

The change in pgalloc.h isn't the best one, but it served me best for
the moment. The changes in stifb.c fixes the blank function (this caused
the white is blue color problem under X) and added VISUALIZE-EG support
(I'm treating them as a normal artist graphic, which works pretty well).

Greetings from Oldenburg,
Thomas.

PS: If someone wants a testcase, which shows the shm cache flush bug,
either use mm_test from libmm or mail me, I've written a small one.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
