From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [PATCH] LWS fixes for syscall.S
Date: Sun, 11 Apr 2010 13:26:34 -0400
Message-ID: <20100411172634.GD7756@hiauly1.hia.nrc.ca>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AkbCVLjbJ9qUtAXD"
Cc: dave.anglin@nrc-cnrc.gc.ca, deller@gmx.de, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 09 Apr 2010, Carlos O'Donell wrote:

> We need to start splitting up your giant "stability" patch into
> manageable chunks.

Here's the fifth chunk.  It contains a variety of fixes to the LWS
code in syscall.S.

1) Gate immediately and save a branch.
2) Fix off by one error in checking entry number.
3) Use sr7 instead of sr3 in error return path as sr3 might not
   contain correct value.
4) Enable locking on UP systems to prevent incorrect operation of
   the cas_action critical region on page faults.

Fixes 2 and 4 are new.

Tested on several systems, including UP c3750 with 2.6.33.2 kernel.

Signed-off-by: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="syscall.S.d"

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index f5f9602..68e75ce 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -47,18 +47,17 @@ ENTRY(linux_gateway_page)
 	KILL_INSN
 	.endr
 
-	/* ADDRESS 0xb0 to 0xb4, lws uses 1 insns for entry */
+	/* ADDRESS 0xb0 to 0xb8, lws uses two insns for entry */
 	/* Light-weight-syscall entry must always be located at 0xb0 */
 	/* WARNING: Keep this number updated with table size changes */
 #define __NR_lws_entries (2)
 
 lws_entry:
-	/* Unconditional branch to lws_start, located on the 
-	   same gateway page */
-	b,n	lws_start
+	gate	lws_start, %r0		/* increase privilege */
+	depi	3, 31, 2, %r31		/* Ensure we return into user mode. */
 
-	/* Fill from 0xb4 to 0xe0 */
-	.rept 11
+	/* Fill from 0xb8 to 0xe0 */
+	.rept 10
 	KILL_INSN
 	.endr
 
@@ -423,9 +422,6 @@ tracesys_sigexit:
 
 	*********************************************************/
 lws_start:
-	/* Gate and ensure we return to userspace */
-	gate	.+8, %r0
-	depi	3, 31, 2, %r31	/* Ensure we return to userspace */
 
 #ifdef CONFIG_64BIT
 	/* FIXME: If we are a 64-bit kernel just
@@ -442,7 +438,7 @@ lws_start:
 #endif	
 
         /* Is the lws entry number valid? */
-	comiclr,>>=	__NR_lws_entries, %r20, %r0
+	comiclr,>>	__NR_lws_entries, %r20, %r0
 	b,n	lws_exit_nosys
 
 	/* WARNING: Trashing sr2 and sr3 */
@@ -473,7 +469,7 @@ lws_exit:
 	/* now reset the lowest bit of sp if it was set */
 	xor	%r30,%r1,%r30
 #endif
-	be,n	0(%sr3, %r31)
+	be,n	0(%sr7, %r31)
 
 
 	
@@ -529,7 +525,6 @@ lws_compare_and_swap32:
 #endif
 
 lws_compare_and_swap:
-#ifdef CONFIG_SMP
 	/* Load start of lock table */
 	ldil	L%lws_lock_start, %r20
 	ldo	R%lws_lock_start(%r20), %r28
@@ -572,8 +567,6 @@ cas_wouldblock:
 	ldo	2(%r0), %r28				/* 2nd case */
 	b	lws_exit				/* Contended... */
 	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */
-#endif
-/* CONFIG_SMP */
 
 	/*
 		prev = *addr;
@@ -601,13 +594,11 @@ cas_action:
 1:	ldw	0(%sr3,%r26), %r28
 	sub,<>	%r28, %r25, %r0
 2:	stw	%r24, 0(%sr3,%r26)
-#ifdef CONFIG_SMP
 	/* Free lock */
 	stw	%r20, 0(%sr2,%r20)
-# if ENABLE_LWS_DEBUG
+#if ENABLE_LWS_DEBUG
 	/* Clear thread register indicator */
 	stw	%r0, 4(%sr2,%r20)
-# endif
 #endif
 	/* Return to userspace, set no error */
 	b	lws_exit
@@ -615,12 +606,10 @@ cas_action:
 
 3:		
 	/* Error occured on load or store */
-#ifdef CONFIG_SMP
 	/* Free lock */
 	stw	%r20, 0(%sr2,%r20)
-# if ENABLE_LWS_DEBUG
+#if ENABLE_LWS_DEBUG
 	stw	%r0, 4(%sr2,%r20)
-# endif
 #endif
 	b	lws_exit
 	ldo	-EFAULT(%r0),%r21	/* set errno */
@@ -672,7 +661,6 @@ ENTRY(sys_call_table64)
 END(sys_call_table64)
 #endif
 
-#ifdef CONFIG_SMP
 	/*
 		All light-weight-syscall atomic operations 
 		will use this set of locks 
@@ -694,8 +682,6 @@ ENTRY(lws_lock_start)
 	.endr
 END(lws_lock_start)
 	.previous
-#endif
-/* CONFIG_SMP for lws_lock_start */
 
 .end
 

--AkbCVLjbJ9qUtAXD--
