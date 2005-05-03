From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: yet another ssm/rsm/rfi question [Was: [parisc-linux] head.S: a
	small typo]
Date: Tue, 3 May 2005 11:23:53 -0600
Message-ID: <20050503172353.GA23515@colo.lackof.org>
References: <20050501152849.GA17998@colo.lackof.org>
	<426F252F00002DD9@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <426F252F00002DD9@mail-1-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 03, 2005 at 04:56:10PM +0000, Joel Soete wrote:
...
>         pcxt_ssm_bug
...
> (well we could easly re-label 1 by e.g. flush_tlb_all_local_1 and use "load32
> PA(flush_tlb_all_local_1), %r1")

Sure. We could. Why?

> but I am surprised to not find the 8 nops between rfi and label.

AFAICT, the NOPs are pointless. The RFI better not return or we
have more serious problems (e.g. HW failure).

I will unify (i.e. define macros) uses of ssm/rsm/rfi once this current
patch is in CVS and people are happy with it.

There are currently 8 uses of RFI:

grundler <501>fgrep pcxt_ssm_bug *S
entry.S:        pcxt_ssm_bug
head.S: pcxt_ssm_bug
pacache.S:      pcxt_ssm_bug
pacache.S:      pcxt_ssm_bug
pacache.S:      pcxt_ssm_bug
pacache.S:      pcxt_ssm_bug
real2.S:        pcxt_ssm_bug
real2.S:        pcxt_ssm_bug

All but one are easily replaced with a macro that takes 2 parameters.
But one step at a time...

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
