Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48151482C
	for <parisc-linux@parisc-linux.org>; Thu, 22 Nov 2001 19:23:21 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 1675zr-0002t5-00
	for parisc-linux@parisc-linux.org; Fri, 23 Nov 2001 02:23:19 +0000
Date: Fri, 23 Nov 2001 02:23:19 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011123022319.A10310@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] kerneldoc
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

i've had to explain this at least twice individually to people now,
so here goes for everyone:

No adding kerneldoc to PA implementations of functions which are used
in the generic kernel.

Kerneldoc is intended to document the kernel.  The only chance we
have of keeping it up to date is by putting it next to the code it is
intended to document.  Then when people change the meaning or usage
of a function, they will hopefully change the documentation of it too.
Like it or not, x86 is the dominant architecture and changes are generally
made there first.  So this is the _only_ architecture which should have
documentation in the asm directory unless the function being documented
is arch-specific.  Otherwise we get out of date documentation, which is
worse than useless.

Note also that kerneldoc should be used to document _what_ a
function does, not _how_ it works.  How it works should be obvious
(see Documentation/CodingStyle if you are confused on this point), and
comments on `tricks' employed should be restricted to ordinary comments.

-- 
Revolutions do not require corporate support.
