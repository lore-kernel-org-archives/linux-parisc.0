Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70787482A
	for <parisc-linux@parisc-linux.org>; Sat, 30 Mar 2002 11:38:08 -0700 (MST)
Message-Id: <200203301838.g2UIc1FP028387@hiauly1.hia.nrc.ca>
To: parisc-linux@parisc-linux.org
Date: Sat, 30 Mar 2002 13:38:00 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bame@debian.org, amodra@bigpond.net.au
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] $$remI corner case
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

I have investigated the failure of gcc.c-torture/execute/arith-rand.c
under hppa-linux.  The failure is caused by $$remI returning an incorrect
signed result when the divisor is 0x80000000 (largest negative integer).
The 32-bit linux port currently uses the millicode routines in milli32.S.
This is older code dating from 1995.

The 64-bit port uses milli64.S.  This code looks like it was originally
written for 32-bit but I it's possible some changes have been made
that would make it incompatible with 32-bit registers.  Paul and Alan,
could you comment on this?

I added $$dyncall to milli64.S and modified t-linux to use milli64.S.
This fixes the arith-rand.c fail and there are no other regressions,
so I think we can use milli64.S on both the 32-bit and 64-bit ports.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2002-03-30  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* milli64.S ($$dyncall): New function.
	* t-linux (LIB1ASMFUNCS): Revise module list.
	(LIB1ASMSRC): Use pa/milli64.S.

--- milli64.S.orig	Mon Feb  4 15:25:13 2002
+++ milli64.S	Fri Mar 29 19:36:28 2002
@@ -194,6 +194,30 @@
 #define LREF(sym)	 CAT(L$,sym)
 #endif
 
+#ifdef L_dyncall
+	SUBSPA_MILLI
+	ATTR_DATA
+GSYM($$dyncall)
+	.export $$dyncall,millicode
+	.proc
+	.callinfo	millicode
+	.entry
+	bb,>=,n %r22,30,LREF(1)		; branch if not plabel address
+	depi	0,31,2,%r22		; clear the two least significant bits
+	ldw	4(%r22),%r19		; load new LTP value
+	ldw	0(%r22),%r22		; load address of target
+LSYM(1)
+#ifdef LINUX
+	bv	%r0(%r22)		; branch to the real target
+#else
+	ldsid	(%sr0,%r22),%r1		; get the "space ident" selected by r22
+	mtsp	%r1,%sr0		; move that space identifier into sr0
+	be	0(%sr0,%r22)		; branch to the real target
+#endif
+	stw	%r2,-24(%r30)		; save return address into frame marker
+	.exit
+	.procend
+#endif
 
 #ifdef L_divI
 /* ROUTINES:	$$divI, $$divoI
--- t-linux.orig	Thu Mar 28 19:29:46 2002
+++ t-linux	Fri Mar 29 19:40:36 2002
@@ -1,13 +1,9 @@
 #Plug millicode routines into libgcc.a  We want these on both native and
-#cross compiles.
+#cross compiles.  We use the "64-bit" routines because the "32-bit" code
+#is broken for certain corner cases.
 
-LIB1ASMFUNCS =  _divI _divU _remI _remU _multiply \
-	_divI_15 _divI_14 _divI_12 _divI_10 _divI_9 \
-	_divI_7 _divI_6 _divI_5 _divI_3 \
-	_divU_15 _divU_14 _divU_12 _divU_10 _divU_9 \
-	_divU_7 _divU_6 _divU_5 _divU_3 _dyncall
-
-LIB1ASMSRC = pa/milli32.S
+LIB1ASMFUNCS = _divI _divU _remI _remU _div_const _mulI _dyncall
+LIB1ASMSRC = pa/milli64.S
 
 # Compile crtbeginS.o and crtendS.o as PIC.
 CRTSTUFF_T_CFLAGS_S = -fPIC
