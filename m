From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Problem building gcc-3.2 (cvs head) on hppa-linux
Date: Thu, 18 Jul 2002 14:33:38 -0400 (EDT)
Message-ID: <200207181833.g6IIXdRv002249__11960.4134619751$1416621545$gmane$org@hiauly1.hia.nrc.ca>
References: <20020712072703.GA8838@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: gcc@gcc.gnu.org, parisc-linux@parisc-linux.org
To: randolph@tausq.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20020712072703.GA8838@tausq.org> from "Randolph Chung" at Jul 12, 2002 00:27:03 am
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
