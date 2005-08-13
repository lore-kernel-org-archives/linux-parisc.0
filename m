From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: gsyprf11 and 2.6.13-rc3-pa1
Date: Fri, 12 Aug 2005 20:00:50 -0400 (EDT)
Message-ID: <200508130000.j7D00oKW005186@hiauly1.hia.nrc.ca>
References: <20050812180551.GA32609@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux-bounces@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
Resent-Message-ID: <20050813000810.GA23545@roadwarrior.mcmartin.ca>
In-Reply-To: <20050812180551.GA32609@colo.lackof.org> from "Grant Grundler" at
	Aug 12, 2005 12:05:51 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Fri, Aug 12, 2005 at 09:54:55AM -0400, John David Anglin wrote:
> > ldw instruction at 101068ac has executed.  The sequence of
> > insns starting at 101068ac is the beginning of the epilogue for
> > handle_interruption (register restores and return).  Thus,
> > handle_interruption is going to return to 101068ac.  I don't
> > know but the insn at 101068ac might be generating TLB miss
> > faults.
> 
> Yes, I think we said almost the same thing. You are describing
> the case where we return from the fault and I'm describing
> the case where 101068ac causes the initial fault while
> handling a fault. Sounds like %sp was corrupted since references
> to %sp shouldn't ever fault...unless we went off the end of the stack?
> 
> I'm getting the impression this discussion should happen on
> the parisc-linux mailing list.
> 
> > I will try to set up a testcase.

With 2.6.8.1-pa11, cc1plus generates a SIGSEGV here:

0x00418d98 <ggc_set_mark+0>:    stw rp,-14(,sp)

The backtrace is:

(gdb) bt
#0  ggc_set_mark (p=0x404c12a0) at ../../gcc/gcc/ggc-page.c:1254
#1  0x00109ec0 in gt_ggc_mx_lang_tree_node (x_p=0x404c12a0) at gt-cp-tree.h:69
... [lots more frames]

(gdb) disass gt_ggc_mx_lang_tree_node
Dump of assembler code for function gt_ggc_mx_lang_tree_node:
0x00109e84 <gt_ggc_mx_lang_tree_node+0>:        stw rp,-14(,sp)
0x00109e88 <gt_ggc_mx_lang_tree_node+4>:        stw,ma r7,80(,sp)

(gdb) p/x $sp
$2 = 0xc0700040

So, the frame allocation by gt_ggc_mx_lang_tree_node appears to span
a page boundary and the store into the frame marker by ggc_set_mark
causes a data TLB miss and the SIGSEGV.  This causes the 2.6.13 kernel
to crash in what's apparently an infinite loop involving
handle_interruption.

So, I think the bug is that 2.6.13 (32-bit) crashes when we have a data
TLB miss for an address outside the allowed bounds for the stack.  Probably,
any simple program that recursively allocates stack frames until the
allowed stack size is exceeded will demonstrate the problem.

The C++ program that causes the system crash when compiled with cc1plus
from the GCC head is shown below.  Note that there is a change to GCC's
inlining in 4.1, and 4.0 doesn't cause the SIGSEGV.  My stack limit is
the default 8192 kbytes.  The c3k kernel is default except I had to
disable CONFIG_PDC_STABLE and CONFIG_INFINIBAND.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

// { dg-options "-O2 -ftemplate-depth-20000" }

template <int I>
inline void g() { g<I-1>(); return; }

template <>
inline void g<0>() { int i; return; }

void h() {
  g<250>();
}
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
