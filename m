From: Kyle McMartin <kyle@mcmartin.ca>
Subject: gcc-4.2-hppa64 bug
Date: Wed, 5 Dec 2007 12:02:19 -0500
Message-ID: <20071205170219.GA3608@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-hppa@lists.debian.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John et al,

We're currently hitting a gcc bug on hppa64 with both gcc-4.1 and
gcc-4.2. Symptoms are that a build of the ocfs2 module spins
(apparently) forever, I'm leaving a copy building to see if it
eventually makes forward progress.

It's pretty easily reproduceable by building a modular kernel with the
ocfs2 module enabled. Is there anything I can do to help narrow this
down?

make fs/ocfs2/ocfs2.ko:
	!SMP	SMP
32-bit	 y	 y
64-bit	 y	 fails

The troublesome source file appears to be fs/ocfs2/alloc.o, the rest
seem to build fine.

cheers,
	Kyle
