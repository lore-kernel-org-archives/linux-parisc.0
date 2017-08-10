From: Helge Deller <deller@gmx.de>
Subject: [PATCH] printk-formats.txt: Add examples for %pS and %pF
Date: Thu, 10 Aug 2017 19:35:33 +0200
Message-ID: <20170810173533.GA11600@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Sometimes people seems unclear when to use the %pS or %pF printk format.
Adding some examples may help to avoid such mistakes.

See for example commit 51d96dc2e2dc ("random: fix warning message on ia64 and
parisc") which fixed such a wrong format string.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
index 65ea591..be8c05b 100644
--- a/Documentation/printk-formats.txt
+++ b/Documentation/printk-formats.txt
@@ -73,6 +73,12 @@ actually function descriptors which must first be resolved. The ``F`` and
 ``f`` specifiers perform this resolution and then provide the same
 functionality as the ``S`` and ``s`` specifiers.
 
+Examples::
+
+	printk("Called from %pS.\n", __builtin_return_address(0));
+	printk("Called from %pS.\n", (void *)regs->ip);
+	printk("Called from %pF.\n", &gettimeofday);
+
 Kernel Pointers
 ===============
 
