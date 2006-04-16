From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] more whitespace rework and attempt to beautify
	inline asm stuff?
Date: Sun, 16 Apr 2006 20:37:43 +0000
Message-ID: <4442AB17.90602@tiscali.be>
References: <IXJXEQ$C47DD9AC94AAFC817D7A8379F72B1E8E@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------060503000105010703060408"
To: Parisc List <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IXJXEQ$C47DD9AC94AAFC817D7A8379F72B1E8E@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------060503000105010703060408
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

Well just stupid white space changes just for the look.

Just here attach a first draft.

Please let me know if some interest to continue ;-)

Thanks,
	Joel

--------------060503000105010703060408
Content-Type: text/plain;
 name="Beautify-asm.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Beautify-asm.diff"

--- ./arch/parisc/lib/memcpy.c.Orig	2006-04-10 09:24:31.000000000 +0200
+++ ./arch/parisc/lib/memcpy.c	2006-04-10 17:05:38.000000000 +0200
@@ -79,20 +79,24 @@
 #define get_user_space() (segment_eq(get_fs(), KERNEL_DS) ? 0 : mfsp(3))
 #define get_kernel_space() (0)
 
-#define MERGE(w0, sh_1, w1, sh_2)  ({					\
+#define MERGE(w0, sh_1, w1, sh_2)	({				\
 	unsigned int _r;						\
-	asm volatile (							\
-	"mtsar %3\n"							\
-	"shrpw %1, %2, %%sar, %0\n"					\
-	: "=r"(_r)							\
-	: "r"(w0), "r"(w1), "r"(sh_2)					\
+	__asm__ __volatile__ ("\n"					\
+	"	mtsar		%3\n"					\
+	"	shrpw		%1, %2,%%sar, %0"			\
+		: "=r"(_r)						\
+		: "r"(w0), "r"(w1), "r"(sh_2)				\
 	);								\
 	_r;								\
 })
 #define THRESHOLD	16
 
 #ifdef DEBUG_MEMCPY
-#define DPRINTF(fmt, args...) do { printk(KERN_DEBUG "%s:%d:%s ", __FILE__, __LINE__, __FUNCTION__ ); printk(KERN_DEBUG fmt, ##args ); } while (0)
+#define DPRINTF(fmt, args...) do {					\
+	printk(KERN_DEBUG "%s:%d:%s ",					\
+		__FILE__, __LINE__, __FUNCTION__ );			\
+	printk(KERN_DEBUG fmt, ##args );				\
+} while (0)
 #else
 #define DPRINTF(fmt, args...)
 #endif
@@ -103,69 +107,81 @@
 #define EXC_WORD ".dword"
 #endif
 
-#define def_load_ai_insn(_insn,_sz,_tt,_s,_a,_t,_e)	\
-	__asm__ __volatile__ (				\
-	"1:\t" #_insn ",ma " #_sz "(" _s ",%1), %0\n" 	\
-	"\t.section __ex_table,\"aw\"\n"		\
-	"\t" EXC_WORD "\t1b\n"				\
-	"\t" EXC_WORD "\t" #_e "\n"			\
-	"\t.previous\n"					\
-	: _tt(_t), "+r"(_a)				\
-	: 						\
-	: "r8")
-
-#define def_store_ai_insn(_insn,_sz,_tt,_s,_a,_t,_e) 	\
-	__asm__ __volatile__ (				\
-	"1:\t" #_insn ",ma %1, " #_sz "(" _s ",%0)\n" 	\
-	"\t.section __ex_table,\"aw\"\n"		\
-	"\t" EXC_WORD "\t1b\n"				\
-	"\t" EXC_WORD "\t" #_e "\n"			\
-	"\t.previous\n"					\
-	: "+r"(_a) 					\
-	: _tt(_t)					\
-	: "r8")
-
-#define ldbma(_s, _a, _t, _e) def_load_ai_insn(ldbs,1,"=r",_s,_a,_t,_e)
-#define stbma(_s, _t, _a, _e) def_store_ai_insn(stbs,1,"r",_s,_a,_t,_e)
-#define ldwma(_s, _a, _t, _e) def_load_ai_insn(ldw,4,"=r",_s,_a,_t,_e)
-#define stwma(_s, _t, _a, _e) def_store_ai_insn(stw,4,"r",_s,_a,_t,_e)
-#define flddma(_s, _a, _t, _e) def_load_ai_insn(fldd,8,"=f",_s,_a,_t,_e)
-#define fstdma(_s, _t, _a, _e) def_store_ai_insn(fstd,8,"f",_s,_a,_t,_e)
-
-#define def_load_insn(_insn,_tt,_s,_o,_a,_t,_e) 	\
-	__asm__ __volatile__ (				\
-	"1:\t" #_insn " " #_o "(" _s ",%1), %0\n"	\
-	"\t.section __ex_table,\"aw\"\n"		\
-	"\t" EXC_WORD "\t1b\n"				\
-	"\t" EXC_WORD "\t" #_e "\n"			\
-	"\t.previous\n"					\
-	: _tt(_t) 					\
-	: "r"(_a)					\
-	: "r8")
-
-#define def_store_insn(_insn,_tt,_s,_t,_o,_a,_e) 	\
-	__asm__ __volatile__ (				\
-	"1:\t" #_insn " %0, " #_o "(" _s ",%1)\n" 	\
-	"\t.section __ex_table,\"aw\"\n"		\
-	"\t" EXC_WORD "\t1b\n"				\
-	"\t" EXC_WORD "\t" #_e "\n"			\
-	"\t.previous\n"					\
-	: 						\
-	: _tt(_t), "r"(_a)				\
-	: "r8")
+#define def_load_ai_insn(_insn, _sz, _tt, _s, _a, _t, _e)		\
+	__asm__ __volatile__ ("\n"					\
+	"1:	" #_insn ",ma		" #_sz "(" _s ", %1), %0\n"	\
+	"	.section __ex_table,\"aw\"\n"				\
+	"	" EXC_WORD "	1b\n"					\
+	"	" EXC_WORD "	" #_e "\n"				\
+	"	.previous"						\
+		: _tt(_t), "+r"(_a)					\
+		: 							\
+		: "r8"							\
+	)
+
+#define def_store_ai_insn(_insn, _sz, _tt, _s, _a, _t, _e)		\
+	__asm__ __volatile__ ("\n"					\
+	"1:	" #_insn ",ma		%1, " #_sz "(" _s ", %0)\n" 	\
+	"	.section __ex_table,\"aw\"\n"				\
+	"	" EXC_WORD "	1b\n"					\
+	"	" EXC_WORD "	" #_e "\n"				\
+	"	.previous"						\
+		: "+r"(_a) 						\
+		: _tt(_t)						\
+		: "r8"							\
+	)
+
+#define ldbma(_s, _a, _t, _e) def_load_ai_insn(ldbs, 1, "=r", _s, _a, _t, _e)
+#define stbma(_s, _t, _a, _e) def_store_ai_insn(stbs, 1, "r", _s, _a, _t, _e)
+#define ldwma(_s, _a, _t, _e) def_load_ai_insn(ldw, 4, "=r", _s, _a, _t, _e)
+#define stwma(_s, _t, _a, _e) def_store_ai_insn(stw, 4, "r", _s, _a, _t, _e)
+#define flddma(_s, _a, _t, _e) def_load_ai_insn(fldd, 8, "=f", _s, _a, _t, _e)
+#define fstdma(_s, _t, _a, _e) def_store_ai_insn(fstd, 8, "f", _s, _a, _t, _e)
+
+#define def_load_insn(_insn, _tt, _s, _o, _a, _t, _e) 			\
+	__asm__ __volatile__ ("\n"					\
+	"1:	" #_insn "		" #_o "(" _s ", %1), %0\n"	\
+	"	.section __ex_table,\"aw\"\n"				\
+	"	" EXC_WORD "	1b\n"					\
+	"	" EXC_WORD "	" #_e "\n"				\
+	"	.previous"						\
+		: _tt(_t) 						\
+		: "r"(_a)						\
+		: "r8"							\
+	)
+
+#define def_store_insn(_insn, _tt, _s, _t, _o, _a, _e)			\
+	__asm__ __volatile__ ("\n"					\
+	"1:	" #_insn "		%0, " #_o "(" _s ", %1)\n"	\
+	"	.section __ex_table,\"aw\"\n"				\
+	"	" EXC_WORD "	1b\n"					\
+	"	" EXC_WORD "	" #_e "\n"				\
+	"	.previous"						\
+		: 							\
+		: _tt(_t), "r"(_a)					\
+		: "r8"							\
+	)
 
-#define ldw(_s,_o,_a,_t,_e)	def_load_insn(ldw,"=r",_s,_o,_a,_t,_e)
-#define stw(_s,_t,_o,_a,_e) 	def_store_insn(stw,"r",_s,_t,_o,_a,_e)
+#define ldw(_s, _o, _a, _t, _e)	def_load_insn(ldw, "=r", _s, _o, _a, _t, _e)
+#define stw(_s, _t, _o, _a, _e)	def_store_insn(stw, "r", _s, _t, _o, _a, _e)
 
 #ifdef  CONFIG_PREFETCH
 extern inline void prefetch_src(const void *addr)
 {
-	__asm__("ldw 0(" s_space ",%0), %%r0" : : "r" (addr));
+	__asm__ ("\n"
+	"	ldw		0(" s_space ", %0), %%r0"
+		:
+		: "r" (addr)
+	);
 }
 
 extern inline void prefetch_dst(const void *addr)
 {
-	__asm__("ldd 0(" d_space ",%0), %%r0" : : "r" (addr));
+	__asm__ ("\n"
+	"	ldd		0(" d_space ", %0), %%r0"
+		:
+		: "r" (addr)
+	);
 }
 #else
 #define prefetch_src(addr)
@@ -374,7 +390,7 @@
 
 word_copy:
 	while (len >= 8*sizeof(unsigned int)) {
-		register unsigned int r1,r2,r3,r4,r5,r6,r7,r8;
+		register unsigned int r1, r2, r3, r4, r5, r6, r7, r8;
 		/* prefetch_src((char *)pws + L1_CACHE_BYTES); */
 		ldwma(s_space, pws, r1, pmc_load_exc);
 		ldwma(s_space, pws, r2, pmc_load_exc);
@@ -397,7 +413,7 @@
 	}
 
 	while (len >= 4*sizeof(unsigned int)) {
-		register unsigned int r1,r2,r3,r4;
+		register unsigned int r1, r2, r3, r4;
 		ldwma(s_space, pws, r1, pmc_load_exc);
 		ldwma(s_space, pws, r2, pmc_load_exc);
 		ldwma(s_space, pws, r3, pmc_load_exc);
--- ./include/asm-parisc/system.h.Orig	2006-04-07 18:05:12.000000000 +0200
+++ ./include/asm-parisc/system.h	2006-04-13 10:44:19.000000000 +0200
@@ -45,8 +45,8 @@
 
 extern struct task_struct *_switch_to(struct task_struct *, struct task_struct *);
 
-#define switch_to(prev, next, last) do {			\
-	(last) = _switch_to(prev, next);			\
+#define switch_to(prev, next, last) do {		\
+	(last) = _switch_to(prev, next);		\
 } while(0)
 
 /*
@@ -61,35 +61,65 @@
 
 
 /* interrupt control */
-#define local_save_flags(x)	__asm__ __volatile__("ssm 0, %0" : "=r" (x) : : "memory")
-#define local_irq_disable()	__asm__ __volatile__("rsm %0,%%r0\n" : : "i" (PSW_I) : "memory" )
-#define local_irq_enable()	__asm__ __volatile__("ssm %0,%%r0\n" : : "i" (PSW_I) : "memory" )
-
-#define local_irq_save(x) \
-	__asm__ __volatile__("rsm %1,%0" : "=r" (x) :"i" (PSW_I) : "memory" )
-#define local_irq_restore(x) \
-	__asm__ __volatile__("mtsm %0" : : "r" (x) : "memory" )
-
-#define irqs_disabled()			\
-({					\
-	unsigned long flags;		\
-	local_save_flags(flags);	\
-	(flags & PSW_I) == 0;		\
+#define local_save_flags(x)				\
+	__asm__ __volatile__ ("\n"			\
+	"	ssm		0, %0"			\
+		: "=r" (x)				\
+		: /* no inputs */			\
+		: "memory"				\
+	)
+#define local_irq_disable()				\
+	__asm__ __volatile__ ("\n"			\
+	"	rsm		%0, %%r0"		\
+		: /* no outputs */			\
+		: "i" (PSW_I)				\
+		: "memory"				\
+	)
+#define local_irq_enable()				\
+	__asm__ __volatile__ ("\n"			\
+	"	ssm		%0, %%r0"		\
+		: /* no outputs */			\
+		: "i" (PSW_I)				\
+		: "memory"				\
+	)
+
+#define local_irq_save(x)				\
+	__asm__ __volatile__ ("\n"			\
+	"	rsm		%1, %0"			\
+		: "=r" (x)				\
+		: "i" (PSW_I)				\
+		: "memory"				\
+	)
+#define local_irq_restore(x)				\
+	__asm__ __volatile__ ("\n"			\
+	"	mtsm		%0"			\
+		: /* no outputs */			\
+		: "r" (x)				\
+		: "memory"				\
+	)
+
+#define irqs_disabled()	({				\
+	unsigned long flags;				\
+	local_save_flags(flags);			\
+	(flags & PSW_I) == 0;				\
 })
 
-#define mfctl(reg)	({		\
-	unsigned long cr;		\
-	__asm__ __volatile__(		\
-		"mfctl " #reg ",%0" :	\
-		 "=r" (cr)		\
-	);				\
-	cr;				\
+#define mfctl(reg)	({				\
+	unsigned long cr;				\
+	__asm__ __volatile__ ("\n"			\
+	"	mfctl		" #reg ", %0"		\
+		: "=r" (cr)				\
+	);						\
+	cr;						\
 })
 
-#define mtctl(gr, cr) \
-	__asm__ __volatile__("mtctl %0,%1" \
-		: /* no outputs */ \
-		: "r" (gr), "i" (cr) : "memory")
+#define mtctl(gr, cr)					\
+	__asm__ __volatile__ ("\n"			\
+	"	mtctl		%0, %1"			\
+		: /* no outputs */			\
+		: "r" (gr), "i" (cr)			\
+		: "memory"				\
+	)
 
 /* these are here to de-mystefy the calling code, and to provide hooks */
 /* which I needed for debugging EIEM problems -PB */
@@ -99,19 +129,22 @@
 	mtctl(val, 15);
 }
 
-#define mfsp(reg)	({		\
-	unsigned long cr;		\
-	__asm__ __volatile__(		\
-		"mfsp " #reg ",%0" :	\
-		 "=r" (cr)		\
-	);				\
-	cr;				\
+#define mfsp(reg)	({				\
+	unsigned long cr;				\
+	__asm__ __volatile__ ("\n"			\
+	"	mfsp		" #reg ", %0"		\
+		: "=r" (cr)				\
+	);						\
+	cr;						\
 })
 
-#define mtsp(gr, cr) \
-	__asm__ __volatile__("mtsp %0,%1" \
-		: /* no outputs */ \
-		: "r" (gr), "i" (cr) : "memory")
+#define mtsp(gr, cr)					\
+	__asm__ __volatile__ ("\n"			\
+	"	mtsp		%0, %1"			\
+		: /* no outputs */			\
+		: "r" (gr), "i" (cr)			\
+		: "memory"				\
+	)
 
 
 /*
@@ -134,12 +167,12 @@
 ** The __asm__ op below simple prevents gcc/ld from reordering
 ** instructions across the mb() "call".
 */
-#define mb()		__asm__ __volatile__("":::"memory")	/* barrier() */
-#define rmb()		mb()
-#define wmb()		mb()
-#define smp_mb()	mb()
-#define smp_rmb()	mb()
-#define smp_wmb()	mb()
+#define mb()		__asm__ __volatile__ ("":::"memory")	/* barrier() */
+#define rmb()				mb()
+#define wmb()				mb()
+#define smp_mb()			mb()
+#define smp_rmb()			mb()
+#define smp_wmb()			mb()
 #define smp_read_barrier_depends()	do { } while(0)
 #define read_barrier_depends()		do { } while(0)
 
@@ -179,10 +212,14 @@
 #endif /*!CONFIG_PA20*/
 
 /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
-#define __ldcw(a) ({ \
-	unsigned __ret; \
-	__asm__ __volatile__(LDCW " 0(%1),%0" : "=r" (__ret) : "r" (a)); \
-	__ret; \
+#define __ldcw(a)	({				\
+	unsigned __ret;					\
+	__asm__ __volatile__ ("\n"			\
+	"	" LDCW "		0(%1), %0"	\
+		: "=r" (__ret)				\
+		: "r" (a)				\
+	);						\
+	__ret;						\
 })
 
 #ifdef CONFIG_SMP
--- ./include/asm-parisc/bitops.h.Orig	2006-04-10 11:30:36.000000000 +0200
+++ ./include/asm-parisc/bitops.h	2006-04-10 18:10:06.000000000 +0200
@@ -129,30 +129,31 @@
 {
 	unsigned long ret;
 
-	__asm__(
+	__asm__ ("\n"
 #ifdef __LP64__
-		" ldi       63,%1\n"
-		" extrd,u,*<>  %0,63,32,%%r0\n"
-		" extrd,u,*TR  %0,31,32,%0\n"	/* move top 32-bits down */
-		" addi    -32,%1,%1\n"
+	"	ldi		63, %1\n"
+	"	extrd,u,*<>	%0, 63,32, %%r0\n"
+	"	extrd,u,*TR	%0, 31,32, %0\n"	/* move top 32-bits down */
+	"	addi		-32, %1, %1\n"
 #else
-		" ldi       31,%1\n"
+	"	ldi		31, %1\n"
 #endif
-		" extru,<>  %0,31,16,%%r0\n"
-		" extru,TR  %0,15,16,%0\n"	/* xxxx0000 -> 0000xxxx */
-		" addi    -16,%1,%1\n"
-		" extru,<>  %0,31,8,%%r0\n"
-		" extru,TR  %0,23,8,%0\n"	/* 0000xx00 -> 000000xx */
-		" addi    -8,%1,%1\n"
-		" extru,<>  %0,31,4,%%r0\n"
-		" extru,TR  %0,27,4,%0\n"	/* 000000x0 -> 0000000x */
-		" addi    -4,%1,%1\n"
-		" extru,<>  %0,31,2,%%r0\n"
-		" extru,TR  %0,29,2,%0\n"	/* 0000000y, 1100b -> 0011b */
-		" addi    -2,%1,%1\n"
-		" extru,=  %0,31,1,%%r0\n"	/* check last bit */
-		" addi    -1,%1,%1\n"
-			: "+r" (x), "=r" (ret) );
+	"	extru,<>	%0, 31,16, %%r0\n"
+	"	extru,TR	%0, 15,16, %0\n"	/* xxxx0000 -> 0000xxxx */
+	"	addi		-16, %1, %1\n"
+	"	extru,<>	%0, 31,8, %%r0\n"
+	"	extru,TR	%0, 23,8, %0\n"		/* 0000xx00 -> 000000xx */
+	"	addi		-8, %1, %1\n"
+	"	extru,<>	%0, 31,4, %%r0\n"
+	"	extru,TR	%0, 27,4, %0\n"		/* 000000x0 -> 0000000x */
+	"	addi		-4, %1, %1\n"
+	"	extru,<>	%0, 31,2, %%r0\n"
+	"	extru,TR	%0, 29,2, %0\n"		/* 0000000y, 1100b -> 0011b */
+	"	addi		-2, %1, %1\n"
+	"	extru,=		%0, 31,1, %%r0\n"	/* check last bit */
+	"	addi		-1, %1, %1"
+		: "+r" (x), "=r" (ret)
+	);
 	return ret;
 }
 
@@ -179,24 +180,24 @@
 	if (!x)
 		return 0;
 
-	__asm__(
-	"	ldi		1,%1\n"
-	"	extru,<>	%0,15,16,%%r0\n"
-	"	zdep,TR		%0,15,16,%0\n"		/* xxxx0000 */
-	"	addi		16,%1,%1\n"
-	"	extru,<>	%0,7,8,%%r0\n"
-	"	zdep,TR		%0,23,24,%0\n"		/* xx000000 */
-	"	addi		8,%1,%1\n"
-	"	extru,<>	%0,3,4,%%r0\n"
-	"	zdep,TR		%0,27,28,%0\n"		/* x0000000 */
-	"	addi		4,%1,%1\n"
-	"	extru,<>	%0,1,2,%%r0\n"
-	"	zdep,TR		%0,29,30,%0\n"		/* y0000000 (y&3 = 0) */
-	"	addi		2,%1,%1\n"
-	"	extru,=		%0,0,1,%%r0\n"
-	"	addi		1,%1,%1\n"		/* if y & 8, add 1 */
-		: "+r" (x), "=r" (ret) );
-
+	__asm__ ("\n"
+	"	ldi		1, %1\n"
+	"	extru,<>	%0, 15,16, %%r0\n"
+	"	zdep,TR		%0, 15,16, %0\n"		/* xxxx0000 */
+	"	addi		16, %1, %1\n"
+	"	extru,<>	%0, 7,8, %%r0\n"
+	"	zdep,TR		%0, 23,24, %0\n"		/* xx000000 */
+	"	addi		8, %1, %1\n"
+	"	extru,<>	%0, 3,4, %%r0\n"
+	"	zdep,TR		%0, 27,28, %0\n"		/* x0000000 */
+	"	addi		4, %1, %1\n"
+	"	extru,<>	%0, 1,2, %%r0\n"
+	"	zdep,TR		%0, 29,30, %0\n"		/* y0000000 (y&3 = 0) */
+	"	addi		2, %1, %1\n"
+	"	extru,=		%0, 0,1, %%r0\n"
+	"	addi		1, %1, %1"			/* if y & 8, add 1 */
+		: "+r" (x), "=r" (ret)
+	);
 	return ret;
 }
 
@@ -215,9 +216,9 @@
 /* '3' is bits per byte */
 #define LE_BYTE_ADDR ((sizeof(unsigned long) - 1) << 3)
 
-#define ext2_set_bit_atomic(l,nr,addr) \
+#define ext2_set_bit_atomic(l, nr, addr) \
 		test_and_set_bit((nr)   ^ LE_BYTE_ADDR, (unsigned long *)addr)
-#define ext2_clear_bit_atomic(l,nr,addr) \
+#define ext2_clear_bit_atomic(l, nr, addr) \
 		test_and_clear_bit( (nr) ^ LE_BYTE_ADDR, (unsigned long *)addr)
 
 #endif	/* __KERNEL__ */
--- ./include/asm-parisc/cache.h.Orig	2006-04-10 11:54:04.000000000 +0200
+++ ./include/asm-parisc/cache.h	2006-04-10 18:11:23.000000000 +0200
@@ -65,9 +65,24 @@
 extern int icache_stride;
 extern struct pdc_cache_info cache_info;
 
-#define pdtlb(addr)         asm volatile("pdtlb 0(%%sr1,%0)" : : "r" (addr));
-#define pitlb(addr)         asm volatile("pitlb 0(%%sr1,%0)" : : "r" (addr));
-#define pdtlb_kernel(addr)  asm volatile("pdtlb 0(%0)" : : "r" (addr));
+#define pdtlb(addr)					\
+	__asm__ __volatile__ ("\n"			\
+	"	pdtlb		0(%%sr1, %0)"		\
+		:					\
+		: "r" (addr)				\
+	)
+#define pitlb(addr)					\
+	__asm__ __volatile__ ("\n"			\
+	"	pitlb		0(%%sr1, %0)"		\
+		:					\
+		: "r" (addr)				\
+	)
+#define pdtlb_kernel(addr)				\
+	__asm__ __volatile__ ("\n"			\
+	"	pdtlb		0(%0)"			\
+		:					\
+		: "r" (addr)				\
+	)
 
 #endif /* ! __ASSEMBLY__ */
 
--- ./include/asm-parisc/cacheflush.h.Orig	2006-04-10 12:16:54.000000000 +0200
+++ ./include/asm-parisc/cacheflush.h	2006-04-10 17:39:04.000000000 +0200
@@ -16,7 +16,7 @@
 #define flush_cache_mm(mm) flush_cache_all_local()
 #endif
 
-#define flush_kernel_dcache_range(start,size) \
+#define flush_kernel_dcache_range(start, size) \
 	flush_kernel_dcache_range_asm((start), (start)+(size));
 
 extern void flush_cache_all_local(void);
@@ -41,7 +41,7 @@
 flush_user_dcache_range(unsigned long start, unsigned long end)
 {
 	if ((end - start) < parisc_cache_flush_threshold)
-		flush_user_dcache_range_asm(start,end);
+		flush_user_dcache_range_asm(start, end);
 	else
 		flush_data_cache();
 }
@@ -50,7 +50,7 @@
 flush_user_icache_range(unsigned long start, unsigned long end)
 {
 	if ((end - start) < parisc_cache_flush_threshold)
-		flush_user_icache_range_asm(start,end);
+		flush_user_icache_range_asm(start, end);
 	else
 		flush_instruction_cache();
 }
@@ -62,21 +62,26 @@
 #define flush_dcache_mmap_unlock(mapping) \
 	write_unlock_irq(&(mapping)->tree_lock)
 
-#define flush_icache_page(vma,page)	do { flush_kernel_dcache_page(page); flush_kernel_icache_page(page_address(page)); } while (0)
+#define flush_icache_page(vma, page)	do {				\
+	flush_kernel_dcache_page(page);					\
+	flush_kernel_icache_page(page_address(page));			\
+} while (0)
 
-#define flush_icache_range(s,e)		do { flush_kernel_dcache_range_asm(s,e); flush_kernel_icache_range_asm(s,e); } while (0)
+#define flush_icache_range(s, e)	do {				\
+	flush_kernel_dcache_range_asm(s, e);				\
+	flush_kernel_icache_range_asm(s, e);				\
+} while (0)
 
-#define copy_to_user_page(vma, page, vaddr, dst, src, len) \
-do { \
-	flush_cache_page(vma, vaddr, page_to_pfn(page)); \
-	memcpy(dst, src, len); \
-	flush_kernel_dcache_range_asm((unsigned long)dst, (unsigned long)dst + len); \
+#define copy_to_user_page(vma, page, vaddr, dst, src, len)	do {	\
+	flush_cache_page(vma, vaddr, page_to_pfn(page));		\
+	memcpy(dst, src, len);						\
+	flush_kernel_dcache_range_asm((unsigned long)dst,		\
+					(unsigned long)dst + len);	\
 } while (0)
 
-#define copy_from_user_page(vma, page, vaddr, dst, src, len) \
-do { \
-	flush_cache_page(vma, vaddr, page_to_pfn(page)); \
-	memcpy(dst, src, len); \
+#define copy_from_user_page(vma, page, vaddr, dst, src, len)	do {	\
+	flush_cache_page(vma, vaddr, page_to_pfn(page));		\
+	memcpy(dst, src, len);						\
 } while (0)
 
 static inline void flush_cache_range(struct vm_area_struct *vma,
@@ -91,8 +96,8 @@
 
 	sr3 = mfsp(3);
 	if (vma->vm_mm->context == sr3) {
-		flush_user_dcache_range(start,end);
-		flush_user_icache_range(start,end);
+		flush_user_dcache_range(start, end);
+		flush_user_icache_range(start, end);
 	} else {
 		flush_cache_all();
 	}
--- ./include/asm-parisc/byteorder.h.Orig	2006-04-10 12:23:08.000000000 +0200
+++ ./include/asm-parisc/byteorder.h	2006-04-10 18:13:30.000000000 +0200
@@ -8,31 +8,37 @@
 
 static __inline__ __attribute_const__ __u16 ___arch__swab16(__u16 x)
 {
-	__asm__("dep %0, 15, 8, %0\n\t"		/* deposit 00ab -> 0bab */
-		"shd %%r0, %0, 8, %0"		/* shift 000000ab -> 00ba */
+	__asm__ ("\n"
+	"	dep		%0, 15,8, %0\n"		/* deposit 00ab -> 0bab */
+	"	shd		%%r0, %0,8, %0"		/* shift 000000ab -> 00ba */
 		: "=r" (x)
-		: "0" (x));
+		: "0" (x)
+	);
 	return x;
 }
 
 static __inline__ __attribute_const__ __u32 ___arch__swab24(__u32 x)
 {
-	__asm__("shd %0, %0, 8, %0\n\t"		/* shift xabcxabc -> cxab */
-		"dep %0, 15, 8, %0\n\t"		/* deposit cxab -> cbab */
-		"shd %%r0, %0, 8, %0"		/* shift 0000cbab -> 0cba */
+	__asm__ ("\n"
+	"	shd 		%0, %0,8, %0\n"		/* shift xabcxabc -> cxab */
+	"	dep		%0, 15,8, %0\n"		/* deposit cxab -> cbab */
+	"	shd		%%r0, %0,8, %0"		/* shift 0000cbab -> 0cba */
 		: "=r" (x)
-		: "0" (x));
+		: "0" (x)
+	);
 	return x;
 }
 
 static __inline__ __attribute_const__ __u32 ___arch__swab32(__u32 x)
 {
 	unsigned int temp;
-	__asm__("shd %0, %0, 16, %1\n\t"	/* shift abcdabcd -> cdab */
-		"dep %1, 15, 8, %1\n\t"		/* deposit cdab -> cbab */
-		"shd %0, %1, 8, %0"		/* shift abcdcbab -> dcba */
+	__asm__ ("\n"
+	"	shd		%0, %0,16, %1\n"	/* shift abcdabcd -> cdab */
+	"	dep		%1, 15,8, %1\n"		/* deposit cdab -> cbab */
+	"	shd		%0, %1,8, %0"		/* shift abcdcbab -> dcba */
 		: "=r" (x), "=&r" (temp)
-		: "0" (x));
+		: "0" (x)
+	);
 	return x;
 }
 
@@ -50,12 +56,14 @@
 */
 static __inline__ __attribute_const__ __u64 ___arch__swab64(__u64 x) {
 	__u64 temp;
-	__asm__("permh,3210 %0, %0\n\t"
-		"hshl %0, 8, %1\n\t"
-		"hshr,u %0, 8, %0\n\t"
-		"or %1, %0, %0"
+	__asm__ ("\n"
+	"	permh,3210	%0, %0\n"
+	"	hshl		%0, 8, %1\n"
+	"	hshr,u		%0, 8, %0\n"
+	"	or		%1, %0, %0"
 		: "=r" (x), "=&r" (temp)
-		: "0" (x));
+		: "0" (x)
+	);
 	return x;
 }
 #define __arch__swab64(x) ___arch__swab64(x)
--- ./include/asm-parisc/checksum.h.Orig	2006-04-10 14:30:21.000000000 +0200
+++ ./include/asm-parisc/checksum.h	2006-04-10 18:17:59.000000000 +0200
@@ -44,31 +44,31 @@
 	unsigned int sum;
 
 
-	__asm__ __volatile__ (
-"	ldws,ma		4(%1), %0\n"
-"	addib,<=	-4, %2, 2f\n"
-"\n"
-"	ldws		4(%1), %%r20\n"
-"	ldws		8(%1), %%r21\n"
-"	add		%0, %%r20, %0\n"
-"	ldws,ma		12(%1), %%r19\n"
-"	addc		%0, %%r21, %0\n"
-"	addc		%0, %%r19, %0\n"
-"1:	ldws,ma		4(%1), %%r19\n"
-"	addib,<		0, %2, 1b\n"
-"	addc		%0, %%r19, %0\n"
-"\n"
-"	extru		%0, 31, 16, %%r20\n"
-"	extru		%0, 15, 16, %%r21\n"
-"	addc		%%r20, %%r21, %0\n"
-"	extru		%0, 15, 16, %%r21\n"
-"	add		%0, %%r21, %0\n"
-"	subi		-1, %0, %0\n"
-"2:\n"
-	: "=r" (sum), "=r" (iph), "=r" (ihl)
-	: "1" (iph), "2" (ihl)
-	: "r19", "r20", "r21" );
-
+	__asm__ __volatile__ ("\n"
+	"	ldws,ma		4(%1), %0\n"
+	"	addib,<=	-4, %2, 2f\n"
+	"\n"
+	"	ldws		4(%1), %%r20\n"
+	"	ldws		8(%1), %%r21\n"
+	"	add		%0, %%r20, %0\n"
+	"	ldws,ma		12(%1), %%r19\n"
+	"	addc		%0, %%r21, %0\n"
+	"	addc		%0, %%r19, %0\n"
+	"1:	ldws,ma		4(%1), %%r19\n"
+	"	addib,<		0, %2, 1b\n"
+	"	addc		%0, %%r19, %0\n"
+	"\n"
+	"	extru		%0, 31,16, %%r20\n"
+	"	extru		%0, 15,16, %%r21\n"
+	"	addc		%%r20, %%r21, %0\n"
+	"	extru		%0, 15,16, %%r21\n"
+	"	add		%0, %%r21, %0\n"
+	"	subi		-1, %0, %0\n"
+	"2:"
+		: "=r" (sum), "=r" (iph), "=r" (ihl)
+		: "1" (iph), "2" (ihl)
+		: "r19", "r20", "r21"
+	);
 	return(sum);
 }
 
@@ -91,13 +91,14 @@
 					       unsigned short proto,
 					       unsigned int sum) 
 {
-	__asm__(
-	"	add  %1, %0, %0\n"
-	"	addc %2, %0, %0\n"
-	"	addc %3, %0, %0\n"
-	"	addc %%r0, %0, %0\n"
+	__asm__ ("\n"
+	"	add		%1, %0, %0\n"
+	"	addc		%2, %0, %0\n"
+	"	addc		%3, %0, %0\n"
+	"	addc		%%r0, %0, %0"
 		: "=r" (sum)
-		: "r" (daddr), "r"(saddr), "r"((proto<<16)+len), "0"(sum));
+		: "r" (daddr), "r"(saddr), "r"((proto<<16)+len), "0"(sum)
+	);
     return sum;
 }
 
@@ -130,7 +131,7 @@
 						     unsigned short proto,
 						     unsigned int sum) 
 {
-	__asm__ __volatile__ (
+	__asm__ __volatile__ ("\n"
 
 #if BITS_PER_LONG > 32
 
@@ -140,20 +141,20 @@
 	** Try to keep 4 registers with "live" values ahead of the ALU.
 	*/
 
-"	ldd,ma		8(%1), %%r19\n"	/* get 1st saddr word */
-"	ldd,ma		8(%2), %%r20\n"	/* get 1st daddr word */
-"	add		%8, %3, %3\n"/* add 16-bit proto + len */
-"	add		%%r19, %0, %0\n"
-"	ldd,ma		8(%1), %%r21\n"	/* 2cd saddr */
-"	ldd,ma		8(%2), %%r22\n"	/* 2cd daddr */
-"	add,dc		%%r20, %0, %0\n"
-"	add,dc		%%r21, %0, %0\n"
-"	add,dc		%%r22, %0, %0\n"
-"	add,dc		%3, %0, %0\n"  /* fold in proto+len | carry bit */
-"	extrd,u		%0, 31, 32, %%r19\n"	/* copy upper half down */
-"	depdi		0, 31, 32, %0\n"	/* clear upper half */
-"	add		%%r19, %0, %0\n"	/* fold into 32-bits */
-"	addc		0, %0, %0\n"		/* add carry */
+	"	ldd,ma		8(%1), %%r19\n"	/* get 1st saddr word */
+	"	ldd,ma		8(%2), %%r20\n"	/* get 1st daddr word */
+	"	add		%8, %3, %3\n"/* add 16-bit proto + len */
+	"	add		%%r19, %0, %0\n"
+	"	ldd,ma		8(%1), %%r21\n"	/* 2cd saddr */
+	"	ldd,ma		8(%2), %%r22\n"	/* 2cd daddr */
+	"	add,dc		%%r20, %0, %0\n"
+	"	add,dc		%%r21, %0, %0\n"
+	"	add,dc		%%r22, %0, %0\n"
+	"	add,dc		%3, %0, %0\n"  /* fold in proto+len | carry bit */
+	"	extrd,u		%0, 31, 32, %%r19\n"	/* copy upper half down */
+	"	depdi		0, 31, 32, %0\n"	/* clear upper half */
+	"	add		%%r19, %0, %0\n"	/* fold into 32-bits */
+	"	addc		0, %0, %0"		/* add carry */
 
 #else
 
@@ -163,29 +164,30 @@
 	** result from the previous operation (eg r0 + x)
 	*/
 
-"	ldw,ma		4(%1), %%r19\n"	/* get 1st saddr word */
-"	ldw,ma		4(%2), %%r20\n"	/* get 1st daddr word */
-"	add		%8, %3, %3\n"	/* add 16-bit proto + len */
-"	add		%%r19, %0, %0\n"
-"	ldw,ma		4(%1), %%r21\n"	/* 2cd saddr */
-"	addc		%%r20, %0, %0\n"
-"	ldw,ma		4(%2), %%r22\n"	/* 2cd daddr */
-"	addc		%%r21, %0, %0\n"
-"	ldw,ma		4(%1), %%r19\n"	/* 3rd saddr */
-"	addc		%%r22, %0, %0\n"
-"	ldw,ma		4(%2), %%r20\n"	/* 3rd daddr */
-"	addc		%%r19, %0, %0\n"
-"	ldw,ma		4(%1), %%r21\n"	/* 4th saddr */
-"	addc		%%r20, %0, %0\n"
-"	ldw,ma		4(%2), %%r22\n"	/* 4th daddr */
-"	addc		%%r21, %0, %0\n"
-"	addc		%%r22, %0, %0\n"
-"	addc		%3, %0, %0\n"	/* fold in proto+len, catch carry */
+	"	ldw,ma		4(%1), %%r19\n"	/* get 1st saddr word */
+	"	ldw,ma		4(%2), %%r20\n"	/* get 1st daddr word */
+	"	add		%8, %3, %3\n"	/* add 16-bit proto + len */
+	"	add		%%r19, %0, %0\n"
+	"	ldw,ma		4(%1), %%r21\n"	/* 2cd saddr */
+	"	addc		%%r20, %0, %0\n"
+	"	ldw,ma		4(%2), %%r22\n"	/* 2cd daddr */
+	"	addc		%%r21, %0, %0\n"
+	"	ldw,ma		4(%1), %%r19\n"	/* 3rd saddr */
+	"	addc		%%r22, %0, %0\n"
+	"	ldw,ma		4(%2), %%r20\n"	/* 3rd daddr */
+	"	addc		%%r19, %0, %0\n"
+	"	ldw,ma		4(%1), %%r21\n"	/* 4th saddr */
+	"	addc		%%r20, %0, %0\n"
+	"	ldw,ma		4(%2), %%r22\n"	/* 4th daddr */
+	"	addc		%%r21, %0, %0\n"
+	"	addc		%%r22, %0, %0\n"
+	"	addc		%3, %0, %0"	/* fold in proto+len, catch carry */
 
 #endif
-	: "=r" (sum), "=r" (saddr), "=r" (daddr), "=r" (len)
-	: "0" (sum), "1" (saddr), "2" (daddr), "3" (len), "r" (proto)
-	: "r19", "r20", "r21", "r22");
+		: "=r" (sum), "=r" (saddr), "=r" (daddr), "=r" (len)
+		: "0" (sum), "1" (saddr), "2" (daddr), "3" (len), "r" (proto)
+		: "r19", "r20", "r21", "r22"
+	);
 	return csum_fold(sum);
 }
 
--- ./include/asm-parisc/delay.h.Orig	2006-04-10 14:43:17.000000000 +0200
+++ ./include/asm-parisc/delay.h	2006-04-10 18:18:38.000000000 +0200
@@ -12,11 +12,12 @@
  */
 
 static __inline__ void __delay(unsigned long loops) {
-	asm volatile(
+	__asm__ __volatile__ ("\n"
 	"	.balignl	64,0x34000034\n"
-	"	addib,UV -1,%0,.\n"
-	"	nop\n"
-		: "=r" (loops) : "0" (loops));
+	"	addib,UV	-1,%0,.\n"
+	"	nop"
+		: "=r" (loops) : "0" (loops)
+	);
 }
 
 static __inline__ void __cr16_delay(unsigned long clocks) {
--- ./include/asm-parisc/io.h.Orig	2006-04-10 14:46:05.000000000 +0200
+++ ./include/asm-parisc/io.h	2006-04-13 10:42:33.000000000 +0200
@@ -30,12 +30,13 @@
 	long flags;
 	unsigned char ret;
 
-	__asm__ __volatile__(
-	"	rsm	2,%0\n"
-	"	ldbx	0(%2),%1\n"
-	"	mtsm	%0\n"
-	: "=&r" (flags), "=r" (ret) : "r" (addr) );
-
+	__asm__ __volatile__ ("\n"
+	"	rsm		2, %0\n"
+	"	ldbx		0(%2), %1\n"
+	"	mtsm		%0"
+		: "=&r" (flags), "=r" (ret)
+		: "r" (addr)
+	);
 	return ret;
 }
 
@@ -44,12 +45,13 @@
 	long flags;
 	unsigned short ret;
 
-	__asm__ __volatile__(
-	"	rsm	2,%0\n"
-	"	ldhx	0(%2),%1\n"
-	"	mtsm	%0\n"
-	: "=&r" (flags), "=r" (ret) : "r" (addr) );
-
+	__asm__ __volatile__ ("\n"
+	"	rsm		2, %0\n"
+	"	ldhx		0(%2), %1\n"
+	"	mtsm		%0"
+		: "=&r" (flags), "=r" (ret)
+		: "r" (addr)
+	);
 	return ret;
 }
 
@@ -57,10 +59,11 @@
 {
 	u32 ret;
 
-	__asm__ __volatile__(
-	"	ldwax	0(%1),%0\n"
-	: "=r" (ret) : "r" (addr) );
-
+	__asm__ __volatile__ ("\n"
+	"	ldwax		0(%1), %0"
+		: "=r" (ret)
+		: "r" (addr)
+	);
 	return ret;
 }
 
@@ -69,9 +72,11 @@
 	unsigned long long ret;
 
 #ifdef __LP64__
-	__asm__ __volatile__(
-	"	ldda	0(%1),%0\n"
-	:  "=r" (ret) : "r" (addr) );
+	__asm__ __volatile__ ("\n"
+	"	ldda		0(%1), %0"
+		: "=r" (ret)
+		: "r" (addr)
+	);
 #else
 	/* two reads may have side effects.. */
 	ret = ((u64) gsc_readl(addr)) << 32;
@@ -83,36 +88,44 @@
 static inline void gsc_writeb(unsigned char val, unsigned long addr)
 {
 	long flags;
-	__asm__ __volatile__(
-	"	rsm	2,%0\n"
-	"	stbs	%1,0(%2)\n"
-	"	mtsm	%0\n"
-	: "=&r" (flags) :  "r" (val), "r" (addr) );
+	__asm__ __volatile__ ("\n"
+	"	rsm		2, %0\n"
+	"	stbs		%1, 0(%2)\n"
+	"	mtsm		%0"
+		: "=&r" (flags)
+		: "r" (val), "r" (addr)
+	);
 }
 
 static inline void gsc_writew(unsigned short val, unsigned long addr)
 {
 	long flags;
-	__asm__ __volatile__(
-	"	rsm	2,%0\n"
-	"	sths	%1,0(%2)\n"
-	"	mtsm	%0\n"
-	: "=&r" (flags) :  "r" (val), "r" (addr) );
+	__asm__ __volatile__ ("\n"
+	"	rsm		2, %0\n"
+	"	sths		%1, 0(%2)\n"
+	"	mtsm		%0"
+		: "=&r" (flags)
+		: "r" (val), "r" (addr)
+	);
 }
 
 static inline void gsc_writel(unsigned int val, unsigned long addr)
 {
-	__asm__ __volatile__(
-	"	stwas	%0,0(%1)\n"
-	: :  "r" (val), "r" (addr) );
+	__asm__ __volatile__ ("\n"
+	"	stwas		%0, 0(%1)"
+		:
+		: "r" (val), "r" (addr)
+	);
 }
 
 static inline void gsc_writeq(unsigned long long val, unsigned long addr)
 {
 #ifdef __LP64__
-	__asm__ __volatile__(
-	"	stda	%0,0(%1)\n"
-	: :  "r" (val), "r" (addr) );
+	__asm__ __volatile__ ("\n"
+	"	stda		%0, 0(%1)"
+		:
+		: "r" (val), "r" (addr)
+	);
 #else
 	/* two writes may have side effects.. */
 	gsc_writel(val >> 32, addr);
--- ./include/asm-parisc/processor.h.Orig	2006-04-10 15:41:18.000000000 +0200
+++ ./include/asm-parisc/processor.h	2006-04-10 18:24:23.000000000 +0200
@@ -34,7 +34,15 @@
    PA-RISC.  This is no longer true, but this still seems like the
    nicest way to implement this. */
 
-#define current_text_addr() ({ void *pc; __asm__("\n\tblr 0,%0\n\tnop":"=r" (pc)); pc; })
+#define current_text_addr()	({			\
+	void *pc;					\
+	__asm__ ("\n"					\
+	"	blr		0, %0\n"		\
+	"	nop"					\
+		:"=r" (pc)				\
+	);						\
+	pc;						\
+})
 
 #define TASK_SIZE               (current->thread.task_size)
 #define TASK_UNMAPPED_BASE      (current->thread.map_base)
@@ -348,12 +356,20 @@
 
 extern inline void prefetch(const void *addr)
 {
-	__asm__("ldw 0(%0), %%r0" : : "r" (addr));
+	__asm__ ("\n"
+	"	ldw		0(%0), %%r0"
+		:
+		: "r" (addr)
+	);
 }
 
 extern inline void prefetchw(const void *addr)
 {
-	__asm__("ldd 0(%0), %%r0" : : "r" (addr));
+	__asm__ ("\n"
+	"	ldd		0(%0), %%r0"
+		:
+		: "r" (addr)
+	);
 }
 #endif
 
--- ./include/asm-parisc/uaccess.h.Orig	2006-04-10 16:05:32.000000000 +0200
+++ ./include/asm-parisc/uaccess.h	2006-04-10 18:28:14.000000000 +0200
@@ -76,97 +76,122 @@
 	unsigned long fault_addr;
 };
 
-#define __get_user(x,ptr)                               \
-({                                                      \
-	register long __gu_err __asm__ ("r8") = 0;      \
-	register long __gu_val __asm__ ("r9") = 0;      \
-							\
-	if (segment_eq(get_fs(),KERNEL_DS)) {           \
-	    switch (sizeof(*(ptr))) {                   \
-	    case 1: __get_kernel_asm("ldb",ptr); break; \
-	    case 2: __get_kernel_asm("ldh",ptr); break; \
-	    case 4: __get_kernel_asm("ldw",ptr); break; \
-	    case 8: LDD_KERNEL(ptr); break;		\
-	    default: __get_kernel_bad(); break;         \
-	    }                                           \
-	}                                               \
-	else {                                          \
-	    switch (sizeof(*(ptr))) {                   \
-	    case 1: __get_user_asm("ldb",ptr); break;   \
-	    case 2: __get_user_asm("ldh",ptr); break;   \
-	    case 4: __get_user_asm("ldw",ptr); break;   \
-	    case 8: LDD_USER(ptr);  break;		\
-	    default: __get_user_bad(); break;           \
-	    }                                           \
-	}                                               \
-							\
-	(x) = (__typeof__(*(ptr))) __gu_val;            \
-	__gu_err;                                       \
+#define __get_user(x, ptr)	({				\
+								\
+	register long __gu_err __asm__ ("r8") = 0;		\
+	register long __gu_val __asm__ ("r9") = 0;		\
+								\
+	if (segment_eq(get_fs(), KERNEL_DS)) {			\
+		switch (sizeof(*(ptr))) {			\
+			case 1: __get_kernel_asm("ldb", ptr);	\
+				break;				\
+			case 2: __get_kernel_asm("ldh", ptr);	\
+				break;				\
+			case 4: __get_kernel_asm("ldw", ptr);	\
+				break;				\
+			case 8: LDD_KERNEL(ptr);		\
+				break;				\
+			default: __get_kernel_bad();		\
+				break;				\
+		}						\
+	} else {						\
+		switch (sizeof(*(ptr))) {			\
+			case 1: __get_user_asm("ldb", ptr);	\
+				break;				\
+			case 2: __get_user_asm("ldh", ptr);	\
+				break;				\
+			case 4: __get_user_asm("ldw", ptr);	\
+				break;				\
+			case 8: LDD_USER(ptr);			\
+				break;				\
+			default: __get_user_bad();		\
+				break;				\
+		}						\
+	}							\
+								\
+	(x) = (__typeof__(*(ptr))) __gu_val;			\
+	__gu_err;						\
 })
 
 #ifdef __LP64__
-#define __get_kernel_asm(ldx,ptr)                       \
-	__asm__("\n1:\t" ldx "\t0(%2),%0\n"             \
-		"\t.section __ex_table,\"aw\"\n"        \
-		"\t.dword\t1b,fixup_get_user_skip_1\n"	\
-		"\t.previous"                          	\
-		: "=r"(__gu_val), "=r"(__gu_err)        \
+#define __get_kernel_asm(ldx, ptr)			\
+	__asm__ ("\n"					\
+	"1:	" ldx "		0(%2), %0\n"		\
+	"	.section __ex_table,\"aw\"\n"		\
+	"	.dword	1b, fixup_get_user_skip_1\n"	\
+	"	.previous"				\
+		: "=r"(__gu_val), "=r"(__gu_err)	\
 		: "r"(ptr), "1"(__gu_err)		\
-		: "r1");
+		: "r1"					\
+	)
 
-#define __get_user_asm(ldx,ptr)                         \
-	__asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \
-		"\t.section __ex_table,\"aw\"\n"	\
-		"\t.dword\t1b,fixup_get_user_skip_1\n"	\
-		"\t.previous"				\
-		: "=r"(__gu_val), "=r"(__gu_err)        \
+#define __get_user_asm(ldx, ptr)			\
+	__asm__ ("\n"					\
+	"1:	" ldx "		0(%%sr3, %2), %0\n"	\
+	"	.section __ex_table,\"aw\"\n"		\
+	"	.dword	1b, fixup_get_user_skip_1\n"	\
+	"	.previous"				\
+		: "=r"(__gu_val), "=r"(__gu_err)	\
 		: "r"(ptr), "1"(__gu_err)		\
-		: "r1");
+		: "r1"					\
+	)
 #else
-#define __get_kernel_asm(ldx,ptr)                       \
-	__asm__("\n1:\t" ldx "\t0(%2),%0\n"             \
-		"\t.section __ex_table,\"aw\"\n"        \
-		"\t.word\t1b,fixup_get_user_skip_1\n"	\
-		"\t.previous"                          	\
-		: "=r"(__gu_val), "=r"(__gu_err)        \
+#define __get_kernel_asm(ldx, ptr)			\
+	__asm__ ("\n"					\
+	"1:	" ldx "		0(%2), %0\n"		\
+	"	.section __ex_table,\"aw\"\n"		\
+	"	.word	1b, fixup_get_user_skip_1\n"	\
+	"	.previous"				\
+		: "=r"(__gu_val), "=r"(__gu_err)	\
 		: "r"(ptr), "1"(__gu_err)		\
-		: "r1");
+		: "r1"					\
+	)
 
-#define __get_user_asm(ldx,ptr)                         \
-	__asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \
-		"\t.section __ex_table,\"aw\"\n"	\
-		 "\t.word\t1b,fixup_get_user_skip_1\n"	\
-		 "\t.previous"                          \
-		: "=r"(__gu_val), "=r"(__gu_err)        \
+#define __get_user_asm(ldx, ptr)			\
+	__asm__ ("\n"					\
+	"1:	" ldx "		0(%%sr3, %2), %0\n"	\
+	"	.section __ex_table,\"aw\"\n"		\
+	"	.word	1b, fixup_get_user_skip_1\n"	\
+	"	.previous"				\
+		: "=r"(__gu_val), "=r"(__gu_err)	\
 		: "r"(ptr), "1"(__gu_err)		\
-		: "r1");
+		: "r1"					\
+	)
 #endif /* !__LP64__ */
 
-#define __put_user(x,ptr)                                       \
-({								\
-	register long __pu_err __asm__ ("r8") = 0;      	\
-        __typeof__(*(ptr)) __x = (__typeof__(*(ptr)))(x);	\
-								\
-	if (segment_eq(get_fs(),KERNEL_DS)) {                   \
-	    switch (sizeof(*(ptr))) {                           \
-	    case 1: __put_kernel_asm("stb",__x,ptr); break;     \
-	    case 2: __put_kernel_asm("sth",__x,ptr); break;     \
-	    case 4: __put_kernel_asm("stw",__x,ptr); break;     \
-	    case 8: STD_KERNEL(__x,ptr); break;			\
-	    default: __put_kernel_bad(); break;			\
-	    }                                                   \
-	}                                                       \
-	else {                                                  \
-	    switch (sizeof(*(ptr))) {                           \
-	    case 1: __put_user_asm("stb",__x,ptr); break;       \
-	    case 2: __put_user_asm("sth",__x,ptr); break;       \
-	    case 4: __put_user_asm("stw",__x,ptr); break;       \
-	    case 8: STD_USER(__x,ptr); break;			\
-	    default: __put_user_bad(); break;			\
-	    }                                                   \
-	}                                                       \
-								\
-	__pu_err;						\
+#define __put_user(x, ptr)	({					\
+									\
+	register long __pu_err __asm__ ("r8") = 0;			\
+        __typeof__(*(ptr)) __x = (__typeof__(*(ptr)))(x);		\
+									\
+	if (segment_eq(get_fs(),KERNEL_DS)) {				\
+		switch (sizeof(*(ptr))) {				\
+			case 1: __put_kernel_asm("stb", __x, ptr);	\
+				break;					\
+			case 2: __put_kernel_asm("sth", __x, ptr);	\
+				break;					\
+			case 4: __put_kernel_asm("stw", __x, ptr);	\
+				break;					\
+			case 8: STD_KERNEL(__x, ptr);			\
+				break;					\
+			default: __put_kernel_bad();			\
+				break;					\
+		}							\
+	} else {							\
+		switch (sizeof(*(ptr))) {				\
+			case 1: __put_user_asm("stb", __x, ptr);	\
+				break;					\
+			case 2: __put_user_asm("sth", __x, ptr);	\
+				break;					\
+			case 4: __put_user_asm("stw", __x, ptr);	\
+				break;					\
+			case 8: STD_USER(__x, ptr);			\
+				break;					\
+			default: __put_user_bad();			\
+				break;					\
+		}							\
+	}								\
+	__pu_err;							\
 })
 
 /*
@@ -176,75 +201,82 @@
  */
 
 #ifdef __LP64__
-#define __put_kernel_asm(stx,x,ptr)                         \
-	__asm__ __volatile__ (                              \
-		"\n1:\t" stx "\t%2,0(%1)\n"                 \
-		"\t.section __ex_table,\"aw\"\n"            \
-		"\t.dword\t1b,fixup_put_user_skip_1\n"	    \
-		"\t.previous"                               \
-		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(x), "0"(__pu_err))
-
-#define __put_user_asm(stx,x,ptr)                           \
-	__asm__ __volatile__ (                              \
-		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
-		"\t.section __ex_table,\"aw\"\n"            \
-		 "\t.dword\t1b,fixup_put_user_skip_1\n"	    \
-		 "\t.previous"                              \
-		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
-		: "r1")
+#define __put_kernel_asm(stx, x, ptr)			\
+	__asm__ __volatile__ ("\n"			\
+	"1:	" stx "		%2, 0(%1)\n"		\
+	"	.section __ex_table,\"aw\"\n"		\
+	"	.dword	1b, fixup_put_user_skip_1\n"	\
+	"	.previous"				\
+		: "=r"(__pu_err)			\
+		: "r"(ptr), "r"(x), "0"(__pu_err)	\
+		: "r1"					\
+	)
+
+#define __put_user_asm(stx, x, ptr)			\
+	__asm__ __volatile__ ("\n"			\
+	"1:	" stx "		%2, 0(%%sr3, %1)\n"	\
+	"	.section __ex_table,\"aw\"\n"		\
+	"	.dword	1b, fixup_put_user_skip_1\n"    \
+	"	.previous"				\
+		: "=r"(__pu_err)			\
+		: "r"(ptr), "r"(x), "0"(__pu_err)	\
+		: "r1"					\
+	)
 #else
-#define __put_kernel_asm(stx,x,ptr)                         \
-	__asm__ __volatile__ (                              \
-		"\n1:\t" stx "\t%2,0(%1)\n"                 \
-		"\t.section __ex_table,\"aw\"\n"            \
-		 "\t.word\t1b,fixup_put_user_skip_1\n"	    \
-		 "\t.previous"                              \
-		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
-		: "r1")
-
-#define __put_user_asm(stx,x,ptr)                           \
-	__asm__ __volatile__ (                              \
-		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
-		"\t.section __ex_table,\"aw\"\n"            \
-		 "\t.word\t1b,fixup_put_user_skip_1\n"      \
-		 "\t.previous"                              \
-		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(x), "0"(__pu_err)	    \
-		: "r1")
-
-#define __put_kernel_asm64(__val,ptr) do {		    	    \
-	u64 __val64 = (u64)(__val);				    \
-	u32 hi = (__val64) >> 32;					    \
-	u32 lo = (__val64) & 0xffffffff;				    \
-	__asm__ __volatile__ (				    \
-		"\n1:\tstw %2,0(%1)\n"			    \
-		"\n2:\tstw %3,4(%1)\n"			    \
-		"\t.section __ex_table,\"aw\"\n"	    \
-		 "\t.word\t1b,fixup_put_user_skip_2\n"	    \
-		 "\t.word\t2b,fixup_put_user_skip_1\n"	    \
-		 "\t.previous"				    \
-		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(hi), "r"(lo), "0"(__pu_err) \
-		: "r1");				    \
+#define __put_kernel_asm(stx, x, ptr)			\
+	__asm__ __volatile__ ("\n"			\
+	"1:	" stx "		%2, 0(%1)\n"		\
+	"	.section __ex_table,\"aw\"\n"		\
+	"	.word	1b, fixup_put_user_skip_1\n"	\
+	"	.previous"				\
+		: "=r"(__pu_err)			\
+		: "r"(ptr), "r"(x), "0"(__pu_err)	\
+		: "r1"					\
+	)
+
+#define __put_user_asm(stx, x, ptr)			\
+	__asm__ __volatile__ ("\n"			\
+	"1:	" stx "		%2, 0(%%sr3, %1)\n"	\
+	"	.section __ex_table,\"aw\"\n"		\
+	"	.word	1b, fixup_put_user_skip_1\n"	\
+	"	.previous"				\
+		: "=r"(__pu_err)			\
+		: "r"(ptr), "r"(x), "0"(__pu_err)	\
+		: "r1"					\
+	)
+
+#define __put_kernel_asm64(__val, ptr) do {			\
+	u64 __val64 = (u64)(__val);				\
+	u32 hi = (__val64) >> 32;				\
+	u32 lo = (__val64) & 0xffffffff;			\
+	__asm__ __volatile__ ("\n"				\
+	"1:	stw		%2, 0(%1)\n"			\
+	"2:	stw		%3, 4(%1)\n"			\
+	"	.section __ex_table,\"aw\"\n"			\
+	"	.word	1b, fixup_put_user_skip_2\n"		\
+	"	.word	2b, fixup_put_user_skip_1\n"		\
+	"	.previous"					\
+		: "=r"(__pu_err)				\
+		: "r"(ptr), "r"(hi), "r"(lo), "0"(__pu_err)	\
+		: "r1"						\
+	);							\
 } while (0)
 
-#define __put_user_asm64(__val,ptr) do {		    	    \
-	u64 __val64 = (u64)__val;				    \
-	u32 hi = (__val64) >> 32;					    \
-	u32 lo = (__val64) & 0xffffffff;				    \
-	__asm__ __volatile__ (				    \
-		"\n1:\tstw %2,0(%%sr3,%1)\n"		    \
-		"\n2:\tstw %3,4(%%sr3,%1)\n"		    \
-		"\t.section __ex_table,\"aw\"\n"	    \
-		 "\t.word\t1b,fixup_get_user_skip_2\n"	    \
-		 "\t.word\t2b,fixup_get_user_skip_1\n"	    \
-		 "\t.previous"				    \
-		: "=r"(__pu_err)                            \
-		: "r"(ptr), "r"(hi), "r"(lo), "0"(__pu_err) \
-		: "r1");				    \
+#define __put_user_asm64(__val, ptr) do {			\
+	u64 __val64 = (u64)__val;				\
+	u32 hi = (__val64) >> 32;				\
+	u32 lo = (__val64) & 0xffffffff;			\
+	__asm__ __volatile__ ("\n"				\
+	"1:	stw		%2, 0(%%sr3, %1)\n"		\
+	"2:	stw		%3, 4(%%sr3, %1)\n"		\
+	"	.section __ex_table,\"aw\"\n"			\
+	"	.word	1b, fixup_get_user_skip_2\n"		\
+	"	.word	2b, fixup_get_user_skip_1\n"		\
+	"	.previous"					\
+		: "=r"(__pu_err)				\
+		: "r"(ptr), "r"(hi), "r"(lo), "0"(__pu_err)	\
+		: "r1"						\
+	);							\
 } while (0)
 
 #endif /* !__LP64__ */
@@ -256,7 +288,8 @@
 
 extern unsigned long lcopy_to_user(void __user *, const void *, unsigned long);
 extern unsigned long lcopy_from_user(void *, const void __user *, unsigned long);
-extern unsigned long lcopy_in_user(void __user *, const void __user *, unsigned long);
+extern unsigned long lcopy_in_user(void __user *, const void __user *,
+					unsigned long);
 extern long lstrncpy_from_user(char *, const char __user *, long);
 extern unsigned lclear_user(void __user *,unsigned long);
 extern long lstrnlen_user(const char __user *,long);
@@ -265,19 +298,24 @@
  * Complex access routines -- macros
  */
 
-#define strncpy_from_user lstrncpy_from_user
-#define strnlen_user lstrnlen_user
-#define strlen_user(str) lstrnlen_user(str, 0x7fffffffL)
-#define clear_user lclear_user
-#define __clear_user lclear_user
-
-unsigned long copy_to_user(void __user *dst, const void *src, unsigned long len);
-#define __copy_to_user copy_to_user
-unsigned long copy_from_user(void *dst, const void __user *src, unsigned long len);
-#define __copy_from_user copy_from_user
-unsigned long copy_in_user(void __user *dst, const void __user *src, unsigned long len);
-#define __copy_in_user copy_in_user
-#define __copy_to_user_inatomic __copy_to_user
-#define __copy_from_user_inatomic __copy_from_user
+#define strncpy_from_user	lstrncpy_from_user
+#define strnlen_user		lstrnlen_user
+#define strlen_user(str)	lstrnlen_user(str, 0x7fffffffL)
+#define clear_user		lclear_user
+#define __clear_user		lclear_user
+
+unsigned long copy_to_user(void __user *dst, const void *src,
+				unsigned long len);
+#define __copy_to_user	copy_to_user
+
+unsigned long copy_from_user(void *dst, const void __user *src,
+				unsigned long len);
+#define __copy_from_user 	copy_from_user
+
+unsigned long copy_in_user(void __user *dst, const void __user *src,
+				unsigned long len);
+#define __copy_in_user			copy_in_user
+#define __copy_to_user_inatomic		__copy_to_user
+#define __copy_from_user_inatomic	__copy_from_user
 
 #endif /* __PARISC_UACCESS_H */
--- ./include/asm-parisc/unistd.h.Orig	2006-04-10 18:29:13.000000000 +0200
+++ ./include/asm-parisc/unistd.h	2006-04-10 18:43:57.000000000 +0200
@@ -805,12 +805,12 @@
 
 #ifdef PIC
 /* WARNING: CANNOT BE USED IN A NOP! */
-# define K_STW_ASM_PIC	"       copy %%r19, %%r4\n"
-# define K_LDW_ASM_PIC	"       copy %%r4, %%r19\n"
+# define K_STW_ASM_PIC	"	copy %%r19, %%r4\n"
+# define K_LDW_ASM_PIC	"	copy %%r4, %%r19\n"
 # define K_USING_GR4	"%r4",
 #else
-# define K_STW_ASM_PIC	" \n"
-# define K_LDW_ASM_PIC	" \n"
+# define K_STW_ASM_PIC	"\n"
+# define K_LDW_ASM_PIC	"\n"
 # define K_USING_GR4
 #endif
 
@@ -835,43 +835,43 @@
 		register unsigned long __res __asm__("r28");		\
 		K_LOAD_ARGS_##nr(args)					\
 		/* FIXME: HACK stw/ldw r19 around syscall */		\
-		__asm__ volatile(					\
+		__asm__ __volatile__ ("\n"				\
 			K_STW_ASM_PIC					\
-			"	ble  0x100(%%sr2, %%r0)\n"		\
-			"	ldi %1, %%r20\n"			\
+		"	ble		0x100(%%sr2, %%r0)\n"		\
+		"	ldi		%1, %%r20\n"			\
 			K_LDW_ASM_PIC					\
 			: "=r" (__res)					\
-			: "i" (SYS_ify(name)) K_ASM_ARGS_##nr   	\
+			: "i" (SYS_ify(name)) K_ASM_ARGS_##nr		\
 			: "memory", K_CALL_CLOB_REGS K_CLOB_ARGS_##nr	\
 		);							\
 		__sys_res = (long)__res;				\
 	}								\
-	if ( (unsigned long)__sys_res >= (unsigned long)-4095 ){	\
-		errno = -__sys_res;		        		\
+	if ( (unsigned long)__sys_res >= (unsigned long)-4095 ) {	\
+		errno = -__sys_res;					\
 		__sys_res = -1;						\
 	}								\
 	__sys_res;							\
 })
 
 #define K_LOAD_ARGS_0()
-#define K_LOAD_ARGS_1(r26)					\
-	register unsigned long __r26 __asm__("r26") = (unsigned long)(r26);   \
+#define K_LOAD_ARGS_1(r26)							\
+	register unsigned long __r26 __asm__("r26") = (unsigned long)(r26);	\
 	K_LOAD_ARGS_0()
-#define K_LOAD_ARGS_2(r26,r25)					\
-	register unsigned long __r25 __asm__("r25") = (unsigned long)(r25);   \
+#define K_LOAD_ARGS_2(r26, r25)							\
+	register unsigned long __r25 __asm__("r25") = (unsigned long)(r25);	\
 	K_LOAD_ARGS_1(r26)
-#define K_LOAD_ARGS_3(r26,r25,r24)				\
-	register unsigned long __r24 __asm__("r24") = (unsigned long)(r24);   \
-	K_LOAD_ARGS_2(r26,r25)
-#define K_LOAD_ARGS_4(r26,r25,r24,r23)				\
-	register unsigned long __r23 __asm__("r23") = (unsigned long)(r23);   \
-	K_LOAD_ARGS_3(r26,r25,r24)
-#define K_LOAD_ARGS_5(r26,r25,r24,r23,r22)			\
-	register unsigned long __r22 __asm__("r22") = (unsigned long)(r22);   \
-	K_LOAD_ARGS_4(r26,r25,r24,r23)
-#define K_LOAD_ARGS_6(r26,r25,r24,r23,r22,r21)			\
-	register unsigned long __r21 __asm__("r21") = (unsigned long)(r21);   \
-	K_LOAD_ARGS_5(r26,r25,r24,r23,r22)
+#define K_LOAD_ARGS_3(r26, r25, r24)						\
+	register unsigned long __r24 __asm__("r24") = (unsigned long)(r24);	\
+	K_LOAD_ARGS_2(r26, r25)
+#define K_LOAD_ARGS_4(r26, r25, r24, r23)					\
+	register unsigned long __r23 __asm__("r23") = (unsigned long)(r23);	\
+	K_LOAD_ARGS_3(r26, r25, r24)
+#define K_LOAD_ARGS_5(r26, r25, r24, r23, r22)					\
+	register unsigned long __r22 __asm__("r22") = (unsigned long)(r22);	\
+	K_LOAD_ARGS_4(r26, r25, r24, r23)
+#define K_LOAD_ARGS_6(r26, r25, r24, r23, r22, r21)				\
+	register unsigned long __r21 __asm__("r21") = (unsigned long)(r21);	\
+	K_LOAD_ARGS_5(r26, r25, r24, r23, r22)
 
 /* Even with zero args we use r20 for the syscall number */
 #define K_ASM_ARGS_0

--------------060503000105010703060408
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------060503000105010703060408--
