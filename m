From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH] vfork() for parisc
Date: Sun, 23 Jul 2006 23:14:38 -0400
Message-ID: <20060724031438.GB5542@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: klibc@zytor.com
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

Implement "pid_t vfork(void)" for parisc.

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>
---

Ugh. vfork() me harder.

 Kbuild  |    2 +-
 vfork.S |   31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/usr/klibc/arch/parisc/Kbuild b/usr/klibc/arch/parisc/Kbuild
index d57a873..57ca5c2 100644
--- a/usr/klibc/arch/parisc/Kbuild
+++ b/usr/klibc/arch/parisc/Kbuild
@@ -2,7 +2,7 @@ #
 # klibc files for parisc
 #
 
-klib-y := setjmp.o syscall.o
+klib-y := setjmp.o syscall.o vfork.o
 
 always  := crt0.o
 targets := crt0.o
diff --git a/usr/klibc/arch/parisc/vfork.S b/usr/klibc/arch/parisc/vfork.S
new file mode 100644
index 0000000..97ebc8f
--- /dev/null
+++ b/usr/klibc/arch/parisc/vfork.S
@@ -0,0 +1,31 @@
+/*
+ * arch/parisc/vfork.S, "vfork() me harder. ugh." -- kyle
+ *
+ * %r20 contains the system call number, %rp contains whence we came,
+ * %rp is saved and restored across the syscall, thankfully.
+ *
+ */
+
+	.text
+	.align 64				; cache-width aligned
+	.globl	vfork
+	.type	vfork,@function
+vfork:
+	/* pid_t vfork(void) */
+	ble		0x100(%sr2, %r0)	; jump to gateway page
+	nop
+
+	ldi		-0x1000,%r19		; %r19 = -4096
+	sub		%r0,%ret0,%r22		; %r22 = -%ret0
+	cmpb,>>=,n	%r19,%ret0,1f		; if %ret0 >= -4096UL
+	ldi		-1,%ret0		; nullified on taken forward
+
+	/* store %r22 to errno... */
+	ldil		L%errno,%r1
+	ldo		R%errno(%r1),%r1
+	stw		%r22,0(%r1)
+1:
+	bv		%r0(%rp)		; jump back
+	nop
+
+	.size vfork,.-vfork
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
