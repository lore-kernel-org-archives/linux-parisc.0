Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from kargellan.ucc.ie (tqpc.ucc.ie [143.239.201.88])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85E2A482A
	for <parisc-linux@parisc-linux.org>; Sun, 30 Dec 2001 18:39:29 -0700 (MST)
Received: from localhost (xam@localhost)
	by kargellan.ucc.ie (8.11.6/8.11.6) with ESMTP id fBV1d6I23776
	for <parisc-linux@parisc-linux.org>; Mon, 31 Dec 2001 01:39:16 GMT
Date: Mon, 31 Dec 2001 01:39:06 +0000 (GMT)
From: "M. Grabert" <xam@grabert.net>
To: <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0112310052290.23722-100000@kargellan.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 0.9.3 Installatio hangs on HP9000/730
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

Hi

I tried to install debian-0.9.3 on a
HP9000/730 (32MB RAM, 535MB HD), thus overwriting an
older version (nfsroot-based).

I used the STI (HIL-Keyboard) and everything worked fine
until it tried to  make an ext2 filesystem. To be more
specific, I partitioned t/dev/sda (swap, F0 boot, ext2,
in that order) and tthe creation and activation of
the swap partition went fine. The computer seems to hang
whhile creating the ext2 filesystem. The last thing I can see is
somethingg like "Writing Inode xy/53" (with xy being a number
less than 53). xy starts from zero and stopps at a random number
(I tried to install debian-0.9.3 several times, xy is different each time)

I can use CTRL-ALT-DEL in order to shut down the system
(sometimes I seee a message from linux "Shutting down ..."
so it seems that the kernel didn't crash, but I can#t interrupt
the installation in any other way.

I don't think that that the creation of the ext2 takes such a long time
(I waited for half an hour) without uptatiing the progress bar.


STI and keyboard worked fine (last version of parisc linux
was over 9 month old and broken at that time) and it seemed
that everything  would work flawlessly.

AFAIK the 730 is very similar to the 720, just with additional WAX
(1 EISA slot) and a faster CPU (same type as in the 720)

Since someone posted successful installation on several 720's
and since the old linux installation worked with the saame hardware,
I doubt that it is a hardware problem.

Any clue ? Thanks in advance!


greetings max


PS: sorry for the many typos, but i have an awfully slow internet connection,
i.e. weaitiong 5 seconds before I can see what I typed.
