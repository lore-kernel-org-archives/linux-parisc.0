From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix compat_semid64_ds struct
Date: Wed, 28 Oct 2015 23:17:29 +0100
Message-ID: <20151028221729.GA12985@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix struct compat_semid64_ds to match our version of semid64_ds from
asm/sembuf.h. Basically the compat version did not take the
big-endianess into account.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/compat.h b/arch/parisc/include/asm/compat.h
index 94710cf..0448a2c 100644
--- a/arch/parisc/include/asm/compat.h
+++ b/arch/parisc/include/asm/compat.h
@@ -206,10 +206,10 @@ struct compat_ipc64_perm {
 
 struct compat_semid64_ds {
 	struct compat_ipc64_perm sem_perm;
-	compat_time_t sem_otime;
 	unsigned int __unused1;
-	compat_time_t sem_ctime;
+	compat_time_t sem_otime;
 	unsigned int __unused2;
+	compat_time_t sem_ctime;
 	compat_ulong_t sem_nsems;
 	compat_ulong_t __unused3;
 	compat_ulong_t __unused4;
