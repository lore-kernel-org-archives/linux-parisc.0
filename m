Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from d12lmsgate-2.de.ibm.com (d12lmsgate-2.de.ibm.com [195.212.91.200])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8017E482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 06:10:01 -0600 (MDT)
To: "David S. Miller" <davem@redhat.com>
Cc: Richard.Zidlicky@stud.informatik.uni-erlangen.de,
	thunder7@xs4all.nl, parisc-linux@lists.parisc-linux.org,
	linux-kernel@vger.kernel.org
Message-ID: <OF9A995335.07A81CF5-ONC1256ABC.00422A7B@de.ibm.com>
From: "Ulrich Weigand" <Ulrich.Weigand@de.ibm.com>
Date: Mon, 3 Sep 2001 14:08:43 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: [SOLVED + PATCH]: documented Oops running big-endian reiserfs on parisc
 architecture
List-ID: <linux-parisc.vger.kernel.org>

David Miller wrote:

>   From: Richard Zidlicky
<Richard.Zidlicky@stud.informatik.uni-erlangen.de>
>   Date: Mon, 3 Sep 2001 00:34:37 +0200
>
>   On Sun, Sep 02, 2001 at 07:57:17PM +0200, thunder7@xs4all.nl wrote:
>   >  /* 64 bit systems (and the S/390) need to be aligned explicitly -jdm
*/
>   > -#if BITS_PER_LONG == 64 || defined(__s390__)
>   > +#if BITS_PER_LONG == 64 || defined(__s390__) || defined(__hppa__)
>   >  #   define ADDR_UNALIGNED_BITS  (3)
>   >  #endif
>
>   couldn't reiserfs use asm/unaligned.h like anyone else?
>   Seems at least sparc and mips may need the same treatment.
>
>Sparc will act correctly for unaliagned accesses.
>
>It will trap and run very slowly, but it wont' OOPS and
>it will give correct results.
>
>This is actually required behavior, I don't know why parisc
>is acting differently.
