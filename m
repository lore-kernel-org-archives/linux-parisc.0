Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout03.sul.t-online.com (mailout03.sul.t-online.com [194.25.134.81])
	by dsl2.external.hp.com (Postfix) with ESMTP id B1F1248DD
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Jul 2002 11:43:05 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by marvin.forty.two (8.11.6/8.11.0/SuSE Linux 8.11.0-0.4) with ESMTP id g6HFp3Z13379
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Jul 2002 17:51:03 +0200
Content-Type: text/plain; charset=us-ascii
Date: Wed, 17 Jul 2002 17:50:53 +0200
From: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Message-ID: <3D35925D.71683E92@ruhr-west.de>
MIME-Version: 1.0
To: parisc list <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Kernel panic, ccio-dma.c, C110
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

Hi all,

I am experiancing repeatable kernel panics on my C110. I upgraded the
kernel to 2.4.18-pa53, but without change. ;-(

Famous last words are:

Kernel panic: ccio-dma.c ccio_alloc_range() I/O MMU is out of mapping
resources.
In interrupt handler - not syncing

After that - black screen, last words and silence. On one occasion, it
spat out a bit more before it died. Sort of SCSI-Bus trouble in the
farmost sense. Could not repeat that. Harddrive is an old HP2490A, that
came foating around. I did not want to erase the hpux on the other
drives.
All I need to do to crash the machine is writing big files (i.e. kernel
tarballs) to the drive (either copying or from ftp). What makes me
wonder is that I was able to copy some 300 MB *.wav file to it some
weeks back.


Juergen

-- 
===========================================     __   _
Juergen Braukmann juergen.braukmann@gmx.de| -o)/ /  (_)__  __ ____  __
Tel: 0201-743648  dk4jb@db0qs.#nrw.deu.eu | /\\ /__/ / _ \/ // /\ \/ /
===========================================_\_v __/_/_//_/\_,_/ /_/\_\
