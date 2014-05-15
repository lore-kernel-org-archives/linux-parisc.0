From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Improve LWS-CAS performance (take 2)
Date: Thu, 15 May 2014 08:33:10 -0400
Message-ID: <BLU0-SMTP917CD5D331D850FC5B68BE97360@phx.gbl>
References: <BLU0-SMTP178D56FBECCDEE0B3D0BE6974A0@phx.gbl> <CAE2sS1i7gDUwq+bRoSNhw+kCBsA-cDAzHs4O03yHuWUxqJE-wQ@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-11-943196040"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1i7gDUwq+bRoSNhw+kCBsA-cDAzHs4O03yHuWUxqJE-wQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-11-943196040
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On 13-May-14, at 11:31 PM, Carlos O'Donell wrote:

>> 2) Removes the lock code on UP systems where it is not needed, and
>
> This is wrong. The locking was originally only for SMP, but at one
> point it was discovered that you could COW during the CAS operation
> and if you didn't take the lock in UP, you could re-enter the CAS via
> another task and thus incorrectly carry out the CAS in two different
> threads and corrupt the state.

The attached file updates the change so that the lock code is no  
longer removed
on UP systems.  I added a comment to indicate that contention can  
occur even on
UP systems.

Lightly tested with a build of kyotocabinet on c3750.

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---


--Apple-Mail-11-943196040
Content-Disposition: attachment; filename="syscall.S.d.1.txt"
Content-Type: text/plain; x-unix-mode=0644; name="syscall.S.d.1.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index a63bb179..8387860 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -589,10 +589,13 @@ cas_nocontend:
 # endif
 /* ENABLE_LWS_DEBUG */
 
+	rsm	PSW_SM_I, %r0				/* Disable interrupts */
+	/* COW breaks can cause contention on UP systems */
 	LDCW	0(%sr2,%r20), %r28			/* Try to acquire the lock */
 	cmpb,<>,n	%r0, %r28, cas_action		/* Did we get it? */
 cas_wouldblock:
 	ldo	2(%r0), %r28				/* 2nd case */
+	ssm	PSW_SM_I, %r0
 	b	lws_exit				/* Contended... */
 	ldo	-EAGAIN(%r0), %r21			/* Spin in userspace */
 
@@ -619,15 +622,17 @@ cas_action:
 	stw	%r1, 4(%sr2,%r20)
 #endif
 	/* The load and store could fail */
-1:	ldw	0(%sr3,%r26), %r28
+1:	ldw,ma	0(%sr3,%r26), %r28
 	sub,<>	%r28, %r25, %r0
-2:	stw	%r24, 0(%sr3,%r26)
+2:	stw,ma	%r24, 0(%sr3,%r26)
 	/* Free lock */
-	stw	%r20, 0(%sr2,%r20)
+	stw,ma	%r20, 0(%sr2,%r20)
 #if ENABLE_LWS_DEBUG
 	/* Clear thread register indicator */
 	stw	%r0, 4(%sr2,%r20)
 #endif
+	/* Enable interrupts */
+	ssm	PSW_SM_I, %r0
 	/* Return to userspace, set no error */
 	b	lws_exit
 	copy	%r0, %r21
@@ -639,6 +644,7 @@ cas_action:
 #if ENABLE_LWS_DEBUG
 	stw	%r0, 4(%sr2,%r20)
 #endif
+	ssm	PSW_SM_I, %r0
 	b	lws_exit
 	ldo	-EFAULT(%r0),%r21	/* set errno */
 	nop

--Apple-Mail-11-943196040
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-11-943196040--
