Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D6FE4832
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 May 2003 07:46:52 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19Fwao-0003cH-MD; Wed, 14 May 2003 14:46:50 +0100
Date: Wed, 14 May 2003 14:46:50 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] more on canonicalize_funcptr_for_compare
Message-ID: <20030514134650.GC6859@parcelfarce.linux.theplanet.co.uk>
References: <20030514055225.GJ548@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030514055225.GJ548@tausq.org>
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

On Tue, May 13, 2003 at 10:52:25PM -0700, Randolph Chung wrote:
> The latest glibc on hppa (2.3.1-17) was compiled with a gcc-3.2 which
> has the __canonicalize_funcptr_for_compare patch backported from gcc-3.3
> ... with this new version, some programs will die on startup (e.g. vim).
> I traced to a segfault in __canonicalize_funcptr_for_compare. 
> 
> The testcase below illustrates the problem:
> 
> =====
> typedef void (*func_t)(void);
> 
> #define N ((func_t)2)
> 
> void foo(void) {};
> 
> int main(int argc, char **argv)
> {
>         return (foo == N);
> }
> =====
> 
> this program segfaults when run with:
> 
> (gdb) run
> Starting program: /home/tausq/sig
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x00010530 in __canonicalize_funcptr_for_compare ()
> (gdb) bt
> #0  0x00010530 in __canonicalize_funcptr_for_compare ()
> #1  0x000104bc in main (argc=1, argv=0xfaf001b8) at sig.c:9
> 
> it seems like the 2 in the constant (N) confuses the comparision
> routine. If I change it to 1, everything is ok.... I don't really
> understand this tho, because the code for __c_f_f_c has something like:
> 
> if ((int) fptr == -1 || (unsigned int) fptr < 4096 || !((int) fptr & 2))
>     return (unsigned int) fptr;
> 
> so, why doesn't that match the second || case and exit?  (gdb
> disassmbly shows that the code tries to dereference the fptr argument
> and segfaults)

Even if this were fixed, it seems like a quality of implementation issue.
Basically, we're saying that if none of these conditions are met, it's
safe to dereference this pointer, and I'm sure we'll find people stuffing
other magic values into pointers.

I see three options:

1) Continue with this, accepting that some badly written software won't
   run.

2) Install a signal handler that handles the segfault (we can lose two of
   the tests this way, so it'll be faster in the common case)

3) Change the ABI.  Make it so we always have unique PLabels.  Recompile
   anything necessary.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
