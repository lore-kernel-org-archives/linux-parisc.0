Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA3CD482A
	for <parisc-linux@parisc-linux.org>; Tue, 21 May 2002 18:40:17 -0600 (MDT)
Received: from smtp1.fc.hp.com (smtp1b.fc.hp.com [15.15.136.127])
	by atlrel9.hp.com (Postfix) with ESMTP id 508508050A0
	for <parisc-linux@parisc-linux.org>; Tue, 21 May 2002 20:40:17 -0400 (EDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by smtp1.fc.hp.com (Postfix) with ESMTP id 1E5A637EC7
	for <parisc-linux@parisc-linux.org>; Tue, 21 May 2002 18:40:15 -0600 (MDT)
Received: from paul.bame (lart.fc.hp.com [15.1.54.48])
	by ldl.fc.hp.com (Postfix) with ESMTP id 112914605
	for <parisc-linux@parisc-linux.org>; Tue, 21 May 2002 18:40:15 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by paul.bame with esmtp (Exim 3.35 #1 (Debian))
	id 17AKAo-00086U-00
	for <parisc-linux@parisc-linux.org>; Tue, 21 May 2002 18:40:14 -0600
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] stalling system clues + parisc WCHAN hack 
In-Reply-To: Your message of "Tue, 21 May 2002 08:35:10 MDT."
             <E17AAjL-00079M-00@paul.bame>
References: <E17AAjL-00079M-00@paul.bame> 
Date: Tue, 21 May 2002 18:40:14 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E17AKAo-00086U-00@paul.bame>
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

False alarm.

I can only reproduce this on a B2000.  C3000 grunted through the
test load and did not get semi-permanently upset like the B2000.  I
tried an A500 with pa8600 cpu (as has B2000) and it was ok.  B180
is fine too.

After a fresh boot, it took 20+ *minutes* to untar a kernel tree,
use dd to make 3 32Mb files, and 'cp -a' the linux tree, with almost
all the time spent in the 'cp -a' (WCHAN 'wait_on_buffer').  All the
I/O is to a 63G ext3 partition on a decent SCSI disk.  dmesg isn't
complaining (e.g., apparently no scsi timeouts).  There are no other
loads on the CPU other than normal idle daemons.  There's plenty of
free memory remaining.  CPU is normally 99% idle according to top.

Gaak

	-P
