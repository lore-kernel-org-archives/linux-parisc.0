From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] c3k panics
Date: Mon, 30 May 2005 23:26:19 -0700
Message-ID: <20050531062619.GI3050@tausq.org>
References: <4282FEEE0000724C@mail-5-bnl.tiscali.it>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4282FEEE0000724C@mail-5-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Ok clear but still confused why 32bit branch doesn't nullify the insn
> in delay slot like did 64bit?

it's a bug, but fortunately that copy of the fixup_branch macro (in
syscall.S) isn't actually used ;-) I'll remove it.

> btw one more thing confusing me: the third fixup_branch macro definition
> in lusercopy.S:
> [snip]
>          .macro fixup_branch,lbl
>          ldil        L%\lbl, %r1
>          ldo         R%\lbl(%r1), %r1
>          bv          %r0(%r1)
>          .endm
> 
> This time just bv not bv,n ?

Yes, if you look at where the macro is used you will see that there is
an instruction in the delay slot for the branch that should be executed.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
