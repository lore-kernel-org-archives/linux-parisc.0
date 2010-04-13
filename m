From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Tue, 13 Apr 2010 10:03:51 -0400 (EDT)
Message-ID: <20100413140352.98440513F@hiauly1.hia.nrc.ca>
References: <20100413115501.307040@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, gniibe@fsij.org,
	carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100413115501.307040@gmx.net> from "Helge Deller" at Apr 13, 2010 01:55:01 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > I assume that it's always the thread created by pthread_create that's
> > causing the segv.  
> 
> Yes, all my tests up to now indicated that too.

info thread tells you which thread is running.

The stack region for the thread is allocated by the mmap syscall prior
to the clone syscall.  You can see where it is allocated with strace.
On my c3750, it was allocated at 0x40000000, but I have seen it allocated
in other locations on 64-bit systems.

So, in gdb, you can display the bottom bit with 'x/128x 0x40000000'.

If you run minifail under gdb and set a break at the start of
thread_run, you can see what the stack should look like when
thread_run is entered.

The COW break typically causes most of the stack that is dirty to revert to
nearly all zeros.  Since the return pointer, rp, is saved on the stack,
a function return causes the thread to branch to location 0 and
fault.  This is the most common failure.

In the minifail versions that I made with a big loop in thread_run,
it's possible to detect the COW break mid loop and generate a core
dump.   As a result, the application state is consistent.

The dumps below aren't that useful since they don't say much about the
cause of the fault.

> > What does the stack region for the thread look
> > like when it drops core?  Possibly, we have two separate issues.
> 
> do_page_fault() pid=3890 command='minifail_dave' type=6 address=0x00000003
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001111 Not tainted
> r00-03  0004ff0f 10561000 401190d7 c046e3c0
> r04-07  4012b5f4 00000007 4012bdf4 00000000
> r08-11  4012be64 00000000 c046e3ca 0000001c
> r12-15  4012be60 4012c7f8 00000000 c046e448
> r16-19  4012c0b0 c046e448 40129270 00000000
> r20-23  00000000 00000000 00000000 00000000
> r24-27  fffffff5 ffffffd3 4012c0b0 00011dac
> r28-31  00000000 4012c0b0 c046e4c0 401190d7

The stack pointer in this one seems to indicate the parent was running.
So, I think this failure has a different cause.  It might be useful to
debug the core dump for a failure similar to this with gdb.

> sr00-03  00008dd2 00000000 00000000 00008dd2
> sr04-07  00008dd2 00008dd2 00008dd2 00008dd2
> 
> IASQ: 00008dd2 00008dd2 IAOQ: 00000003 00000007
>  IIR: 43ffff80    ISR: 00008dd2  IOR: 40000bd0
>  CPU:        0   CR30: 87d24000 CR31: ffffffff
>  ORIG_R28: 00000000
>  IAOQ[0]: 00000003
>  IAOQ[1]: 00000007
>  RP(r2): 401190d7
> 
> 
> or 
> 
> do_page_fault() pid=28779 command='minifail_dave' type=6 address=0x00000003
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001111 Not tainted
> r00-03  0004ff0f 10561000 401190d7 bff943c0
> r04-07  4012b5f4 00000007 4012bdf4 00000000
> r08-11  4012be64 00000000 bff943ca 0000001c
> r12-15  4012be60 4012c7f8 00000000 bff94448
> r16-19  4012c0b0 bff94448 40129270 00000000
> r20-23  00000000 00000000 00000000 00000000
> r24-27  fffffff5 ffffffd3 4012c0b0 00011dac
> r28-31  00000000 4012c0b0 bff944c0 401190d7

Stack pointer in this one is wierd.  It probably must have been corrupted
by fault.

> sr00-03  000070bc 00000755 00000000 000070bc
> sr04-07  000070bc 000070bc 000070bc 000070bc
> IASQ: 000070bc 000070bc IAOQ: 00000003 00000007
>  IIR: 43ffff80    ISR: 000070bc  IOR: 40000bd0
>  CPU:        1   CR30: 8cfe4000 CR31: ffffffff
>  ORIG_R28: 00000000
>  IAOQ[0]: 00000003
>  IAOQ[1]: 00000007
>  RP(r2): 401190d7

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
