From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] fix SMP TLB optimisations
Date: Sun, 25 Feb 2007 14:14:13 -0500 (EST)
Message-ID: <200702251914.l1PJEFGm008201__7876.73364761776$1416624316$gmane$org@hiauly1.hia.nrc.ca>
References: <1172425268.3423.18.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1172425268.3423.18.camel@mulgrave.il.steeleye.com> from "James
	Bottomley" at Feb 25, 2007 11:41:08 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > 	ldsid (%r1),%r31
> > 	mtps %r31,%sr3
> > 	be 0(%sr3,%r1)
> > 
> > should work in linux even if it's not efficient.
> 
> I think you'll find that unless %sr3 is zero or your current space,
> you'll get a protection trap (and if it's zero, you'll likely get a
> privilege trap).

At the moment, the following little bit code seems to work
on a UP system:

0x00010444 <main+0>:    ldil L%10000,r1
0x00010448 <main+4>:    ldo 444(r1),r1
0x0001044c <main+8>:    ldsid (r1),r31
0x00010450 <main+12>:   mtsp r31,sr3
0x00010454 <main+16>:   be 0(sr3,r1)
0x00010458 <main+20>:   nop
0x0001045c <main+24>:   bv r0(rp)
0x00010460 <main+28>:   ldi 0,ret0

Of course, sr3 should be the current space.  Whether it is or not is
an interesting question as gdb doesn't seem to be able to figure out
what the space registers contain.  When I run the above under gdb,
it reports that all the space registers are 0.  If I run the program
and signal an abort, I see the following in the core dump:

sr4            0xb3     179
sr0            0x0      0
sr1            0xb3     179
sr2            0x0      0
sr3            0xffff   65535
sr5            0xb3     179
sr6            0xb3     179
sr7            0xb3     179

This is with your patch installed.

> The user space convention on linux says that sr0,1,3-7 should contain
> the current space and sr2 contains zero for gateway operations.
> Theoretically, the user can stash values in sr0-3 as long as they're
> never used; practically, nothing does this.

I can think of a use.  There are certain situation in gcc where
we need to generate a long branch.  We need r1 for this but it
may be live.  So, we stash it in the frame marker and restore
it in the delay slot of the branch.  It might be better to use
a space register to save r1.

I don't think the linux user space convention regarding space
registers and calling conventions is documented.

Regarding the requirement that sr2 always contain zero for
gateway operations, I think this is unnecessary.  For example,
I see the following in libc.a:

00000000 <syscall>:
   0:   0f d9 12 81     stw r25,-10(sp)
   4:   27 c1 10 16     fldw -10(sp),fr22
   8:   6b c2 3f d9     stw rp,-14(sp)
   c:   08 18 02 59     copy r24,r25
  10:   6f c3 00 80     stw,ma r3,40(sp)
  14:   08 17 02 58     copy r23,r24
  18:   08 1a 02 5c     copy r26,ret0
  1c:   4b d5 3f 09     ldw -7c(sp),r21
  20:   4b d6 3f 11     ldw -78(sp),r22
  24:   4b d7 3f 19     ldw -74(sp),r23
  28:   27 c1 12 16     fstw fr22,-10(sp)
  2c:   0f c1 10 9a     ldw -10(sp),r26
  30:   08 00 02 40     nop
  34:   e4 00 82 00     be,l 100(sr2,r0),sr0,r31
  38:   08 1c 02 54     copy ret0,r20

The branch to the gateway page always seems to be preceded by a nop.
It could be replaced by a mtsp instruction:

	mtsp %r0,%sr2

This would ensure that sr2 is always set correctly for the branch to
the gateway page.

Personally, I would like to see sr0 through sr3 available for general
use.  I would also sr4 through sr7 to be stable (i.e., not change during
the lifetime of an application).  Obviously, sr0 through sr3 would
be call clobbered.

Don't like what's going on with fr22 in the above code.  Seems like a
GCC optimization bug since it looks like there are a few general registers
that could be used.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
