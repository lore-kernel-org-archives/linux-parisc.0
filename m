Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7068E4A19
	for <parisc-linux@parisc-linux.org>; Thu, 22 Mar 2001 14:49:41 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14gCxg-0002y3-00
	for parisc-linux@parisc-linux.org; Thu, 22 Mar 2001 21:49:40 +0000
Date: Thu, 22 Mar 2001 21:49:40 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010322214940.U5491@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] FYI: kernel semaphore bug
List-ID: <linux-parisc.vger.kernel.org>

there's a minor problem that probably won't affect anyone which occurs
under rare conditions with contention on an N-way semaphore.  It will be
fixed by upgrading to 2.4.2 so I'm not going to put in a workaround.

for the curious:

P1: down()
P2: down()
P3: down() -- sleeps
P4: down() -- sleeps
P1: up() -- calls wake_up
P2: up() -- calls wake_up

wake_up will only wake P3 and not P4.  This is fixed in the wait_queue
rewrite in 2.4.2.  I could hack it by having P3 check whether the queue
still had tasks on it and the semaphore count was >0 and do a wake_up
itself in that case.  But I'm not going to do that.

-- 
Revolutions do not require corporate support.
