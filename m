From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcj can't make shared libs on hppa
Date: Sun, 12 Mar 2006 10:10:53 -0500 (EST)
Message-ID: <200603121510.k2CFArcx015381@hiauly1.hia.nrc.ca>
References: <44142C5F.3040509@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44142C5F.3040509@tausq.org> from "Randolph Chung" at Mar 12,
	2006 10:12:47 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> static void __attribute__((used))
> __do_global_ctors_aux (void)
> {
>    func_ptr *p;
>    for (p = __CTOR_END__ - 1; *p != (func_ptr) -1; p--)
>      (*p) ();
> }
> 
> what i'm seeing is that we are calling the copy of this function in 
> liba1.so, and loading __CTOR_END__ via the GOT, but we are using an r19 
> value that is pointing inside libgcj.so, so we end up loading some wrong 
> value for __CTOR_END__
> 
> I don't know how/why this is happening though. how does this bit work? 
> each .so has its own copy of __do_global_ctors_aux(); how does this get 
> called and where does it setup r19 for each .so before this gets called?

The dynamic loader calls _init in the .init section when it loads
a shared library.  It's also supposed to process the .init_array
section but that's not being used.

Disassembly of section .init:

00000824 <_init-0x10>:
 824:   2a 7f ff ff     addil L%-800,r19,r1
 828:   48 35 0f b8     ldw 7dc(r1),r21
 82c:   ea a0 c0 00     bv r0(r21)
 830:   48 33 0f c0     ldw 7e0(r1),r19

00000834 <_init>:
 834:   6b c2 3f d9     stw rp,-14(sp)
 838:   6f c4 00 80     stw,ma r4,40(sp)
 83c:   6b d3 3f c1     stw r19,-20(sp)
 840:   e8 5f 1f bd     b,l 824 <_init-0x10>,rp
 844:   08 13 02 44     copy r19,r4
 848:   08 04 02 53     copy r4,r19
 84c:   e8 40 01 f0     b,l 94c <frame_dummy>,rp
 850:   08 00 02 40     nop
 854:   e8 40 05 c0     b,l b3c <__do_global_ctors_aux>,rp
 858:   08 00 02 40     nop
 85c:   4b c2 3f 59     ldw -54(sp),rp
 860:   08 04 02 53     copy r4,r19
 864:   e8 40 c0 00     bv r0(rp)

00000868 <_end_init>:
 868:   4f c4 3f 81     ldw,mb -40(sp),r4

_init comes from the crt files in glibc.  The code at 824 is an
import stub which appears to be provided by ld.  So, if r19 is wrong,
it would seem the relocations in the import stub used to load the
new r19 value must be wrong.  I'm not sure how _init manages to call
the stub.  That's a bit unusual.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
