Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 137954840
	for <parisc-linux@parisc-linux.org>; Thu,  9 Oct 2003 09:21:41 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A7cbk-00031G-A7
	for parisc-linux@parisc-linux.org; Thu, 09 Oct 2003 16:21:40 +0100
Date: Thu, 9 Oct 2003 16:21:40 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20031009152140.GH27861@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Change in device inventory
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

I got annoyed with the device inventory which used to look like this:

7. Gecko 80 Audio (10) at 0xf0104000 [2/0/8], versions 0x1c, 0x0, 0x7b

I could never remember how these numbers corresponded to what I needed
to put in a driver (or compare with what was already in a driver).
So I changed it in 2.6.0-test7-pa2 to look like this:

7. Gecko 80 Audio at 0xf0104000 [2/0/8] { 10, 0x0, 0x01c, 0x0007b }

Now you can copy & paste it directly into a driver (possibly using
symbolic constants rather than literals ...).  It has the added benefit of
being slightly shorter so more of the names fit on one line.  The padding
to 3 and 5 digits is an additional reminder of which number is which.

I don't imagine this change will affect anybody too much, but it's a
user-visible change, so I thought I'd mention it.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
