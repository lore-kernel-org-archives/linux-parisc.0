From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Debugging 64-bit kernel crashes involving
Date: Tue, 27 Feb 2007 18:02:10 -0600
Message-ID: <1172620930.3408.46.camel__26560.2221865722$1416624319$gmane$org@mulgrave.il.steeleye.com>
References: <200702240039.l1O0dCxG017471@hiauly1.hia.nrc.ca>
	<1172277920.3424.83.camel@mulgrave.il.steeleye.com>
	<119aab440702251819u1a070512j2cb8ca2eeadf0962@mail.gmail.com>
	<1172461983.3423.34.camel@mulgrave.il.steeleye.com>
	<1172467172.3423.39.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1172467172.3423.39.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-02-25 at 23:19 -0600, James Bottomley wrote:
> OK, I have a theory.  It has to do with the way we do flush_tlb_mm by
> incrementing the spaceid.  This works in a single space per process
> model.  However, a process with multiple threads has >1 scheduling
> context which share spaces.  So, the theory goes that when we fork from
> a thread, we execute flush_tlb_mm which bumps the context (space).  Then
> we schedule another thread in the same process.  However, this picks up
> its space registers from the task rather than the mm->context, so it
> uses the old mm.  Now, the load context has updated %cr8, the protection
> ID.  However %cr8 isn't part of the task context, so we end up executing
> in the old context with the protection of the new one ... resulting in a
> protection ID trap.

Based on the theory, I managed to reproduce the problem on ioz (you just
have to increase N to be much greater than the number of CPUs you have)
and tried a little fix, which seems to work for ioz.  Could you try this
out on your a500?

Thanks,

James
Index: BUILD-2.6/arch/parisc/kernel/process.c
===================================================================
--- BUILD-2.6.orig/arch/parisc/kernel/process.c	2007-02-27 15:52:54.000000000 -0800
+++ BUILD-2.6/arch/parisc/kernel/process.c	2007-02-27 15:57:24.000000000 -0800
@@ -395,3 +395,30 @@ get_wchan(struct task_struct *p)
 	} while (count++ < 16);
 	return 0;
 }
+
+struct task_struct *__switch_to(struct task_struct *prev,
+			       struct task_struct *next)
+{
+	unsigned long sr3;
+	unsigned long newsr3 = mfsp(3);
+	struct pt_regs *regs = &next->thread.regs;
+
+	/* need to be executing in user context */
+	if (regs->iasq[0] != 0 || regs->iasq[1] != 0) {
+		sr3 = regs->sr[7];
+
+		/* need our current space to be different from our
+		 * new one.  Note, this trips a lot if we're in a
+		 * syscall not an interrupt from userspace, but in the
+		 * syscall case, this is a nop since the space is
+		 * explicitly reconstructed on return from syscall */
+		if (unlikely(sr3 != 0 && sr3 != newsr3)) {
+			int i;
+
+			for (i = 0; i < 8; i++)
+				if (regs->sr[i] == sr3)
+					regs->sr[i] = newsr3;
+		}
+	}
+	return _switch_to(prev, next);
+}
Index: BUILD-2.6/include/asm-parisc/system.h
===================================================================
--- BUILD-2.6.orig/include/asm-parisc/system.h	2007-02-27 15:53:12.000000000 -0800
+++ BUILD-2.6/include/asm-parisc/system.h	2007-02-27 15:54:33.000000000 -0800
@@ -43,9 +43,10 @@ struct pa_psw {
 struct task_struct;
 
 extern struct task_struct *_switch_to(struct task_struct *, struct task_struct *);
+extern struct task_struct *__switch_to(struct task_struct *, struct task_struct *);
 
 #define switch_to(prev, next, last) do {			\
-	(last) = _switch_to(prev, next);			\
+	(last) = __switch_to(prev, next);			\
 } while(0)
 
 /*



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
