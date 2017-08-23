From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] printk-formats.txt: Add examples for %pS and %pF
Date: Wed, 23 Aug 2017 16:48:24 +0200
Message-ID: <20170823144824.GE27895@pathway.suse.cz>
References: <20170810173533.GA11600@ls3530.fritz.box>
 <20170811001521.GA520@jagdpanzerIV.localdomain>
 <47718712-9eb2-8ad7-965e-d0971d07e985@gmx.de>
 <20170815113625.GA2738@pathway.suse.cz>
 <d5fda170-e95b-024e-59ad-650b4db78ba6@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d5fda170-e95b-024e-59ad-650b4db78ba6@gmx.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue 2017-08-15 21:58:33, Helge Deller wrote:
> On 15.08.2017 13:36, Petr Mladek wrote:
> > Here is the updated patch with my proposed changes.
> > Feel free to update it:
> 
> Much better!
> Thanks a lot.
> 
> Maybe we should mention usage of __func__ with '%s' (see other thread).
> 
> And _RET_IP_ is worth mentioning beside __builtin_return_address(0) too,
> because it's used quite often wrongly.

Yup, it seems that all this causes confusion. I did not find a good
way to explain this in the text. I think that we need the examples
after all.

Here is an updated version:


>From 818511a3be494b76b8f5ba1c2c6bb38095a9c640 Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Tue, 15 Aug 2017 11:34:19 +0200
Subject: [PATCH] printk-formats.txt: Better describe the difference between
 %pS and %pF

Sometimes people seems unclear when to use the %pS or %pF printk format.
For example, see commit 51d96dc2e2dc ("random: fix warning message on ia64
and parisc") which fixed such a wrong format string.

The documentation should be more clear about the difference.
Also examples might help to avoid some typical mistakes.

Signed-off-by: Helge Deller <deller@gmx.de>
[pmladek@suse.com: Restructure the entire section]
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 Documentation/printk-formats.txt | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
index 65ea5915178b..d503080e5174 100644
--- a/Documentation/printk-formats.txt
+++ b/Documentation/printk-formats.txt
@@ -58,20 +58,31 @@ Symbols/Function Pointers
 	%ps	versatile_init
 	%pB	prev_fn_of_versatile_init+0x88/0x88
 
-For printing symbols and function pointers. The ``S`` and ``s`` specifiers
-result in the symbol name with (``S``) or without (``s``) offsets. Where
-this is used on a kernel without KALLSYMS - the symbol address is
-printed instead.
+The ``F`` and ``f`` specifiers are for printing function pointers,
+for example, f->func, &gettimeofday. They have the same result as
+``S`` and ``s`` specifiers. But they do an extra conversion on
+ia64, ppc64 and parisc64 architectures where the function pointers
+are actually function descriptors.
+
+The ``S`` and ``s`` specifiers can be used for printing symbols
+from direct addresses, for example, __builtin_return_address(0),
+(void *)regs->ip. They result in the symbol name with (``S``) or
+without (``s``) offsets. If KALLSYMS are disabled then the symbol
+address is printed instead.
 
 The ``B`` specifier results in the symbol name with offsets and should be
 used when printing stack backtraces. The specifier takes into
 consideration the effect of compiler optimisations which may occur
 when tail-call``s are used and marked with the noreturn GCC attribute.
 
-On ia64, ppc64 and parisc64 architectures function pointers are
-actually function descriptors which must first be resolved. The ``F`` and
-``f`` specifiers perform this resolution and then provide the same
-functionality as the ``S`` and ``s`` specifiers.
+Examples::
+
+	printk("Going to call: %pF\n", gettimeofday);
+	printk("Going to call: %pF\n", p->func);
+	printk("%s: called from %pS\n", __func__, _RET_IP_);
+	printk("%s: called from %pS\n", __func__, __builtin_return_address(0));
+	printk("Faulted at %pS\n", (void *)regs->ip);
+	printk(" %s%pB\n", reliable ? "" : "? ", (void *)*stack);
 
 Kernel Pointers
 ===============
-- 
1.8.5.6
