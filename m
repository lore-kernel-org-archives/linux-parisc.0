Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C81C74831
	for <parisc-linux@parisc-linux.org>; Thu, 18 Jul 2002 12:33:44 -0600 (MDT)
Message-Id: <200207181833.g6IIXdRv002249@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Problem building gcc-3.2 (cvs head) on hppa-linux
To: randolph@tausq.org
Date: Thu, 18 Jul 2002 14:33:38 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: gcc@gcc.gnu.org, parisc-linux@parisc-linux.org
In-Reply-To: <20020712072703.GA8838@tausq.org> from "Randolph Chung" at Jul 12, 2002 00:27:03 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> In file included from /home/tausq/src/gcc-3.2/gcc/unwind-dw2.c:1210:
> /home/tausq/src/gcc-3.2/gcc/unwind.inc: In function `_Unwind_RaiseException':
> /home/tausq/src/gcc-3.2/gcc/unwind.inc:132: error: Attempt to delete prologue/epilogue insn:
> (insn 337 336 338 14 (nil) (set (reg:DI 7 %r7)
>         (mem:DI (plus:DI (reg/f:DI 30 %r30)
>                 (const_int -296 [0xfffffffffffffed8])) [0 S8 A64])) -1 (nil)
>     (nil))
> /home/tausq/src/gcc-3.2/gcc/unwind.inc:132: internal compiler error: Internal compiler error in propagate_one_insn, at flow.c:1637

Fixed:
<http://gcc.gnu.org/ml/gcc-patches/2002-07/msg00963.html>.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
