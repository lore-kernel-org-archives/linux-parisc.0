From: Boaz Harrosh <bharrosh@panasas.com>
Subject: [PATCH 5/5] vfs: nfsctl.c unused nfsd #includes
Date: Tue, 24 Nov 2009 20:04:12 +0200
Message-ID: <4B0C201C.4040400@panasas.com>
References: <4B0C1EB7.50508@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: "J. Bruce Fields" <bfields@citi.umich.edu>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	sparclinux <sparclinux@vger.kernel.org>,
	linux-s
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933858AbZKXSQr@vger.kernel.org>
In-Reply-To: <4B0C1EB7.50508@panasas.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Only linux/nfsd/syscall.h is actually used. Remove the
other nfsd #includes, so they can be moved to source
directory.

Signed-off-by: Boaz Harrosh <bharrosh@panasas.com>
---
 fs/nfsctl.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/fs/nfsctl.c b/fs/nfsctl.c
index 8f9a205..d3854d9 100644
--- a/fs/nfsctl.c
+++ b/fs/nfsctl.c
@@ -7,8 +7,6 @@
 #include <linux/types.h>
 #include <linux/file.h>
 #include <linux/fs.h>
-#include <linux/sunrpc/svc.h>
-#include <linux/nfsd/nfsd.h>
 #include <linux/nfsd/syscall.h>
 #include <linux/cred.h>
 #include <linux/sched.h>
-- 
1.6.5.2
