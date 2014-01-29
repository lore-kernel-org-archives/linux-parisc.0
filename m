From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Ftrace broken on parisc
Date: Wed, 29 Jan 2014 20:59:44 +0100
Message-ID: <20140129205944.4f71ca1c@dellete>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi all,


It seems that the ftrace subsystem has not been maintained for a few
years.

So far I have the diff at the bottom that attempts to fix it bug there
is still an issue while linking :


arch/parisc/kernel/built-in.o: In function `return_to_handler':
(.text+0xb2a8): undefined reference to `ftrace_return_to_handler'
hppa64-linux-ld: arch/parisc/kernel/built-in.o(.text+0xllx): cannot
reach (null)
arch/parisc/kernel/built-in.o: In function `return_to_handler':
(.text+0xb2a8): relocation truncated to fit: R_PARISC_PCREL17F against
undefined symbol `ftrace_return_to_handler'
make: *** [vmlinux] Error 1

I'm not sure how this can be fixed, the problems comes from the
assembly in entry.S, it uses a 'b' to jump to ftrace_return_to_handler.
I guess 'be' needs to be used but not sure how that'd works with the
linker.

Moreover, there is probably more than this to be fixed.

For the background story, I'm trying to fix this to audit irq handlers
for my pata_sil680 issue.

Adding some printk for irq == 71 in handle_percpu_irq(), I see and odd
behavior. The printk at the end of the function is displayed a lot more
than the printk at the begining of the function. I know printk isn't
the best for irq handlers that's why I was investigating the ftrace way.

Any tip/help is very much welcome !

  Guy

---
diff --git a/arch/parisc/Kconfig.debug b/arch/parisc/Kconfig.debug
index bc989e5..6d23a1a 100644
--- a/arch/parisc/Kconfig.debug
+++ b/arch/parisc/Kconfig.debug
@@ -1,5 +1,8 @@
 menu "Kernel hacking"

+config TRACE_IRQFLAGS_SUPPORT
+       def_bool y
+
 source "lib/Kconfig.debug"

 config DEBUG_RODATA
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 5beb97b..8c9f757 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -156,7 +156,7 @@ void ftrace_function_trampoline(unsigned long
 parent, return;

        if (ftrace_trace_function != ftrace_stub) {
-               ftrace_trace_function(parent, self_addr);
+               ftrace_trace_function(parent, self_addr, NULL, NULL);
                return;
        }
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER

