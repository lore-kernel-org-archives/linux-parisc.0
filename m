Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id BEA954A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 22:33:23 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id QAA24791;
	Thu, 22 Feb 2001 16:32:51 +1100
Date: Thu, 22 Feb 2001 16:32:51 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Helge Deller <deller@gmx.de>
Cc: Matthew Wilcox <matthew@wil.cx>,
	PL <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <01022201400100.16704@P100.helgenet.de>
Message-ID: <Pine.LNX.4.21.0102221622370.14557-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] schedule_tail
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 22 Feb 2001, Helge Deller wrote:

> As far as I've tested, the following patch (HACK!) to 
> ret_from_kernel_thread() against CVS head gets me at least to the 
> init-process (where it then crashes).

I ripped out this call to schedule_tail _and_ the other one in
child_return, and things are working again for me.  schedule_tail doesn't
do much on uniprocessor.  Most likely %r26 was wrong.  I'd like to know 
why the stack adjust before calling schedule_tail too.

Alan
