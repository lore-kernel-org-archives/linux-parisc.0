Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF680482A
	for <parisc-linux@parisc-linux.org>; Wed,  4 Apr 2001 12:57:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14ksTE-0001Dp-00
	for parisc-linux@parisc-linux.org; Wed, 04 Apr 2001 19:57:32 +0100
Date: Wed, 4 Apr 2001 19:57:32 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010404195732.F11435@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Lightweight syscalls
List-ID: <linux-parisc.vger.kernel.org>

I've just written a `lightweight syscall' which will be used to set cr27
to a per-thread value.  Comments, criticism, etc all welcome.

set_thread_pointer:
        gate    .+8, %r0                /* increase privilege */
        depi    3, 31, 2, %r31          /* Ensure we return into user mode. */
        be      0(%sr3,%r31)            /* return to user space */
        mtctl   %r26, %cr27             /* move arg0 to the control register */

note that the intended model is to place this at a fixed location on the
gateway page, and it will be called with BLE.  I haven't tested this yet,
in the best traditions of linux :-)

-- 
Revolutions do not require corporate support.
