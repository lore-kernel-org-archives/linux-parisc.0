Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 782B848B2
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 19 Mar 2004 07:30:47 -0700 (MST)
Date: Fri, 19 Mar 2004 15:30:43 +0100
Message-ID: <40561EAF000035FA@ocpmta1.freegates.net>
In-Reply-To: <20040315063318.GC2384@tausq.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Spinlock patch, take 2
To: "Randolph Chung" <randolph@tausq.org>, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


> 
> Here's another version of my spinlock patch against 2.6.4. It optimizes
>spinlocks used for atomic operations by putting the atomic locks into a
>special section that is guaranteed to be 16-byte aligned, so no runtime
>alignment is needed. Build-tested against 2.6.4. Comments?
>
Ongoing to try to apply it against 2.6.[45] and encounter very early a pb
which seems to be solved by following patch:
--- include/asm-parisc/smp.h.orig	2004-01-28 08:24:41.000000000 +0100
+++ include/asm-parisc/smp.h	2004-03-19 11:34:04.078456992 +0100
@@ -54,7 +54,7 @@
 #define smp_processor_id()	(current_thread_info()->cpu)
 #define cpu_online(cpu) cpu_isset(cpu, cpu_online_map)
 
-#define cpu_possible_map	cpu_present_map
+#define cpu_possible_map	cpu_present_mask
 
 #endif /* CONFIG_SMP */
=========><=========

Is it correct?

But using c3k config and adding smp support to 2.6.5-rc1, I encounter this
ld pb:
  gcc -Wp,-MD,drivers/usb/core/.devices.o.d -nostdinc -iwithprefix include
-D__KERNEL__ -Iinclude  -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes
-Wno-trigraphs -fno-strict-aliasing -fno-common -pipe -mno-space-regs -mfast-indirect-calls
-mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000 -O2 -fomit-frame-pointer
    -DKBUILD_BASENAME=devices -DKBUILD_MODNAME=usbcore -c -o drivers/usb/core/devices.o
drivers/usb/core/devices.c
  ld   -r -o drivers/usb/core/usbcore.o drivers/usb/core/usb.o drivers/usb/core/hub.o
drivers/usb/core/hcd.o drivers/usb/core/urb.o drivers/usb/core/message.o
drivers/usb/core/config.o drivers/usb/core/file.o drivers/usb/core/buffer.o
drivers/usb/core/driverfs.o drivers/usb/core/hcd-pci.o drivers/usb/core/devio.o
drivers/usb/core/inode.o drivers/usb/core/devices.o
Inconsistency detected by ld.so: dynamic-link.h: 164: elf_get_dynamic_info:
Assertion `info[9]->d_un.d_val == sizeof (Elf32_Rela)' failed!
make[3]: *** [drivers/usb/core/usbcore.o] Error 127
make[2]: *** [drivers/usb/core] Error 2

Any idea? (the same kernel 2.6.5-rc1 + same patches but with a500 config
+smp compiles well :) )

Thanks in advance,
   Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
