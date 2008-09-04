From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: [PATCH] forgotten refcount on sysctl root table
Date: Thu, 4 Sep 2008 17:05:57 +0100
Message-ID: <20080904160557.GT28946@ZenIV.linux.org.uk>
References: <1220540651.3276.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220540651.3276.16.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

	We should've set refcount on the root sysctl table; otherwise we'll
blow up the first time we get down to zero dynamically registered sysctl
tables.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index fe47133..50ec088 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -159,6 +159,7 @@ static int proc_dointvec_taint(struct ctl_table *table, int write, struct file *
 static struct ctl_table root_table[];
 static struct ctl_table_root sysctl_table_root;
 static struct ctl_table_header root_table_header = {
+	.count = 1,
 	.ctl_table = root_table,
 	.ctl_entry = LIST_HEAD_INIT(sysctl_table_root.default_set.list),
 	.root = &sysctl_table_root,
