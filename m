Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id C3C4B4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Mar 2001 23:42:50 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA22623;
	Thu, 22 Mar 2001 17:42:45 +1100
Date: Thu, 22 Mar 2001 17:42:45 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] new g++ debs and oddities...
In-Reply-To: <20010321233219.B6912@tausq.org>
Message-ID: <Pine.LNX.4.21.0103221740220.11752-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 21 Mar 2001, Randolph Chung wrote:

> against objdump output).... looks like some kind of jump table?

Yeah, it is.  long branch, plt call stubs.

> 000025d0 <_start-0x360>:
>     25d0:       2b 60 00 00     addil 0,dp,%r1
>     25d4:       48 35 0f 00     ldw 780(sr0,r1),r21
>     25d8:       ea a0 c0 00     bv r0(r21)
>     [...]
>     288c:       48 33 0b a8     ldw 5d4(sr0,r1),r19
>     2890:       2b 60 00 00     addil 0,dp,%r1
>     2894:       48 35 0e 90     ldw 748(sr0,r1),r21       <--- segfaulting here
>     2898:       ea a0 c0 00     bv r0(r21)

Did you install a new glibc too?  This looks very much like a ld.so
without the hack I added recently.

Alan
-- 
Linuxcare
