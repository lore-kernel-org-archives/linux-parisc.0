Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5046C4A19
	for <parisc-linux@parisc-linux.org>; Thu, 15 Mar 2001 23:25:55 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14dngL-0003Pr-00
	for parisc-linux@parisc-linux.org; Fri, 16 Mar 2001 06:25:49 +0000
Date: Fri, 16 Mar 2001 06:25:49 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010316062549.H22875@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] semaphore problem
List-ID: <linux-parisc.vger.kernel.org>

as i suspected, the pipe problem was a semaphore problem.  here's how
it works:

P1: down() count = 0
P2: down() -> __down() -> schedule() count = -1
P1: up() -> wake_up() [P1 placed on runqueue] count = 0
P1: down() -> __down() -> schedule() count = -1

now P2 gets scheduled, sees count is -1, assumes it missed the wakeup
and goes back to sleep.  both tasks are now sleeping on the same semaphore.

i'm going to bed now.  'night!

-- 
Revolutions do not require corporate support.
