From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Use BL macro instead of b instruction to branch to do_cpu_irq_mask
Date: Mon, 6 May 2013 20:20:59 -0400
Message-ID: <BLU0-SMTP83242D49F4F45C315C142F97BA0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-32-884319793"
Cc: Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-32-884319793
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

The b branch instruction only supports a 17-bit pc-relative offset.   
The BL macro provides for a 22-bit
call offset on PA 2.0 targets.  This reduces the chance that  
do_cpu_irq_mask will not be reachable.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
---


--Apple-Mail-32-884319793
Content-Disposition: attachment; filename="bl_do_cpu_irq_mask.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="bl_do_cpu_irq_mask.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index f33201b..bd7bec3 100644
@@ -972,14 +977,13 @@ intr_extint:
 	copy	%r29, %r26	/* arg0 is pt_regs */
 	copy	%r29, %r16	/* save pt_regs */
 
-	ldil	L%intr_return, %r2
--Apple-Mail-32-884319793--
