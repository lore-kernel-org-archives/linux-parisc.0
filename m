Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB0DC482A
	for <parisc-linux@parisc-linux.org>; Sun, 22 Apr 2001 13:21:20 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14rPPl-0006C3-00; Sun, 22 Apr 2001 20:20:57 +0100
Date: Sun, 22 Apr 2001 20:20:57 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Andreas Thienemann <andreas@thienemann.net>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problems with glibc
Message-ID: <20010422202057.Y18464@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.10.10104201906260.21140-100000@gate.ixs.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.10104201906260.21140-100000@gate.ixs.com>; from andreas@thienemann.net on Fri, Apr 20, 2001 at 07:10:43PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Apr 20, 2001 at 07:10:43PM +0200, Andreas Thienemann wrote:
> while trying to compile the current glibc snapshot from the puffin-cvs, make
> segfaults:
> Has anyone ever experienced a similar problem? This segfault is
> reproducable and it's the first time that happened. gcc did compile
> correct, the same with the kernel itself.

Yes, I was getting it too.  After my recent kernel checkin to fix the
stat64 struct, I was able to build glibc successfully.  My theory is that
glibc was trying to call the *stat64 syscalls and the kernel was happily
writing all over user memory.  I would be grateful if you updated your
(running) kernel to head of CVS and tried building glibc again.

-- 
Revolutions do not require corporate support.
