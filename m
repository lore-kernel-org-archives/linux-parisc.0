From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] A smal chg proposal about: [PATCH] [PARISC] Allow
	nested interrupts
Date: Sun, 17 Sep 2006 18:09:44 +0000
Message-ID: <450D8F68.7090007@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello James,

Sorry to have read it so lately but I just figure out this:
- we can read in:
include/linux/bitops.h
--- snip ---
static inline unsigned fls_long(unsigned long l)
{
         if (sizeof(l) == 4)
                 return fls(l);
         return fls64(l);
}
--- snip ---

- otoh in your patch you wrote:
+static inline int eirr_to_irq(unsigned long eirr)
+{
+#ifdef CONFIG_64BIT
+       int bit = fls64(eirr);
+#else
+       int bit = fls(eirr);
+#endif
+       return (BITS_PER_LONG - bit) + TIMER_IRQ;
+}
+

so may be could it be simply writen:
	int bit = fls_long(eirr);

Hth,
	Joel

PS: I still have somewhere an optimized version for this stuff I will try to find it back ;-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
