Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from flamingo.mail.pas.earthlink.net (flamingo.mail.pas.earthlink.net [207.217.120.232])
	by dsl2.external.hp.com (Postfix) with ESMTP id 095854844
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Jun 2002 08:47:10 -0600 (MDT)
Received: from 209-165-118-200.dsl.earthlink.net ([209.165.118.200] helo=cactus.bheadley.org)
	by flamingo.mail.pas.earthlink.net with esmtp (Exim 3.33 #2)
	id 17Ofyn-0007gv-00
	for parisc-linux@lists.parisc-linux.org; Sun, 30 Jun 2002 07:47:09 -0700
Received: from localhost.localdomain
	([127.0.0.1] helo=earthlink.net ident=bheadley)
	by cactus.bheadley.org with esmtp (Exim 3.35 #1 (Debian))
	id 17Og00-0001lA-00
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Jun 2002 09:48:24 -0500
Message-ID: <3D1F1A32.7060407@earthlink.net>
Date: Sun, 30 Jun 2002 09:48:18 -0500
From: "Bryan W. Headley" <bwheadley@earthlink.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] XFree-4.2 and C110
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

Tried the new 4.2.0 snapshots on my C110. It tells me it cannot find the 
framebuffer, and can't support 24-bit color (even though 4.1 can).

The system appears to be looking in /proc/bus/pci to look for video 
cards and framebuffers, which is a bogus way to find video cards on a 
PC, too (VESA bus, ISA, EISA, MCA... where is that video card?)

On the sparc/32, they're going down /proc/openprom to find the video 
adapter; I'm wondering if it's appropriate to try to expose the device 
list the kernel sees during bootup as a /proc file, and then write a 
special handler like they have for "sbus".

I'm not too fond of synthesizing a "pci" directory, and making up fake 
IDs for things that aren't PCI cards...

a) anyone already come up with a better solution?
b) if one has to be developed, is a little file in /proc the way to go?

-- 
____               .:.                 ____
Bryan W. Headley - bwheadley@earthlink.net
