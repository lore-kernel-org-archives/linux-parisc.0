Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id BCB634A19
	for <parisc-linux@parisc-linux.org>; Sat, 10 Mar 2001 20:32:16 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA24047;
	Sun, 11 Mar 2001 14:31:26 +1100
Date: Sun, 11 Mar 2001 14:31:26 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Randolph Chung <randolph@tausq.org>,
	Matt Taggart <taggart@fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] segfaults with new binutils
In-Reply-To: <Pine.LNX.4.21.0103111254230.23407-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0103111420410.23407-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 11 Mar 2001, Alan Modra wrote:

> On Sat, 10 Mar 2001, Randolph Chung wrote:
> > ok, one more bit of info; removing the --enable-shared from the binutils
> > build line gives binaries that work, so i'm guessing there's some
> > problems with the shared libs (libopcodes and libbfd) ?
> 
> Very likely.  I'm downloading at the moment to have a look at
> it.  You can check yourself by disassembling the shared libs.
> 
> "objdump -j .init -dr libbfd.so"

Yep, badly borken libbfd and libopcodes in binutils_2.10.91.0.2-3_hppa.deb

Incidentally, I'm not actively updating binutils CVS on pehc any longer.
If you want the latest code, get it from sourceware.cygnus.com CVS, either
the 2.11 branch, or trunk for bleeding edge code.  At the moment, there's
no particular reason to not use pehc for hppa-linux binutils, as it's not
too far behind, but that will no doubt change in the future...

Alan Modra
-- 
Linuxcare
