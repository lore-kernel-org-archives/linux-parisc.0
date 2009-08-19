From: Grant Grundler <grundler@parisc-linux.org>
Subject: PATCH [2.6.31-rc6] fix warning in traps.c line 535
Date: Wed, 19 Aug 2009 13:04:10 -0600
Message-ID: <20090819190410.GB24471@lackof.org>
References: <20090817234554.GD26336@lackof.org> <20090818174518.6E0EA4CFD@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090818174518.6E0EA4CFD@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Aug 18, 2009 at 01:45:17PM -0400, John David Anglin wrote:
...
> There's one new parisc warning that I noticed:
> 
>  CC      arch/parisc/kernel/traps.o
> arch/parisc/kernel/traps.c: In function 'handle_interruption':
> arch/parisc/kernel/traps.c:535:18: warning: operation on 'regs->iasq[0]' may be
> undefined
> 
> Looks like a typo.

Yes - Line 535 should use both [0] and [1].

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>
----

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 528f0ff..8b58bf0 100644
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
