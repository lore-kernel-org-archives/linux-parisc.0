From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [RFC] probe,r and probe,w emulation in the kernel.
Date: Sun, 8 Aug 2004 02:17:05 -0400
Message-ID: <20040808061704.GU2672@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


pa,

Added probe,r and probe,w emulation in the nadtlb_emulate path of the
tlb miss handlers. It makes the emulation path 3 insns longer but allows
other kernel asm code to check for invalid user addresses. I use this
code right now in the LWS setup.

Comments are very welcome!

c.

Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/entry.S,v
retrieving revision 1.18
diff -u -p -r1.18 entry.S
--- arch/parisc/kernel/entry.S	30 Jul 2004 23:23:20 -0000	1.18
+++ arch/parisc/kernel/entry.S	8 Aug 2004 06:06:06 -0000
@@ -1443,18 +1443,29 @@ nadtlb_emulate:
 	 * of the instruction. Since we don't insert a translation
 	 * we can get a lot of faults during a flush loop, so it makes
 	 * sense to try to do it here with minimum overhead. We only
-	 * emulate fdc,fic & pdc instructions whose base and index
-	 * registers are not shadowed. We defer everything else to the
-	 * "slow" path.
+	 * emulate fdc,fic,pdc,probew,prober instructions whose base 
+         * and index registers are not shadowed. We defer everything 
+         * else to the "slow" path.
 	 */
 
 	mfctl           %cr19,%r9 /* Get iir */
-	ldi             0x280,%r16
+
+        /* PA 2.0 Arch Ref. Book pg 382 has a good description of the insn bits.
+           Checks for fdc,fdce,pdc,"fic,4f",prober,probeir,probew, probeiw */
+
+	ldi             0x80,%r16
 	and             %r9,%r16,%r17
-	cmpb,<>,n       %r16,%r17,nadtlb_fault /* Not fdc,fic,pdc */
+	cmpb,<>,n       %r16,%r17,nadtlb_fault 
+
+        /* Checks for fdc,fdce,pdc,"fic,4f" only */
+
+        ldi             0x200,%r16
+        and             %r9,%r16,%r17
+        cmpb,<>,n       %r16,%r17,nadtlb_probe /* Must be probe,[rw] */
 	bb,>=,n         %r9,26,nadtlb_nullify  /* m bit not set, just nullify */
 	BL		get_register,%r25
 	extrw,u         %r9,15,5,%r8           /* Get index register # */
+
 	CMPIB=,n        -1,%r1,nadtlb_fault    /* have to use slow path */
 	copy            %r1,%r24
 	BL		get_register,%r25
@@ -1471,6 +1482,26 @@ nadtlb_nullify:
 
 	rfir
 	nop
+
+        /* 
+           When there is no translation for the probew address then we
+           must nullify the insn and return zero in the target regsiter.
+           This will indicate to the calling code that it does not have 
+           write privileges to this address.
+
+           This should technically work for prober and probew in PA 1.1,
+           and also probe,r and probe,w in PA 2.0
+
+        */
+nadtlb_probe:
+        BL              get_register,%r25      /* Find the target register */
+	extrw,u         %r9,31,5,%r8           /* Get target register */
+	CMPIB=,n        -1,%r1,nadtlb_fault    /* have to use slow path */
+	BL		set_register,%r25
+        copy            %r0,%r1                /* Write zero to target register */
+        b nadtlb_nullify                       /* Nullify return insn */
+        nop
+
 
 #ifdef __LP64__
 itlb_miss_20w:
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
