From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 22/23] [PARISC] Fix PCREL22F relocation
	problem for most modules
Date: Sun, 25 Jun 2006 19:34:50 -0400
Message-ID: <11512784932734-git-send-email-kyle@parisc-linux.org>
References: <20060625233123.GC2837@athena.road.mcmartin.ca>
Reply-To: Kyle McMartin <kyle@parisc-linux.org>
Cc: James Bottomley <jejb@parisc-linux.org>
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

From: James Bottomley <jejb@parisc-linux.org>

The new problem, which has been affecting many more modules was that
our new ioremap really takes chunks out of our vmalloc space.  The net
result being that any two kernel vmalloc's now have to slot into the
chunked up space.  So the vmallocs for a modules init and core sectons
are no longer necessarily contiguous.  Unfortunately, the module loader
thinks that any internal symbol references should be satisfiable using the
jump instruction, which isn't true if the symbol is referenced from init
to core and vmalloc placed them a long way apart.

Fix this by introducing a new stub type for intra module inter sectional
jumps and using it.

And, by the way, before anyone complains, this won't fix modules that
fail to load because PCREF22F can't reach the stubs in the first place
(like ipv6.)

Signed-off-by: James Bottomley <jejb@parisc-linux.org>
Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 arch/parisc/kernel/module.c |   63 ++++++++++++++++++++++++++++++++++---------
 1 files changed, 50 insertions(+), 13 deletions(-)

78a01907452ac0dccd0ed38f9d25c6bee6b1cf95
diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index f27cfe4..aee3118 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -89,6 +89,12 @@ static inline int is_local(struct module
 	return is_init(me, loc) || is_core(me, loc);
 }
 
+static inline int is_local_section(struct module *me, void *loc, void *dot)
+{
+	return (is_init(me, loc) && is_init(me, dot)) ||
+		(is_core(me, loc) && is_core(me, dot));
+}
+
 
 #ifndef __LP64__
 struct got_entry {
@@ -364,8 +370,14 @@ static Elf_Addr get_fdesc(struct module 
 }
 #endif /* __LP64__ */
 
+enum elf_stub_type {
+	ELF_STUB_GOT,
+	ELF_STUB_MILLI,
+	ELF_STUB_DIRECT,
+};
+
 static Elf_Addr get_stub(struct module *me, unsigned long value, long addend,
-	int millicode, int init_section)
+	enum elf_stub_type stub_type, int init_section)
 {
 	unsigned long i;
 	struct stub_entry *stub;
@@ -396,7 +408,7 @@ #ifndef __LP64__
 	stub->insns[1] |= reassemble_17(rrsel(value, addend) / 4);
 
 #else
-/* for 64-bit we have two kinds of stubs:
+/* for 64-bit we have three kinds of stubs:
  * for normal function calls:
  * 	ldd 0(%dp),%dp
  * 	ldd 10(%dp), %r1
@@ -408,18 +420,23 @@ #else
  * 	ldo 0(%r1), %r1
  * 	ldd 10(%r1), %r1
  * 	bve,n (%r1)
+ *
+ * for direct branches (jumps between different section of the
+ * same module):
+ *	ldil 0, %r1
+ *	ldo 0(%r1), %r1
+ *	bve,n (%r1)
  */
-	if (!millicode)
-	{
+	switch (stub_type) {
+	case ELF_STUB_GOT:
 		stub->insns[0] = 0x537b0000;	/* ldd 0(%dp),%dp	*/
 		stub->insns[1] = 0x53610020;	/* ldd 10(%dp),%r1	*/
 		stub->insns[2] = 0xe820d000;	/* bve (%r1)		*/
 		stub->insns[3] = 0x537b0030;	/* ldd 18(%dp),%dp	*/
 
 		stub->insns[0] |= reassemble_14(get_got(me, value, addend) & 0x3fff);
-	}
-	else
-	{
+		break;
+	case ELF_STUB_MILLI:
 		stub->insns[0] = 0x20200000;	/* ldil 0,%r1		*/
 		stub->insns[1] = 0x34210000;	/* ldo 0(%r1), %r1	*/
 		stub->insns[2] = 0x50210020;	/* ldd 10(%r1),%r1	*/
@@ -427,7 +444,17 @@ #else
 
 		stub->insns[0] |= reassemble_21(lrsel(value, addend));
 		stub->insns[1] |= reassemble_14(rrsel(value, addend));
+		break;
+	case ELF_STUB_DIRECT:
+		stub->insns[0] = 0x20200000;    /* ldil 0,%r1           */
+		stub->insns[1] = 0x34210000;    /* ldo 0(%r1), %r1      */
+		stub->insns[2] = 0xe820d002;    /* bve,n (%r1)          */
+
+		stub->insns[0] |= reassemble_21(lrsel(value, addend));
+		stub->insns[1] |= reassemble_14(rrsel(value, addend));
+		break;
 	}
+
 #endif
 
 	return (Elf_Addr)stub;
@@ -539,14 +566,14 @@ #endif
 			break;
 		case R_PARISC_PCREL17F:
 			/* 17-bit PC relative address */
-			val = get_stub(me, val, addend, 0, is_init(me, loc));
+			val = get_stub(me, val, addend, ELF_STUB_GOT, is_init(me, loc));
 			val = (val - dot - 8)/4;
 			CHECK_RELOC(val, 17)
 			*loc = (*loc & ~0x1f1ffd) | reassemble_17(val);
 			break;
 		case R_PARISC_PCREL22F:
 			/* 22-bit PC relative address; only defined for pa20 */
-			val = get_stub(me, val, addend, 0, is_init(me, loc));
+			val = get_stub(me, val, addend, ELF_STUB_GOT, is_init(me, loc));
 			DEBUGP("STUB FOR %s loc %lx+%lx at %lx\n", 
 			       strtab + sym->st_name, (unsigned long)loc, addend, 
 			       val)
@@ -643,13 +670,23 @@ #endif
 			       strtab + sym->st_name,
 			       loc, val);
 			/* can we reach it locally? */
-			if(!is_local(me, (void *)val)) {
-				if (strncmp(strtab + sym->st_name, "$$", 2)
+			if(!is_local_section(me, (void *)val, (void *)dot)) {
+
+				if (is_local(me, (void *)val))
+					/* this is the case where the
+					 * symbol is local to the
+					 * module, but in a different
+					 * section, so stub the jump
+					 * in case it's more than 22
+					 * bits away */
+					val = get_stub(me, val, addend, ELF_STUB_DIRECT,
+						       is_init(me, loc));
+				else if (strncmp(strtab + sym->st_name, "$$", 2)
 				    == 0)
-					val = get_stub(me, val, addend, 1,
+					val = get_stub(me, val, addend, ELF_STUB_MILLI,
 						       is_init(me, loc));
 				else
-					val = get_stub(me, val, addend, 0,
+					val = get_stub(me, val, addend, ELF_STUB_GOT,
 						       is_init(me, loc));
 			}
 			DEBUGP("STUB FOR %s loc %lx, val %lx+%lx at %lx\n", 
-- 
1.3.3

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
