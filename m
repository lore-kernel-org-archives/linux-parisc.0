Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E4AD482A
	for <parisc-linux@parisc-linux.org>; Thu, 17 Jan 2002 17:35:48 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16RN0Q-0008FX-00
	for parisc-linux@parisc-linux.org; Fri, 18 Jan 2002 00:35:42 +0000
Date: Fri, 18 Jan 2002 00:35:42 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020118003542.F9221@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] long double
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

I searched the mailing list for a discussion of the `long double' problem,
but I didn't find it.  So here we go...

gcc currently thinks that `long double' is 64-bits (the same size
as double).  This is perfectly legitimate, but...
glibc thinks that `long double' is 96-bits.
And HP-UX thinks `long double' is 128-bits.

So any package using long double is probably very broken.  This may
explain some of our bizarre mathematical-related failures.

Our options:
(1) Inform gcc that it's wrong, our long doubles are really 96-bits.
I don't see any way of easily implementing 96-bit floating point numbers
on top of the hardware.  I like this option the least.

(2) Inform glibc that it's wrong, our long doubles are really 64-bits.
This probably fixes most of the problems we're experiencing, but may
break an ABI somewhere?  More investigation required.  This is probably
the easiest of the three options to implement.

(3) Change both gcc and glibc to think that long double is actually
128-bits wide.  This is almost certainly going to break some packages,
and the kernel FP support may have to be enhanced to emulate some
of the opcodes.  The PA-8500 ERS says that it does NOT support `quad
precision' operations in hardware.  This is certainly going to be more
work to implement than option (2), and it may well be slower.  There's a
recommendation that the compiler arrange for a function call to handle
long double instead of issuing the instruction and trapping.

I guess I'm most in favour of option (2), though it means that there's
no 128-bit data type, which sucks a little bit, and HPUX source code is
more difficult to port, which maybe nobody cares about.

-- 
Revolutions do not require corporate support.
