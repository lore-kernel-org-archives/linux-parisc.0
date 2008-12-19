From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
	compiling ruby1.9
Date: Fri, 19 Dec 2008 18:34:35 -0500
Message-ID: <20081219233435.GA25457@bombadil.infradead.org>
References: <4949812D.7080608@gmx.de> <20081219212906.GG8945@bombadil.infradead.org> <494C273F.1040200@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@infradead.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <494C273F.1040200@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Dec 19, 2008 at 11:59:11PM +0100, Helge Deller wrote:
> Thanks for cleaning up my patch and splitting out the fixup_exception()
> code.
> Your patch is fine and I think you should apply it (with one minor
> addition - see below).
> The reason I think why you should apply it is, that we shouldn't let the
> kernel crash on (correct) userspace apps.
> Maybe adding a comment that this check in trap #27 should be removed
> when the bug is fixed would be good though.
> 

Hmm. You raise a good point that userspace is DTRT...
Can you test to see if this patch fixes things? My c3000 with an
unpatched kernel has suddenly decided it doesn't want to crash 
anymore...

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 4c771cd..73058e8 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -745,6 +745,19 @@ void handle_interruption(int code, struct pt_regs *regs)
 		/* Fall Through */
 	case 27: 
 		/* Data memory protection ID trap */
+#define HANDLE_KERNEL_PROTECTION_TRAPS
+#ifdef HANDLE_KERNEL_PROTECTION_TRAPS
+		/* XXX very very evil */
+		if (code == 27 && !user_mode(regs)) {
+			/* bang the spaceid back into sr3 */
+			regs->sr[3] = (unsigned long)current->mm.context;
+			/* TODO? reprogram %cr8? load_context will get it. */
+			/* TODO? thread_struct.faulted count to catch
+			 *  taking the same fault on the same insn again?
+			 */
+			return;
+		}
+#endif /*HANDLE_KERNEL_PROTECTION_TRAPS*/
 		die_if_kernel("Protection id trap", regs, code);
 		si.si_code = SEGV_MAPERR;
 		si.si_signo = SIGSEGV;
