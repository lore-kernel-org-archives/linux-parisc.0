From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Sun, 20 May 2012 21:15:24 +0100
Message-ID: <1337544924.2682.21.camel@dabdike.int.hansenpartnership.com>
References: <4FA9975C.5060708@bergerie>
	    <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>
	    <4FAADE2A.9080803@bergerie>
	  <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>   <4FAEE943.2030203@gmx.de>
	  <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>   <4FB182F8.2040403@gmx.de>
	  <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>
	    <1337069366.3005.10.camel@dabdike.lan>
	   <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net>
	   <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net>
	   <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de>
	   <4FB2B71B.7090602@bell.net> <4FB2BC5F.3080905@gmx.de>
	   <4FB2C129.90307@bell.net> <4FB550F1.7080104@gmx.de>
	  <1337328744.2938.5.camel@dabdike.int.hansenpartnership.com>
	  <4FB6BA76.6010101@gmx.de>
	 <1337508060.2682.13.camel@dabdike.int.hansenpartnership.com>
	 <4FB941EF.4060304@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: John David Anglin <dave.anglin@bell.net>,
	Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FB941EF.4060304@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2012-05-20 at 21:11 +0200, Helge Deller wrote:
> On 05/20/2012 12:01 PM, James Bottomley wrote:
> > On Fri, 2012-05-18 at 23:09 +0200, Helge Deller wrote:
> >> James, here is the full kernel log. Does this help?
> >
> > Yes and no: it shows clearly we got all the way through the initrd, so
> > we've gone through the alias region thousands of times doing flushes.
> >
> >> Kernel Fault: Code=26 regs=8fc30940 (Addr=0f2ff000)
> >>
> > It's an access rights trap, presumably on the alias tlb, since the
> > address is definitely in the alias region.  The obvious candidate is the
> > protection id deposit in do_alias
> >
> > 	depw,z		\prot,8,7,\prot
> >
> > but that all checks out fine (you can compare it with
> > make_insert_tlb_11). So the page should have read, write and dirty set.
> >
> > The interesting thing is that the only way to get an access rights trap
> > in the kernel is if the protection type is zero and I just can't see how
> > do_alias would zero out \prot in a way that functions on your C3000
> > (PA2.0) but not on the PA1.1 systems.
> >
> > Are you sure this is booting the same kernel?
> 
> Yes, since I use tftboot to deliver same vmlinux kernel to all my machines
> for bootup.

The penny finally dropped on Dave's last comment.  The _20 path needs to
use wide instructions even though it's executing narrow code because we
have to use the PA2.0 tlb insertion instruction, so it's not
CONFIG_64BIT that's the differentiator, but which interruption path
we're on.

Does this fix it?

James

---

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 5350342..07ef351 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -552,7 +552,7 @@
 	 * entry (identifying the physical page) and %r23 up with
 	 * the from tlb entry (or nothing if only a to entry---for
 	 * clear_user_page_asm) */
-	.macro		do_alias	spc,tmp,tmp1,va,pte,prot,fault
+	.macro		do_alias	spc,tmp,tmp1,va,pte,prot,fault,patype
 	cmpib,COND(<>),n 0,\spc,\fault
 	ldil		L%(TMPALIAS_MAP_START),\tmp
 #if defined(CONFIG_64BIT) && (TMPALIAS_MAP_START >= 0x80000000)
@@ -581,11 +581,15 @@
 	 */
 	cmpiclr,=	0x01,\tmp,%r0
 	ldi		(_PAGE_DIRTY|_PAGE_READ|_PAGE_WRITE),\prot
-#ifdef CONFIG_64BIT
+.ifc \patype,20
 	depd,z		\prot,8,7,\prot
-#else
+.else
+.ifc \patype,11
 	depw,z		\prot,8,7,\prot
-#endif
+.else
+	.error "undefined PA type to do_alias"
+.endif
+.endif
 	/*
 	 * OK, it is in the temp alias region, check whether "from" or "to".
 	 * Check "subtle" note in pacache.S re: r23/r26.
@@ -1189,7 +1193,7 @@ dtlb_miss_20w:
 	nop
 
 dtlb_check_alias_20w:
-	do_alias	spc,t0,t1,va,pte,prot,dtlb_fault
+	do_alias	spc,t0,t1,va,pte,prot,dtlb_fault,20
 
 	idtlbt          pte,prot
 
@@ -1213,7 +1217,7 @@ nadtlb_miss_20w:
 	nop
 
 nadtlb_check_alias_20w:
-	do_alias	spc,t0,t1,va,pte,prot,nadtlb_emulate
+	do_alias	spc,t0,t1,va,pte,prot,nadtlb_emulate,20
 
 	idtlbt          pte,prot
 
@@ -1245,7 +1249,7 @@ dtlb_miss_11:
 	nop
 
 dtlb_check_alias_11:
-	do_alias	spc,t0,t1,va,pte,prot,dtlb_fault
+	do_alias	spc,t0,t1,va,pte,prot,dtlb_fault,11
 
 	idtlba          pte,(va)
 	idtlbp          prot,(va)
@@ -1277,7 +1281,7 @@ nadtlb_miss_11:
 	nop
 
 nadtlb_check_alias_11:
-	do_alias	spc,t0,t1,va,pte,prot,nadtlb_emulate
+	do_alias	spc,t0,t1,va,pte,prot,nadtlb_emulate,11
 
 	idtlba          pte,(va)
 	idtlbp          prot,(va)
@@ -1304,7 +1308,7 @@ dtlb_miss_20:
 	nop
 
 dtlb_check_alias_20:
-	do_alias	spc,t0,t1,va,pte,prot,dtlb_fault
+	do_alias	spc,t0,t1,va,pte,prot,dtlb_fault,20
 	
 	idtlbt          pte,prot
 
@@ -1330,7 +1334,7 @@ nadtlb_miss_20:
 	nop
 
 nadtlb_check_alias_20:
-	do_alias	spc,t0,t1,va,pte,prot,nadtlb_emulate
+	do_alias	spc,t0,t1,va,pte,prot,nadtlb_emulate,20
 
 	idtlbt          pte,prot
 
@@ -1457,7 +1461,7 @@ naitlb_miss_20w:
 	nop
 
 naitlb_check_alias_20w:
-	do_alias	spc,t0,t1,va,pte,prot,naitlb_fault
+	do_alias	spc,t0,t1,va,pte,prot,naitlb_fault,20
 
 	iitlbt		pte,prot
 
@@ -1511,7 +1515,7 @@ naitlb_miss_11:
 	nop
 
 naitlb_check_alias_11:
-	do_alias	spc,t0,t1,va,pte,prot,itlb_fault
+	do_alias	spc,t0,t1,va,pte,prot,itlb_fault,11
 
 	iitlba          pte,(%sr0, va)
 	iitlbp          prot,(%sr0, va)
@@ -1557,7 +1561,7 @@ naitlb_miss_20:
 	nop
 
 naitlb_check_alias_20:
-	do_alias	spc,t0,t1,va,pte,prot,naitlb_fault
+	do_alias	spc,t0,t1,va,pte,prot,naitlb_fault,20
 
 	iitlbt          pte,prot
 


