Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C2594829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  4 Jan 2003 23:16:14 -0700 (MST)
Message-Id: <200301050616.h056G6A1017741@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] do_page_fault() infinite loop running 2.4.20-pa18 #9 SMP
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Sun, 5 Jan 2003 01:16:06 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030105055118.GC14817@dsl2.external.hp.com> from "Grant Grundler" at Jan 4, 2003 10:51:18 pm
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

> On Sat, Jan 04, 2003 at 02:38:15PM -0500, John David Anglin wrote:
> > This has been around for awhile.  When using a SMP configuration, the
> > program expect "causes" a segmentation fault that results in do_page_fault()
> > going into an infinite loop.  The log data repeats indefinitely and
> > eventually fills /var.  For some reason, expect is not killed by the kernel
> > when this happens, although the loop can be broken by manually killing it.
> 
> This on gsyprf11? (running SMP 2.4.20-pa13 on a500-65)

We were running 2.4.20-pa18 earlier today.  I rebooted to see if
that would help and SMP 2.4.20-pa13 came up.  It think the sample
fault below was on 2.4.20-pa18.

> I'm hoping this is unrelated to my entry.S changes.

Possibly, this is involved.  The IAOQ below points to an address in
the dynamic loader or a shared library.  I tried building a static
version of expect to see if I could locate which code was causing
the problem but it didn't work at all.  It caused page faults in
what was possibly a syscall.  The return pointer was still above
0x40000000.

> But is certainly sounds like that kind of problem.
> 
> In -pa12, Randolph and I fixed:
> | revision 1.98
> | date: 2002/12/09 06:09:08;  author: tausq;  state: Exp;  lines: +2 -2
> | -pa12
> | fix interruption return path so that it will process signals after
> | handle_interruption()
> | (thanks to Grant for pointing this out)
> 
> Since I broken this with -pa11, maybe the rebuild of -pa13 picked
> up the old -pa11 entry.o?

Don't know.  However, I haven't seen the hang during gcc's configure
process.  That's where I first noticed the page fault problem that
you and Randolph fixed above.

> I'll rebuild from scratch to rule this out and reboot gsyprf11.
> 
> Perhaps a user space signal handler is interfering?
> 
> BTW, appended is one "expect" segfault info from dmesg ouput.
> Dmesg output is filled with the same PID and AFAICT the register dumps
> look identical too. "infinite" is about right.
> 
> grant
> 
> do_page_fault() pid=28552 command='expect' type=15 address=0x00000014
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001111 Not tainted
> r00-03  0000000000000000 fffffffffffffffa 00000000403309c4 00000000403309d4
> r04-07  0000000040330970 000000004032ea28 0000000000000063 000000004032ea28
> r08-11  0000000000021110 0000000000205ff4 0000000000000006 0000000000003b1b
> r12-15  0000000000000001 0000000000000000 0000000000207d40 0000000000000001
> r16-19  0000000000000000 0000000000000001 0000000000000000 000000004032ea28
> r20-23  000000000000000b 000000000000000c 0000000000205628 00000000002055f8
> r24-27  0000000000000030 0000000000000000 0000000040330970 0000000000020d44
> r28-31  0000000000000002 00000000403309e8 00000000faf05a40 0000000000000000
> sr0-3   000000000037b780 000000000037b780 0000000000000000 000000000037b780
> sr4-7   000000000037b780 000000000037b780 000000000037b780 000000000037b780
> 
> IASQ: 000000000037b780 000000000037b780 IAOQ: 000000004025b45f 000000004025b463
> IIR: 0eb41290    ISR: 000000000037b780  IOR: 0000000000000014
> CPU:        1   CR30: 0000000030754000 CR31: 0000000000008020
> ORIG_R28: 0000000000000002
> 
> 

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
