Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77031482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 17:10:08 -0600 (MDT)
Date: Sun, 02 Sep 2001 16:08:59 -0700 (PDT)
Message-Id: <20010902.160859.104033892.davem@redhat.com>
To: Richard.Zidlicky@stud.informatik.uni-erlangen.de
Cc: thunder7@xs4all.nl, parisc-linux@lists.parisc-linux.org,
	linux-kernel@vger.kernel.org
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20010903003437.A385@linux-m68k.org>
References: <20010902150023.U5126@parcelfarce.linux.theplanet.co.uk>
	<20010902195717.A21209@middle.of.nowhere>
	<20010903003437.A385@linux-m68k.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Subject: [parisc-linux] Re: [SOLVED + PATCH]: documented Oops running big-endian reiserfs
 on parisc architecture
List-ID: <linux-parisc.vger.kernel.org>

   From: Richard Zidlicky <Richard.Zidlicky@stud.informatik.uni-erlangen.de>
   Date: Mon, 3 Sep 2001 00:34:37 +0200

   On Sun, Sep 02, 2001 at 07:57:17PM +0200, thunder7@xs4all.nl wrote:
   >  /* 64 bit systems (and the S/390) need to be aligned explicitly -jdm */
   > -#if BITS_PER_LONG == 64 || defined(__s390__)
   > +#if BITS_PER_LONG == 64 || defined(__s390__) || defined(__hppa__)
   >  #   define ADDR_UNALIGNED_BITS  (3)
   >  #endif
   
   couldn't reiserfs use asm/unaligned.h like anyone else?
   Seems at least sparc and mips may need the same treatment.

Sparc will act correctly for unaliagned accesses.

It will trap and run very slowly, but it wont' OOPS and
it will give correct results.

This is actually required behavior, I don't know why parisc
is acting differently.

Later,
David S. Miller
davem@redhat.com
