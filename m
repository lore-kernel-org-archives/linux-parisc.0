From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [PATCH] parisc: fix warning in traps.c
Date: Fri, 28 Aug 2009 15:00:36 -0400
Message-ID: <20090828190036.GG19494@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: grundler@parisc-linux.org, linux-parisc@vger.kernel.org,
	deller@gmx.de
To: torvalds@linux-foundation.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Grant Grundler <grundler@parisc-linux.org>

On Tue, Aug 18, 2009 at 01:45:17PM -0400, John David Anglin wrote:
>  CC      arch/parisc/kernel/traps.o
> arch/parisc/kernel/traps.c: In function 'handle_interruption':
> arch/parisc/kernel/traps.c:535:18: warning: operation on 'regs->iasq[0]'
> may be undefined

Yes - Line 535 should use both [0] and [1].

Reported-by: John David Anglin <dave@hiauly1.hia.nrc.ca>
Signed-off-by: Grant Grundler <grundler@parisc-linux.org>
Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -532,7 +532,7 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 	  	/* Kill the user process later */
 	  	regs->iaoq[0] = 0 | 3;
 		regs->iaoq[1] = regs->iaoq[0] + 4;
-	 	regs->iasq[0] = regs->iasq[0] = regs->sr[7];
+	 	regs->iasq[0] = regs->iasq[1] = regs->sr[7];
 		regs->gr[0] &= ~PSW_B;
 		return;
 	}
