Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFB73491D
	for <parisc-linux@parisc-linux.org>; Thu,  9 Oct 2003 09:05:19 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A7cLu-0002rg-M7
	for parisc-linux@parisc-linux.org; Thu, 09 Oct 2003 16:05:18 +0100
Date: Thu, 9 Oct 2003 16:05:18 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20031009150518.GG27861@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] defconfigs in 2.6
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

There's a generic scheme for having defconfigs-for-different-systems
in 2.6.0-test7 (actually, it may have been there in -test6 too, but
we weren't using it).  I've added one for the 712 as an example.  To
use it, rather than typing "make defconfig", you type "make 712_defconfig".
The Makefile looks in arch/parisc/configs/ for a file by that name and
uses it if it finds it.

So what configs should we support?  This is one of those bikeshed kind
of questions, so let me take a stab at it first:

- 712 (Lasi, Wax, no PCI, no EISA.  targetted at exactly 712, may work on
	other snake-type boxes)
- hawk (adds ccio, eisa, PCI, ncr720, mux.  targetted at A180,
	B, C, J, D, K, R)
- music32 (SMP, PA8000, SBA PCI, no GSC, targetted at B1000-J6750)
- 32bit (everything.  should work on 705-J6750, including A180, EFGHI,
	B, C, J, D, K, R)
- music64 (SMP, PA64, SBA PCI.  targets A500, L2000, etc.)

I don't want to add any more than this because the effort of maintaining
all of them quickly adds up.  Is everybody happy with these suggestions?
Obviously, you can tweak your own config to your heart's content, these
will just be the defconfigs distributed with the kernel.

As far as naming goes, most of the boxes with ccio in them were some
kind of hawk, most of the boxes with SBA in them were named after musical
terms.  I suppose for consistency the 712 config should be called gecko...
Please, quibble about the names ;-)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
