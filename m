Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E505483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Sep 2003 12:27:30 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8JIQkI19286;
	Fri, 19 Sep 2003 14:26:46 -0400
Subject: Re: [parisc-linux] r19 (aka pic-register akak ltp) not restored on
	entry back to libc from libpthread?
From: James Bottomley <James.Bottomley@steeleye.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dave.anglin@nrc-cnrc.gc.ca,
	PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20030919175142.GI18225@systemhalted>
References: <20030919135606.GE18225@systemhalted>
	<200309191656.h8JGukWJ003212@hiauly1.hia.nrc.ca>
	<20030919175142.GI18225@systemhalted>
Content-Type: text/plain
Date: 19 Sep 2003 13:26:44 -0500
Message-Id: <1063996009.1832.34.camel@mulgrave>
Mime-Version: 1.0
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

On Fri, 2003-09-19 at 12:51, Carlos O'Donell wrote:
> mutex_unlock becomes:
> __libc_maybe_call (__pthread_mutex_unlock, (m), (*(int *)(m) = 0))

This seems all to work:

A test file

main() {
  int t1 = 4;
  __libc_maybe_call(test1, (t1), (t1=3));
}

compiles (PIC) to:

00000000 <main>:
[...]
 20:   2a 60 00 00     addil 0,r19,%r1
                        20: R_PARISC_DLTIND21L  .LC0
  24:   48 21 00 00     ldw 0(r1),r1
                        24: R_PARISC_DLTIND14R  .LC0
  28:   0c 20 10 94     ldw 0(,r1),r20
  2c:   0c 74 12 98     stw r20,c(,r3)
  30:   0c 78 10 94     ldw c(,r3),r20
  34:   86 80 20 3a     cmpib,=,n 0,r20,58 <main+0x58>
  38:   0c 78 10 94     ldw c(,r3),r20
  3c:   0c 70 10 9a     ldw 8(,r3),r26
  40:   08 14 02 56     copy r20,r22
  44:   08 13 02 44     copy r19,r4
  48:   eb e0 00 00     b,l 50 <main+0x50>,r31
                        48: R_PARISC_PCREL17F   $$dyncall
  4c:   08 1f 02 42     copy r31,rp
  50:   08 04 02 53     copy r4,r19
[...]
00000000 <.LC0>:
   0:   00 00 00 00     break 0,0
                        0: R_PARISC_PLABEL32    test1
[...]
00010578 <$$dyncall>:
   10578:	c7 d6 c0 12 	bb,>=,n r22,1e,10588 <$$dyncall+0x10>
   1057c:	d6 c0 1c 1e 	depwi 0,31,2,r22
   10580:	0e c8 10 93 	ldw 4(,r22),r19
   10584:	0e c0 10 96 	ldw 0(,r22),r22
   10588:	ea c0 c0 00 	bv r0(r22)
   1058c:	6b c2 3f d1 	stw rp,-18(sp)


The $$dyncall is where we indirect through r20 (which contains the
function pointer).  Note the copy restoring r19 around this.

James
