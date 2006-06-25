From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 09/23] [PARISC] Remove unconditional #define
	PIC in syscall macros
Date: Sun, 25 Jun 2006 19:34:37 -0400
Message-ID: <11512784924145-git-send-email-kyle@parisc-linux.org>
References: <20060625233123.GC2837@athena.road.mcmartin.ca>
Reply-To: Kyle McMartin <kyle@parisc-linux.org>
Cc: Carlos O'Donell <carlos@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060625233123.GC2837@athena.road.mcmartin.ca>
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

Signed-off-by: Carlos O'Donell <carlos@parisc-linux.org>
Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 include/asm-parisc/unistd.h |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

32d4e0d51cefbbc81da5ce2dd2d7fb7a585ed385
diff --git a/include/asm-parisc/unistd.h b/include/asm-parisc/unistd.h
index 12b8672..27bcfad 100644
--- a/include/asm-parisc/unistd.h
+++ b/include/asm-parisc/unistd.h
@@ -797,11 +797,6 @@ #ifndef __ASSEMBLY__
 
 #define SYS_ify(syscall_name)   __NR_##syscall_name
 
-/* Assume all syscalls are done from PIC code just to be
- * safe. The worst case scenario is that you lose a register
- * and save/restore r19 across the syscall. */
-#define PIC
