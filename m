From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] prober/w emulation completed.
Date: Sat, 21 Aug 2004 02:33:07 -0400
Message-ID: <20040821063307.GS5207@baldric.uwo.ca>
References: <20040821062448.7F3E14946B7@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 Randolph Chung <tausq@debian.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040821062448.7F3E14946B7@palinux.hppa>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Aug 21, 2004 at 12:24:48AM -0600, Carlos O'Donell wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	carlos	04/08/21 00:24:48
> 
> Modified files:
> 	arch/parisc/kernel: entry.S 
> 
> Log message:
> Add some extra comment to space_check.
> Add support for prober and probew in our non-access TLB
> fault emulation path.

Like the log message says. The OS has to provide some support, we add
support here for prober and probew in the emulation path, but only for
non-shadow registers. The slow path emulation is not complete.

Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/entry.S,v
retrieving revision 1.21
diff -u -p -r1.21 entry.S
--- arch/parisc/kernel/entry.S	18 Aug 2004 18:56:34 -0000	1.21
+++ arch/parisc/kernel/entry.S	21 Aug 2004 06:23:22 -0000
@@ -440,8 +440,17 @@
 	mfctl		%cr25,\reg
 	.endm
 
-	/* Only allow faults on different spaces from the
-	 * currently active one if we're the kernel */
+	/* 
+		space_check(spc,tmp,fault)
+
+		spc - The space we saw the fault with.
+		tmp - The place to store the current space.
+		fault - Function to call on failure.
+
+		Only allow faults on different spaces from the
+		currently active one if we're the kernel 
+
+	*/
 	.macro		space_check	spc,tmp,fault
 	mfsp		%sr7,\tmp
 	or,COND(<>)	%r0,\spc,%r0	/* user may execute gateway page
@@ -1039,7 +1048,14 @@ intr_do_resched:
 
 	.import do_signal,code
 intr_do_signal:
-	/* Only do signals if we are returning to user space */
+	/* 
+		This check is critical to having LWS
+		working. The IASQ is zero on the gateway
+		page and we cannot deliver any signals until
+		we get off the gateway page.
+
+		Only do signals if we are returning to user space 
+	*/
 	LDREG	PT_IASQ0(%r16), %r20
 	CMPIB= 0,%r20,intr_restore /* backward */
 	nop
@@ -1446,15 +1462,20 @@ nadtlb_emulate:
 	 * of the instruction. Since we don't insert a translation
 	 * we can get a lot of faults during a flush loop, so it makes
 	 * sense to try to do it here with minimum overhead. We only
-	 * emulate fdc,fic & pdc instructions whose base and index
-	 * registers are not shadowed. We defer everything else to the
-	 * "slow" path.
+	 * emulate fdc,fic,pdc,probew,prober instructions whose base 
+	 * and index registers are not shadowed. We defer everything 
+	 * else to the "slow" path.
 	 */
 
 	mfctl           %cr19,%r9 /* Get iir */
+
+	/* PA 2.0 Arch Ref. Book pg 382 has a good description of the insn bits.
+	   Checks for fdc,fdce,pdc,"fic,4f",prober,probeir,probew, probeiw */
+
+	/* Checks for fdc,fdce,pdc,"fic,4f" only */
 	ldi             0x280,%r16
 	and             %r9,%r16,%r17
-	cmpb,<>,n       %r16,%r17,nadtlb_fault /* Not fdc,fic,pdc */
+	cmpb,<>,n       %r16,%r17,nadtlb_probe_check
 	bb,>=,n         %r9,26,nadtlb_nullify  /* m bit not set, just nullify */
 	BL		get_register,%r25
 	extrw,u         %r9,15,5,%r8           /* Get index register # */
@@ -1474,6 +1495,32 @@ nadtlb_nullify:
 
 	rfir
 	nop
+
+	/* 
+		When there is no translation for the probe address then we
+		must nullify the insn and return zero in the target regsiter.
+		This will indicate to the calling code that it does not have 
+		write/read privileges to this address.
+
+		This should technically work for prober and probew in PA 1.1,
+		and also probe,r and probe,w in PA 2.0
+
+		WARNING: USE ONLY NON-SHADOW REGISTERS WITH PROBE INSN!
+		THE SLOW-PATH EMULATION HAS NOT BEEN WRITTEN YET.
+
+	*/
+nadtlb_probe_check:
+	ldi             0x80,%r16
+	and             %r9,%r16,%r17
+	cmpb,<>,n       %r16,%r17,nadtlb_fault /* Must be probe,[rw]*/
+	BL              get_register,%r25      /* Find the target register */
+	extrw,u         %r9,31,5,%r8           /* Get target register */
+	CMPIB=,n        -1,%r1,nadtlb_fault    /* have to use slow path */
+	BL		set_register,%r25
+	copy            %r0,%r1                /* Write zero to target register */
+	b nadtlb_nullify                       /* Nullify return insn */
+	nop
+
 
 #ifdef __LP64__
 itlb_miss_20w:
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
