From: rubisher <rubisher@scarlet.be>
Subject: [Patch] cleanup pleonasm in unaligned.c
Date: Sat, 07 Jun 2008 21:52:01 +0000
Message-ID: <484B0301.2050505@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: "Carlos O'Donell" <carlos@systemhalted.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Carlos, Kyle,

Trying to refresh my memory about gcc "memory" clobber, I just figure out that I missed what looks to me a useless 
redundancy in some FIXUP_BRANCH_CLOBBER usage in the mentioned file:

you did well:
#define FIXUP_BRANCH_CLOBBER "r1"

I think so what is following is just a cleanup which wouldn't affect the generated code, even thought:
--- ./a/arch/parisc/kernel/unaligned.c	2008-05-17 16:44:35.000000000 +0000
+++ ./b/arch/parisc/kernel/unaligned.c	2008-06-07 21:30:56.000000000 +0000
@@ -350,7 +350,7 @@
  	ASM_EXCEPTIONTABLE_ENTRY(2b,4b)
  	: "=r" (ret)
  	: "r" (val), "r" (regs->ior), "r" (regs->isr)
-	: "r19", "r20", "r21", "r22", "r1", FIXUP_BRANCH_CLOBBER );
+	: "r19", "r20", "r21", "r22", FIXUP_BRANCH_CLOBBER );

  	return 0;
  }
@@ -402,7 +402,7 @@
  	ASM_EXCEPTIONTABLE_ENTRY(4b,6b)
  	: "=r" (ret)
  	: "r" (val), "r" (regs->ior), "r" (regs->isr)
-	: "r19", "r20", "r21", "r22", "r1", FIXUP_BRANCH_CLOBBER );
+	: "r19", "r20", "r21", "r22", FIXUP_BRANCH_CLOBBER );
  #else
      {
  	unsigned long valh=(val>>32),vall=(val&0xffffffffl);
@@ -437,7 +437,7 @@
  	ASM_EXCEPTIONTABLE_ENTRY(5b,7b)
  	: "=r" (ret)
  	: "r" (valh), "r" (vall), "r" (regs->ior), "r" (regs->isr)
-	: "r19", "r20", "r21", "r1", FIXUP_BRANCH_CLOBBER );
+	: "r19", "r20", "r21", FIXUP_BRANCH_CLOBBER );
      }
  #endif

=== <> ===

What's your opinion?

Cheers,
	r.
