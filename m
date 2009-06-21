From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Sun, 21 Jun 2009 11:20:29 -0400 (EDT)
Message-ID: <20090621152031.04E4B4F19@hiauly1.hia.nrc.ca>
References: <119aab440906202327x7093bd81q93f3914fcf6c2c70@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440906202327x7093bd81q93f3914fcf6c2c70@mail.gmail.com> from "Carlos O'Donell" at Jun 21, 2009 02:27:17 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I saw strace segfault in __canonicalize_funcptr_for_compare while
> trying to trace an nptl enabled hppa application.
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x0002b3bc in __canonicalize_funcptr_for_compare ()
> Current language:  auto; currently asm
> (gdb) bt
> #0  0x0002b3bc in __canonicalize_funcptr_for_compare ()
> #1  0x00025fec in sys_rt_sigaction (tcp=0x4e070) at signal.c:1886
> #2  0x00017aec in trace_syscall (tcp=0x4e070) at syscall.c:2549
> #3  0x00016c98 in main (argc=<value optimized out>, argv=0xc032f01c)
> at strace.c:2475
> (gdb)
> 
> It's 100% reproducible. What should I try to debug this?

Look at the comparison in sys_rt_sigaction.  The last time this
happened, this involved a comparison with a special value that
wasn't a function pointer.  I think you are seeing the same problem
as Kyle.

I believe that the segv can be avoided by casting the values in the
comparison:

> > > which is:
> > > 
> > >                 if (sa.__sigaction_handler.__sa_handler == SIG_ERR)
> > >                         tprintf("{SIG_ERR, ");
> > 
> > Is __canonicalize_funcptr_for_compare choking on SIG_ERR?  This is
> > a special value (-1).  The plabel bit is set.

However, this is a cope out.  __canonicalize_funcptr_for_compare
actually faults on sa.__sigaction_handler.__sa_handler.

You can put a break on __canonicalize_funcptr_for_compare and look at
what's being passed in.

Looking at my email archive, I see the real cause involves kernel memory
maps:

  > > > On Wed, May 06, 2009 at 01:39:49PM -0400, John David Anglin wrote:
  > > > > > The tombstone is:
  > > > > > 
  > > > > > do_page_fault() pid=10205 command='strace' type=15 address=0x407d2f18
  > > > > > vm_start = 0x4068d000, vm_end = 0x4068f000
  > > > > 
  > > > > So, the pointer passed to __canonicalize_funcptr_for_compare is outside
  > > > > the vm range.
  > > > > 
  > > > > Maybe "info sharedlib" will show something.  Need to find out why the
  > > > > address of the function descriptor is outside the vm range.
  > > > > 
  > > > > > > 405c0000-405c2000 rwxp 405c0000 00:00 0 
  > > 
  > > The function pointer address is also outside this range.
  > > 
  > 
  > Sorry, this was with a rebuilt binary, and it lies within this range.
  
  It's marked rwxp, so why the fault?

We never figured out why the fault actually occurred (Kyle got busy).
It seems like there is a problem with the address mapping during signals.
However, there was some rebuilds in the above and I'm not sure the
analysis is correct.  However, I'm sure the problem isn't with
__canonicalize_funcptr_for_compare.

So, the quick fix to get strace going is to rebuild casting the function
pointers to long.  However, I think you will find that it has other problems.
You might have more success with the old version that Kyle patched a
year or so ago (posted in debian people).  Randolph was working on a program
called atrace.  I tried it but didn't have much luck with it.

PS: Hows NPTL comming?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
