From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [hppa patch] Fix register definitions for hppa
Date: Fri, 3 Aug 2007 20:12:19 +0000
Message-ID: <20070803201219.GC32611__37286.3430217423$1416624426$gmane$org@tausq.org>
References: <20070803170646.GB32611@tausq.org>
	<119aab440708031132h58d94c38l672a241301bda9ee@mail.gmail.com>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 gdb-patches@sources.redhat.com
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440708031132h58d94c38l672a241301bda9ee@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Isn't there a way we can teach gdb that cr27 is writable via this sequence?
> 
> e.g.
> static inline void __set_cr27(struct pthread *cr27)
> {
>   asm ( "ble    0xe0(%%sr2, %%r0)\n\t"
>         "copy   %0, %%r26"
>         : : "r" (cr27) : "r26" );
> }
> 
> At the very least please adjust the comment to say "cr27 is writable via
> a kernel helper function."
> 
> How does gdb read cr27? It must know how to use mfctl?

Remember that gdb is reading the cr27 of the debuggee, not of itself, so
__set_cr27 is irrelevant.

 From the architecture point of view, CR26 and CR27 are only readable
>from userspace, so gdb should not enable somebody to set them from
inside gdb.

GDB gets the value of cr26/cr27 the same way it gets the value of other
registers -- via ptrace or the register set returned in a core dump,
etc...

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
