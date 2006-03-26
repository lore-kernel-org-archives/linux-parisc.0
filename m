From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes) and more
Date: Sun, 26 Mar 2006 14:29:59 -0500 (EST)
Message-ID: <200603261929.k2QJTx40007895@hiauly1.hia.nrc.ca>
References: <200603261906.k2QJ673c007796@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200603261906.k2QJ673c007796@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Mar 26, 2006 02:06:07 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I'm not sure about the debian status.  I believe that Matthias integrated
> the change but there was a regression due to a missing glibc patch
> needed to prevent a SIGSEGV in the unwind code.  Matthias said this
> problem was fixed on March 20.

2.3.6-3 does't have the fix:

dave@hiauly6:~$ objdump -d /lib/libpthread.so.0
/lib/libpthread.so.0:     file format elf32-hppa-linux

Disassembly of section .init:

000041ac <_init>:
    41ac:       6b c2 3f d9     stw rp,-14(sp)
    41b0:       6f c4 00 80     stw,ma r4,40(sp)
    41b4:       6b d3 3f c1     stw r19,-20(sp)
    41b8:       e8 42 02 a0     b,l 8310 <__pthread_initialize_minimal>,rp
    41bc:       08 13 02 44     copy r19,r4
    41c0:       08 04 02 53     copy r4,r19
    41c4:       e8 40 0c 70     b,l 4804 <frame_dummy>,rp
    41c8:       08 00 02 40     nop
    41cc:       e8 44 1d 2c     b,l e068 <__do_global_ctors_aux>,rp
    41d0:       08 00 02 40     nop
    41d4:       4b c2 3f 59     ldw -54(sp),rp
    41d8:       08 04 02 53     copy r4,r19
    41dc:       e8 40 c0 00     bv r0(rp)

000041e0 <_end_init>:
    41e0:       4f c4 3f 81     ldw,mb -40(sp),r4

This .init section isn't built correctly in shared libraries.  The
PIC register r19 needs to be retored after every call if it is
subsequently used.  As can be seen above, there is no restore after
the call to frame_dummy and r19 is needed for the call to
__do_global_ctors_aux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
