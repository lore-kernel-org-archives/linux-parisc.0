Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC713482A
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 13:35:51 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14rm7Z-0000sR-00
	for parisc-linux@parisc-linux.org; Mon, 23 Apr 2001 20:35:41 +0100
Date: Mon, 23 Apr 2001 20:35:41 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010423203541.E18464@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] 32-bit ABI for passing 64-bit quantities to functions
List-ID: <linux-parisc.vger.kernel.org>

the 32-bit ABI specifies that 64-bit quantities are passed aligned to
64-bit boundaries.  So int foo(int a, long long b) passes a in gr26, and
b in gr24 & gr23, leaving gr25 unused.  this is a problem in our syscall
interface, because glibc picks the 64-bit quantity apart into high and low
words and passes them individually.  meanwhile the syscall is prototyped
as above and expects the arguments in different registers... strangely,
this fails to work well.

now, all the syscalls are marked with `asmlinkage', which is currently
null on pa.  if we had an __attribute__((packed-args)) we could use that
with little pain.  alternatively, we could add a -fpacked-args compile
option, which tells gcc to always pack arguments.  we could compile the
whole kernel with this -- i don't know why this ABI choice was made.
Cary, could you comment?

-- 
Revolutions do not require corporate support.
