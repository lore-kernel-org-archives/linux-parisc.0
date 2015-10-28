From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix shmid64_ds to use __kernel_size_t
Date: Wed, 28 Oct 2015 23:21:08 +0100
Message-ID: <20151028222108.GA13001@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

size_t is either 32 or 64bit. Make struct shmid64_ds clean for 32- and
64-bit userspace (even if we do not have a 64-bit userspace yet).

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/shmbuf.h b/arch/parisc/include/uapi/asm/shmbuf.h
index 8496c38..d48f67d 100644
--- a/arch/parisc/include/uapi/asm/shmbuf.h
+++ b/arch/parisc/include/uapi/asm/shmbuf.h
@@ -30,7 +30,7 @@ struct shmid64_ds {
 #if __BITS_PER_LONG != 64
 	unsigned int		__pad4;
 #endif
-	size_t			shm_segsz;	/* size of segment (bytes) */
+	__kernel_size_t		shm_segsz;	/* size of segment (bytes) */
 	__kernel_pid_t		shm_cpid;	/* pid of creator */
 	__kernel_pid_t		shm_lpid;	/* pid of last operator */
 	unsigned int		shm_nattch;	/* no. of current attaches */
