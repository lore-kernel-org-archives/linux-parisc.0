Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC4DE4901
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 05:56:50 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel6.hp.com (Postfix) with ESMTP id 68CD91F9FA
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 07:56:49 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id FAA09478
	for parisc-linux@lists.parisc-linux.org; Thu, 4 Oct 2001 05:56:48 -0600 (MDT)
Date: Thu, 4 Oct 2001 05:56:48 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200110041156.FAA09478@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HP-UX binary compatibility
List-ID: <linux-parisc.vger.kernel.org>

I just committed a patch that restores some of the elementary HP-UX
binary compatibility functionality. Shared libraries also work. But
there is a ton of more work to do. Lots of wrappers need to be written
(see the arch/parisc/hpux directory for files that contain the support
for this functionality). One major missing piece is signal support.
Mapping ioctl arguments is another significant effort ...

John
