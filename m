From: rwhaley@cs.utk.edu (R Clint Whaley)
Subject: Re: [parisc-linux] Re: atlas3 on hppa: unexpected reloc type
Date: Mon, 14 Jun 2004 16:53:46 -0400 (EDT)
Message-ID: <20040614205346.4B6031D377@nala.cs.utk.edu>
Cc: rwhaley@cs.utk.edu,
 parisc-linux@lists.parisc-linux.org
To: tausq@debian.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Randolph,

>It does work on all pa20 processors, afaik. Let me rephrase:
>
>"Be aware that, if atlas relies on being able to prefetch invalid
>addresses and have that not fault, then it will only work on some PA 
>processors but not all of them. All pa20 processors should work.
>pa11 processors will not."
>
>We ran into this while trying to get PA7300LC to do prefetching in the
>kernel.

My understanding from the docs is that pa11 doesn't define any prefetch
instructions, which means these formulations are loads to an invalid
register, which, since they are loads and not prefetches, could have
side effects (eg., seg fault).  Therefore, you need to use them only
on pa20, even if they compile on pa11.  I take it this is what you are saying?

Thanks,
Clint
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
