Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1003D482B
	for <parisc-linux@parisc-linux.org>; Fri, 26 Oct 2001 19:21:01 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15xI9j-0006cF-00
	for parisc-linux@parisc-linux.org; Sat, 27 Oct 2001 02:20:59 +0100
Date: Sat, 27 Oct 2001 02:20:58 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011027022058.A23520@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] card probing
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

I'm not sure how to solve this problem.  Suggestions appreciated.

If you compile a kernel with the hp100 driver in it, it will attempt to
detect ISA cards by probing.  This works fine when there's an EISA adapter
in the machine as it simply returns -1 when there are no cards present.
With no EISA adapter in the machine, the ioport probes are routed to
Dino instead.  When you attempt to read from a nonexistent io port
through Dino, it causes an HPMC.

This is something which could well cause problems for releasing a distro
as probing for ISA cards in a machine without an EISA adapter will lock
the machine.

Some ways of solving it:
 * change dino_in* to check whether the address is configured.  This could
   be slow.
 * on pre-SuckyIO machines, reserve HBA 0 for EISA.
 * Fix SuckyIO so that it doesn't assume it's on PCI bus 0 and always reserve
   HBA 0 for EISA.
 * Don't compile drivers which probe for ISA addresses or fix them to not
   probe unless there's an EISA adapter.  Lots of work, won't catch
   everything, dubious what strategy would be acceptable upstream.
 * Write an HPMC handler that recovers from Dino going fatal.
 * Turn on Less-than-fatal mode in Dino and handle resetting it...
   don't know how well this would work.

I don't know what Elroy does on reads of unassigned addresses.  This will
probably affect the decision of how to fix this since we want to ship
a 32-bit kernel that can boot on everything from a 720 to a J7000.

-- 
Revolutions do not require corporate support.
