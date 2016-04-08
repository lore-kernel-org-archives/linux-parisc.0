From: "Helge Deller" <deller@gmx.de>
Subject: Aw: Re: kernel 4.6-rc unbootable due to module changes
Date: Fri, 8 Apr 2016 16:59:01 +0200
Message-ID: <trinity-2288a664-7ecc-47ba-9dbb-630a8f9060c7-1460127541349@3capp-gmx-bs27>
References: <alpine.LRH.2.02.1604051326470.14606@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1604051332280.25453@file01.intranet.prod.int.rdu2.redhat.com>
 <570409DA.1060508@gmx.de>
 <alpine.LRH.2.02.1604051612310.32758@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1604061014490.30369@file01.intranet.prod.int.rdu2.redhat.com>
 <57058332.8050204@gmx.de>, <5706E3A0.2020902@gmx.de>,
 <trinity-1ff986de-0345-446b-baa3-dce5d7ebc2cc-1460117169764@3capp-gmx-bs27>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary=kenitramv-9eac9b62-d9f0-4733-ab7f-bd1333d06bb3
Cc: "Mikulas Patocka" <mpatocka@redhat.com>,
	"John David Anglin" <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org
To: "Helge Deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-1ff986de-0345-446b-baa3-dce5d7ebc2cc-1460117169764@3capp-gmx-bs27>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--kenitramv-9eac9b62-d9f0-4733-ab7f-bd1333d06bb3
Content-Type: text/plain; charset=UTF-8

> > >> So, it seems that handling exceptions from modules never worked on 
> > >> pa-risc, it was just masked by the fact that exceptions from modules don't 
> > >> happen during normal use.
> > 
> > Sadly you seem to be right :-(
> > I did more testing with the test_user_copy module (with vanilla kernel 4.5 and without the relative extable support).
> 
> The attached patch fixes the exception handling for modules for me.
> This is realized by saving the %r27 register in the fault handler and restoring it in the exception path.
> With this patch the "test_user_copy" kernel module succeeds when loaded.
> Mikulas, can you try it with your testcases ?

Attached patch additionally adds support for resolving R_PARISC_PCREL32 relocations,
which fixes the 32bit extable change which was introduced with kernel 4.6-rc1.

With that I think we have all module issues resolved ?

Helge
--kenitramv-9eac9b62-d9f0-4733-ab7f-bd1333d06bb3
Content-Type: text/x-patch
Content-Disposition: attachment; filename=fixup3.patch

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index d4dd6e5..b370d61 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -79,6 +79,7 @@ struct exception_data {
 	unsigned long fault_ip;
 	unsigned long fault_space;
 	unsigned long fault_addr;
+	unsigned long fault_gp;
 };
 
 #define __get_user(x, ptr)                               \
diff --git a/arch/parisc/kernel/asm-offsets.c b/arch/parisc/kernel/asm-offsets.c
index d2f6257..137c91e 100644
--- a/arch/parisc/kernel/asm-offsets.c
+++ b/arch/parisc/kernel/asm-offsets.c
@@ -301,6 +301,7 @@ int main(void)
 	DEFINE(EXCDATA_IP, offsetof(struct exception_data, fault_ip));
 	DEFINE(EXCDATA_SPACE, offsetof(struct exception_data, fault_space));
 	DEFINE(EXCDATA_ADDR, offsetof(struct exception_data, fault_addr));
+	DEFINE(EXCDATA_GP, offsetof(struct exception_data, fault_gp));
 	BLANK();
 	DEFINE(ASM_PDC_RESULT_SIZE, NUM_PDC_RESULT * sizeof(unsigned long));
 	BLANK();
diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index b9d75d9..c54cf39 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -788,6 +788,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 			CHECK_RELOC(val, 22);
 			*loc = (*loc & ~0x3ff1ffd) | reassemble_22(val);
 			break;
+		case R_PARISC_PCREL32:
+			/* 32-bit PC relative address */
+			*loc = val - dot - 8 + addend;
+			break;
 		case R_PARISC_DIR64:
 			/* 64-bit effective address */
 			*loc64 = val + addend;
diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc_ksyms.c
index 568b2c6..3cad8aa 100644
--- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -47,11 +47,11 @@ EXPORT_SYMBOL(__cmpxchg_u64);
 EXPORT_SYMBOL(lclear_user);
 EXPORT_SYMBOL(lstrnlen_user);
 
-/* Global fixups */
-extern void fixup_get_user_skip_1(void);
-extern void fixup_get_user_skip_2(void);
-extern void fixup_put_user_skip_1(void);
-extern void fixup_put_user_skip_2(void);
+/* Global fixups - defined as int to avoid creation of function pointers */
+extern int fixup_get_user_skip_1;
+extern int fixup_get_user_skip_2;
+extern int fixup_put_user_skip_1;
+extern int fixup_put_user_skip_2;
 EXPORT_SYMBOL(fixup_get_user_skip_1);
 EXPORT_SYMBOL(fixup_get_user_skip_2);
 EXPORT_SYMBOL(fixup_put_user_skip_1);
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 16e0735..97d6b20 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -795,6 +795,9 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 
 	    if (fault_space == 0 && !faulthandler_disabled())
 	    {
+		/* Clean up and return if in exception table. */
+		if (fixup_exception(regs))
+			return;
 		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
 		parisc_terminate("Kernel Fault", regs, code, fault_address);
 	    }
diff --git a/arch/parisc/lib/fixup.S b/arch/parisc/lib/fixup.S
index 536ef66..1052b74 100644
--- a/arch/parisc/lib/fixup.S
+++ b/arch/parisc/lib/fixup.S
@@ -26,6 +26,7 @@
 
 #ifdef CONFIG_SMP
 	.macro  get_fault_ip t1 t2
+	loadgp
 	addil LT%__per_cpu_offset,%r27
 	LDREG RT%__per_cpu_offset(%r1),\t1
 	/* t2 = smp_processor_id() */
@@ -40,14 +41,19 @@
 	LDREG RT%exception_data(%r1),\t1
 	/* t1 = this_cpu_ptr(&exception_data) */
 	add,l \t1,\t2,\t1
+	/* %r27 = t1->fault_gp - restore gp */
+	LDREG EXCDATA_GP(\t1), %r27
 	/* t1 = t1->fault_ip */
 	LDREG EXCDATA_IP(\t1), \t1
 	.endm
 #else
 	.macro  get_fault_ip t1 t2
+	loadgp
 	/* t1 = this_cpu_ptr(&exception_data) */
 	addil LT%exception_data,%r27
 	LDREG RT%exception_data(%r1),\t2
+	/* %r27 = t2->fault_gp - restore gp */
+	LDREG EXCDATA_GP(\t2), %r27
 	/* t1 = t2->fault_ip */
 	LDREG EXCDATA_IP(\t2), \t1
 	.endm
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 26fac9c..7a6ecaa 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -147,6 +147,7 @@ int fixup_exception(struct pt_regs *regs)
 		d->fault_ip = regs->iaoq[0];
 		d->fault_space = regs->isr;
 		d->fault_addr = regs->ior;
+		d->fault_gp = regs->gr[27];
 
 		regs->iaoq[0] = (unsigned long)&fix->fixup + fix->fixup;
 		regs->iaoq[0] &= ~3;

--kenitramv-9eac9b62-d9f0-4733-ab7f-bd1333d06bb3--
