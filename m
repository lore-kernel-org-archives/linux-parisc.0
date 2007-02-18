From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: call_init in libc6 2.3.6.ds1-11
Date: Sun, 18 Feb 2007 09:45:31 -0500 (EST)
Message-ID: <200702181445.l1IEjV7B012366__35178.8461710841$1416624297$gmane$org@hiauly1.hia.nrc.ca>
References: <200702180423.l1I4NCa8000957@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702180423.l1I4NCa8000957@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Feb 17, 2007 11:23:12 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> See the same for INIT in /bin/sh.  However, the INIT value of interest
> here is that for /lib/libc.so.6:
> 
> dave@mx3210:~/gnu/gcc-4.3/objdir/hppa-linux/libjava$ readelf -a /lib/libc.so.6|grep INIT
>  0x0000000c (INIT)                       0x1f164
> 
> This was the value at r21 + 4.  This value also isn't an OPD.

After I sent the last message, I realized that I had  misread the bb
condition.  The execution path actually traversed the code to setup an OPD:

(gdb) disass 0x400d7854 0x400d78a4
Dump of assembler code from 0x400d7854 to 0x400d78a4:
0x400d7854 <call_init+344>:     stw r22,-78(sp)
0x400d7858 <call_init+348>:     ldw 2c(r3),r20
0x400d785c <call_init+352>:     ldo -78(sp),r22
0x400d7860 <call_init+356>:     depwi -1,30,1,r22
0x400d7864 <call_init+360>:     ldw 4(r20),ret0
0x400d7868 <call_init+364>:     b,l 0x400d77c4 <call_init+200>,r0
0x400d786c <call_init+368>:     stw ret0,-74(sp)

(gdb) x/2x $sp - 0x78
0xc030ec08:     0x4073b164      0x40df252f
(gdb) p/x $ret0
$1 = 0x40df252f
(gdb) p/x $r20
$2 = 0x4086221c
(gdb) x/2x $r20
0x4086221c <.LC2+84>:   0x00000003      0x40df252f
(gdb) p/x $r3
$3 = 0x400010b0
(gdb) p/x $r3 + 0x2c
$4 = 0x400010dc
(gdb) x/x 0x400010dc
0x400010dc:     0x4086221c

So, the r19 value came from the OPD.  This value was loaded from
memory at 0x400d7864.  The value of r20 used in this insn was loaded
at 0x400d7858.  The values in memory and r20 are consistent.  The
values in memory and ret0 are also consistent.

(gdb) info sharedlib
>>>From        To          Syms Read   Shared Object Library
0x404dda70  0x40508088  Yes         /lib/libncurses.so.5
0x40317e44  0x40318fc0  Yes         /lib/libdl.so.2
0x4073ac50  0x40829a64  Yes         /lib/libc.so.6
0x400cccd0  0x400def18  Yes         /lib/ld.so.1

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
