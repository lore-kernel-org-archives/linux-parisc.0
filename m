From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 3/5] Fix generic compat_siginfo_t on s390 and
	sparc64
Date: Sun, 8 Jan 2006 14:38:03 -0500
Message-ID: <20060108193803.GJ3782__25337.0000901215$1416623986$gmane$org@tachyon.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-kernel@vger.kernel.org,
 willy@parisc-linux.org,
 carlos@parisc-linux.org,
 schwidefsky@de.ibm.com,
 davem@davemloft.net,
 parisc-linux@lists.parisc-linux.org
To: akpm@osdl.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

From: Carlos O'Donell <carlos@parisc-linux.org>

Define types needed for generic compat_siginfo_t on s390 and sparc64.

Signed-off-by: Carlos O'Donell <carlos@parisc-linux.org>
Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 include/asm-s390/compat.h    |    3 +++
 include/asm-sparc64/compat.h |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

c5833cf4215cfbab87f83d32520251da5631355f
diff --git a/include/asm-s390/compat.h b/include/asm-s390/compat.h
index a007715..38b1165 100644
--- a/include/asm-s390/compat.h
+++ b/include/asm-s390/compat.h
@@ -15,6 +15,9 @@ typedef s32		compat_clock_t;
 typedef s32		compat_pid_t;
 typedef u16		__compat_uid_t;
 typedef u16		__compat_gid_t;
+/* Define for use in compat_siginfo_t */
+#undef __ARCH_SI_COMPAT_UID_T
+#define __ARCH_SI_COMPAT_UID_T __compat_uid32_t
 typedef u32		__compat_uid32_t;
 typedef u32		__compat_gid32_t;
 typedef u16		compat_mode_t;
diff --git a/include/asm-sparc64/compat.h b/include/asm-sparc64/compat.h
index c73935d..06fbfb8 100644
--- a/include/asm-sparc64/compat.h
+++ b/include/asm-sparc64/compat.h
@@ -14,6 +14,9 @@ typedef s32		compat_clock_t;
 typedef s32		compat_pid_t;
 typedef u16		__compat_uid_t;
 typedef u16		__compat_gid_t;
+/* Define for use in the compat_siginfo_t */
+#undef __ARCH_SI_COMPAT_UID_T
+#define __ARCH_SI_COMPAT_UID_T compat_uint_t
 typedef u32		__compat_uid32_t;
 typedef u32		__compat_gid32_t;
 typedef u16		compat_mode_t;
-- 
1.0.7

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
