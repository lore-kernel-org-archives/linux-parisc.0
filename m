From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: vfork test case.
Date: Tue, 22 Jun 2010 11:39:31 -0400
Message-ID: <AANLkTinFBc9524WWuwrRvuBQGY0OCqjPIZ_t9A7esb-B@mail.gmail.com>
References: <119aab440912061319y5b863203ve5dc3dc568a6ccec@mail.gmail.com>
	<20100620042814.ECC205160@hiauly1.hia.nrc.ca>
	<AANLkTilfnhsd5mWmO_qJeCv0XmZ6IYKw6Il19No3_wnF@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTilfnhsd5mWmO_qJeCv0XmZ6IYKw6Il19No3_wnF@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 22, 2010 at 11:17 AM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> Oh dear, yes I see. After the child returns from vfork, it calls exec,
> clobbering the vfork frame that the parent must still unwind from. Is
> that what you mean?

Is this a complete fix?

diff --git a/sysdeps/unix/sysv/linux/hppa/nptl/pt-vfork.S
b/sysdeps/unix/sysv/linux/hppa/nptl/pt-vfork.S
index 83a70b7..3c685cb 100644
--- a/sysdeps/unix/sysv/linux/hppa/nptl/pt-vfork.S
+++ b/sysdeps/unix/sysv/linux/hppa/nptl/pt-vfork.S
@@ -50,10 +50,9 @@

        /* r26, r25, r24, r23 are free since vfork has no arguments */
 ENTRY(__vfork)
-       /* Prologue */
-       stwm    %r3, 64(%sp)
-       stw     %sp, -4(%sp)
-       stw     %r19, -32(%sp)
+       /* We must not create a frame, otherwise when the child unwinds
+          to call exec it will clobber the same frame that the parent
+          needs to unwind.  */

        /* Save the PIC register. */
 #ifdef PIC
@@ -76,11 +75,16 @@ ENTRY(__vfork)
        b,n     .Lerror

        /* Return, no need to restore the PIC register. */
-       ldw     -84(%sp), %rp
-       bv      %r0(%rp)
-       ldwm    -64(%sp), %r3
+       ldw     -20(%sp), %rp
+       bv,n    %r0(%rp)

 .Lerror:
+       /* Now we need a stack to record the error. We are assured
+          that there is no child now, so it's safe to create
+          a frame.  */
+       stwm    %r3, 64(%sp)
+       stw     %sp, -4(%sp)
+
        sub     %r0,%ret0,%r3
        SYSCALL_ERROR_HANDLER
        /* Restore the PIC register (in delay slot) on error */

I'm building/testing this and I will tell you how it goes.

Cheers,
Carlos.
