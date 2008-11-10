From: Domenico Andreoli <cavokz@gmail.com>
Subject: [PATCH] fix build error on hppa SMP (was Re: Linux 2.6.28-rc4)
Date: Mon, 10 Nov 2008 16:42:26 +0100
Message-ID: <20081110154226.GA28675@tilt.dandreoli.com>
References: <alpine.LFD.2.00.0811091650250.3468@nehalem.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0811091650250.3468@nehalem.linux-foundation.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Nov 09, 2008 at 04:55:42PM -0800, Linus Torvalds wrote:
> 
> Rusty Russell (3):
>       cpumask: introduce new API, without changing anything
>       cpumask: new API, v2
>       cpumask: introduce new API, without changing anything, v3

Nothing to change here, go away! :)

---
From: Domenico Andreoli <cavok@dandreoli.com>
Date: Mon, 10 Nov 2008 16:31:07 +0100
Subject: [PATCH] fix build error on hppa SMP

Remove extern declaration of cpu_present_mask.

Fixes build error due to new cpumask API (2d3854a37e8b767a51aba38ed6d22817b0631e33).

Signed-off-by: Domenico Andreoli <cavok@dandreoli.com>
---
 arch/parisc/include/asm/smp.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/smp.h b/arch/parisc/include/asm/smp.h
index 398cdba..409e698 100644
--- a/arch/parisc/include/asm/smp.h
+++ b/arch/parisc/include/asm/smp.h
@@ -44,8 +44,6 @@ extern void arch_send_call_function_ipi(cpumask_t mask);
  
 #define PROC_CHANGE_PENALTY	15		/* Schedule penalty */
 
-extern unsigned long cpu_present_mask;
