From: Adrian Bunk <bunk@kernel.org>
Subject: [2.6 patch] binfmt_som.c: add MODULE_LICENSE
Date: Sun, 15 Jun 2008 19:13:16 +0300
Message-ID: <20080615161316.GA7865@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: kyle@mcmartin.ca, matthew@wil.cx, grundler@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch adds the missing MODULE_LICENSE("GPL").

Reported-by: Adrian Bunk <bunk@kernel.org>
Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
4cec562181f818f16f072b9a14ca7a0ce6c66417 diff --git a/fs/binfmt_som.c b/fs/binfmt_som.c
index fdc36bf..6d3bebb 100644
--- a/fs/binfmt_som.c
+++ b/fs/binfmt_som.c
@@ -308,3 +308,5 @@ static void __exit exit_som_binfmt(void)
 
 core_initcall(init_som_binfmt);
 module_exit(exit_som_binfmt);
+
+MODULE_LICENSE("GPL");
