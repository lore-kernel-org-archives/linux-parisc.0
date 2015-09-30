From: Luis Henriques <luis.henriques@canonical.com>
Subject: [PATCH 3.16.y-ckt 133/133] parisc: Filter out spurious interrupts in PA-RISC irq handler
Date: Wed, 30 Sep 2015 10:51:21 +0100
Message-ID: <1443606681-7124-134-git-send-email-luis.henriques@canonical.com>
References: <1443606681-7124-1-git-send-email-luis.henriques@canonical.com>
Cc: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
	Luis Henriques <luis.henriques@canonical.com>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	kernel-team@lists.ubuntu.com
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443606681-7124-1-git-send-email-luis.henriques@canonical.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

3.16.7-ckt18 -stable review patch.  If anyone has any objections, please let me know.

------------------

From: Helge Deller <deller@gmx.de>

commit b1b4e435e4ef7de77f07bf2a42c8380b960c2d44 upstream.

When detecting a serial port on newer PA-RISC machines (with iosapic) we have a
long way to go to find the right IRQ line, registering it, then registering the
serial port and the irq handler for the serial port. During this phase spurious
interrupts for the serial port may happen which then crashes the kernel because
the action handler might not have been set up yet.

So, basically it's a race condition between the serial port hardware and the
CPU which sets up the necessary fields in the irq sructs. The main reason for
this race is, that we unmask the serial port irqs too early without having set
up everything properly before (which isn't easily possible because we need the
IRQ number to register the serial ports).

This patch is a work-around for this problem. It adds checks to the CPU irq
handler to verify if the IRQ action field has been initialized already. If not,
we just skip this interrupt (which isn't critical for a serial port at bootup).
The real fix would probably involve rewriting all PA-RISC specific IRQ code
(for CPU, IOSAPIC, GSC and EISA) to use IRQ domains with proper parenting of
the irq chips and proper irq enabling along this line.

This bug has been in the PA-RISC port since the beginning, but the crashes
happened very rarely with currently used hardware.  But on the latest machine
which I bought (a C8000 workstation), which uses the fastest CPUs (4 x PA8900,
1GHz) and which has the largest possible L1 cache size (64MB each), the kernel
crashed at every boot because of this race. So, without this patch the machine
would currently be unuseable.

For the record, here is the flow logic:
1. serial_init_chip() in 8250_gsc.c calls iosapic_serial_irq().
2. iosapic_serial_irq() calls txn_alloc_irq() to find the irq.
3. iosapic_serial_irq() calls cpu_claim_irq() to register the CPU irq
4. cpu_claim_irq() unmasks the CPU irq (which it shouldn't!)
5. serial_init_chip() then registers the 8250 port.
Problems:
- In step 4 the CPU irq shouldn't have been registered yet, but after step 5
- If serial irq happens between 4 and 5 have finished, the kernel will crash

Cc: linux-parisc@vger.kernel.org
Signed-off-by: Helge Deller <deller@gmx.de>
[ luis: backported to 3.16: used Helge's backport ]
Signed-off-by: Luis Henriques <luis.henriques@canonical.com>
---
 arch/parisc/kernel/irq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index cfe056fe7f5c..34f06be569d9 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -507,8 +507,8 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 	struct pt_regs *old_regs;
 	unsigned long eirr_val;
 	int irq, cpu = smp_processor_id();
-#ifdef CONFIG_SMP
 	struct irq_desc *desc;
+#ifdef CONFIG_SMP
 	cpumask_t dest;
 #endif
 
@@ -521,8 +521,12 @@ void do_cpu_irq_mask(struct pt_regs *regs)
 		goto set_out;
 	irq = eirr_to_irq(eirr_val);
 
-#ifdef CONFIG_SMP
+	/* Filter out spurious interrupts, mostly from serial port at bootup */
 	desc = irq_to_desc(irq);
+	if (unlikely(!desc->action))
+		goto set_out;
+
+#ifdef CONFIG_SMP
 	cpumask_copy(&dest, desc->irq_data.affinity);
 	if (irqd_is_per_cpu(&desc->irq_data) &&
 	    !cpu_isset(smp_processor_id(), dest)) {
