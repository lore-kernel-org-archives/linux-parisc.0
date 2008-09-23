From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [RFC][PATCH] Demultiplexing SIGTRAP signal -v2
Date: Tue, 23 Sep 2008 16:31:20 +0200
Message-ID: <20080923143120.GD14041@elte.hu>
References: <200809221602.32616.srinivasa@in.ibm.com> <20080923112812.GL29021@elte.hu> <20080923113001.GA12531@elte.hu> <200809231955.01564.srinivasa@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Roland McGrath <roland@redhat.com>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, paulus@samba.org,
	linuxppc-dev@ozlabs.org, linux-parisc@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>
To: Srinivasa Ds <srinivasa@in.ibm.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200809231955.01564.srinivasa@in.ibm.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


* Srinivasa Ds <srinivasa@in.ibm.com> wrote:

> > -tip testing found the following build error with the attached 
> > config:
> 
> Ingo, Reproduced build break issue with your config on tip tree. It 
> was a costly overlook to miss one header file. I included it in this 
> patch and tested it out.

thanks - applied the delta fix below to tip/core/signal.

	Ingo

--------------->
>From e8d3f455de4f42d4bab2f6f1aeb2cf3bd18eb508 Mon Sep 17 00:00:00 2001
From: Srinivasa Ds <srinivasa@in.ibm.com>
Date: Tue, 23 Sep 2008 15:23:52 +0530
Subject: [PATCH] signals: demultiplexing SIGTRAP signal, fix

fix build breakage, missing header file.

Signed-off-by: Srinivasa DS <srinivasa@in.ibm.com>
Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 include/asm-x86/traps.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/asm-x86/traps.h b/include/asm-x86/traps.h
index 4b1e904..7a692ba 100644
--- a/include/asm-x86/traps.h
+++ b/include/asm-x86/traps.h
@@ -1,6 +1,8 @@
 #ifndef ASM_X86__TRAPS_H
 #define ASM_X86__TRAPS_H
 
+#include <asm/debugreg.h>
+
 /* Common in X86_32 and X86_64 */
 asmlinkage void divide_error(void);
 asmlinkage void debug(void);
