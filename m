From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] some whitespace rework and attempt to beautify
	inline asm stuff?
Date: Tue, 11 Apr 2006 10:37:38 +0100
Message-ID: <IXJXEQ$C47DD9AC94AAFC817D7A8379F72B1E8E@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="_=__=_XaM3_.1144748258.2A.816162.42.473.52.42.007.1772815055"
To: "Parisc List" <parisc-linux@lists.parisc-linux.org>
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

--_=__=_XaM3_.1144748258.2A.816162.42.473.52.42.007.1772815055
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all,

Reading some .s output like memcpy, I was worry that some labels was not =
in
the column as e.g.:
       pmc_store_exc:
[...]
       1:      ldw 0(%sr1,%r19), %r22
[...]

or otc code in first column:
[...]
shrpw %r3, %r1, %sar, %r28

here I attache a patch
--- linux-2.6.17-rc1-pa1/arch/parisc/lib/memcpy.c.Orig  2006-04-10
07:24:31.000000000 +0000
+++ linux-2.6.17-rc1-pa1/arch/parisc/lib/memcpy.c       2006-04-10
15:05:38.000000000 +0000
@@ -79,20 +79,24 @@
 #define get_user_space() (segment_eq(get_fs(), KERNEL_DS) ? 0 : mfsp(3))=

 #define get_kernel_space() (0)
 
-#define MERGE(w0, sh_1, w1, sh_2)  ({                                  \=

+#define MERGE(w0, sh_1, w1, sh_2)      ({                              \=

        unsigned int _r;                                                \=

-       asm volatile (                                                  \=

-       "mtsar %3\n"                                                    \=

-       "shrpw %1, %2, %%sar, %0\n"                                     \=

-       : "=3Dr"(_r)                                                     =
 \
-       : "r"(w0), "r"(w1), "r"(sh_2)                                   \=

+       __asm__ __volatile__ ("\n"                                      \=

+       "       mtsar           %3\n"                                   \=

+       "       shrpw           %1, %2,%%sar, %0"                       \=

+               : "=3Dr"(_r)                                             =
 \
+               : "r"(w0), "r"(w1), "r"(sh_2)                           \=

        );                                                              \=

        _r;                                                             \=

 })
 #define THRESHOLD      16
 
 #ifdef DEBUG_MEMCPY
-#define DPRINTF(fmt, args...) do { printk(KERN_DEBUG "%s:%d:%s ", __FILE=
__,
__LINE__, __FUNCTION__ ); printk(KERN_DEBUG fmt, ##args
 ); } while (0)
+#define DPRINTF(fmt, args...) do {                                     \=

+       printk(KERN_DEBUG "%s:%d:%s ",                                  \=

+               __FILE__, __LINE__, __FUNCTION__ );                     \=

+       printk(KERN_DEBUG fmt, ##args );                                \=

+} while (0)
 #else
 #define DPRINTF(fmt, args...)
 #endif
@@ -103,69 +107,81 @@
 #define EXC_WORD ".dword"
 #endif
 
-#define def_load_ai_insn(_insn,_sz,_tt,_s,_a,_t,_e)    \
-       __asm__ __volatile__ (                          \
-       "1:\t" #_insn ",ma " #_sz "(" _s ",%1), %0\n"   \
-       "\t.section __ex_table,\"aw\"\n"                \
-       "\t" EXC_WORD "\t1b\n"                          \
-       "\t" EXC_WORD "\t" #_e "\n"                     \
-       "\t.previous\n"                                 \
-       : _tt(_t), "+r"(_a)                             \
-       :                                               \
-       : "r8")
-
-#define def_store_ai_insn(_insn,_sz,_tt,_s,_a,_t,_e)   \
-       __asm__ __volatile__ (                          \
-       "1:\t" #_insn ",ma %1, " #_sz "(" _s ",%0)\n"   \
-       "\t.section __ex_table,\"aw\"\n"                \
-       "\t" EXC_WORD "\t1b\n"                          \
-       "\t" EXC_WORD "\t" #_e "\n"                     \
-       "\t.previous\n"                                 \
-       : "+r"(_a)                                      \
-       : _tt(_t)                                       \
-       : "r8")
-
-#define ldbma(_s, _a, _t, _e) def_load_ai_insn(ldbs,1,"=3Dr",_s,_a,_t,_e=
)
-#define stbma(_s, _t, _a, _e) def_store_ai_insn(stbs,1,"r",_s,_a,_t,_e)
-#define ldwma(_s, _a, _t, _e) def_load_ai_insn(ldw,4,"=3Dr",_s,_a,_t,_e)=

-#define stwma(_s, _t, _a, _e) def_store_ai_insn(stw,4,"r",_s,_a,_t,_e)
-#define flddma(_s, _a, _t, _e) def_load_ai_insn(fldd,8,"=3Df",_s,_a,_t,_=
e)
-#define fstdma(_s, _t, _a, _e) def_store_ai_insn(fstd,8,"f",_s,_a,_t,_e)=

-
-#define def_load_insn(_insn,_tt,_s,_o,_a,_t,_e)        \
-       __asm__ __volatile__ (                          \
-       "1:\t" #_insn " " #_o "(" _s ",%1), %0\n"       \
-       "\t.section __ex_table,\"aw\"\n"                \
-       "\t" EXC_WORD "\t1b\n"                          \
-       "\t" EXC_WORD "\t" #_e "\n"                     \
-       "\t.previous\n"                                 \
-       : _tt(_t)                                       \
-       : "r"(_a)                                       \
-       : "r8")
-
-#define def_store_insn(_insn,_tt,_s,_t,_o,_a,_e)       \
-       __asm__ __volatile__ (                          \
-       "1:\t" #_insn " %0, " #_o "(" _s ",%1)\n"       \
-       "\t.section __ex_table,\"aw\"\n"                \
-       "\t" EXC_WORD "\t1b\n"                          \
-       "\t" EXC_WORD "\t" #_e "\n"                     \
-       "\t.previous\n"                                 \
-       :                                               \
-       : _tt(_t), "r"(_a)                              \
-       : "r8")
+#define def_load_ai_insn(_insn, _sz, _tt, _s, _a, _t, _e)              \=

+       __asm__ __volatile__ ("\n"                                      \=

+       "1:     " #_insn ",ma           " #_sz "(" _s ", %1), %0\n"     \=

+       "       .section __ex_table,\"aw\"\n"                           \=

+       "       " EXC_WORD "    1b\n"                                   \=

+       "       " EXC_WORD "    " #_e "\n"                              \=

+       "       .previous"                                              \=

+               : _tt(_t), "+r"(_a)                                     \=

+               :                                                       \=

+               : "r8"                                                  \=

+       )
+
+#define def_store_ai_insn(_insn, _sz, _tt, _s, _a, _t, _e)             \=

+       __asm__ __volatile__ ("\n"                                      \=

+       "1:     " #_insn ",ma           %1, " #_sz "(" _s ", %0)\n"     \=

+       "       .section __ex_table,\"aw\"\n"                           \=

+       "       " EXC_WORD "    1b\n"                                   \=

+       "       " EXC_WORD "    " #_e "\n"                              \=

+       "       .previous"                                              \=

+               : "+r"(_a)                                              \=

+               : _tt(_t)                                               \=

+               : "r8"                                                  \=

+       )
+
+#define ldbma(_s, _a, _t, _e) def_load_ai_insn(ldbs, 1, "=3Dr", _s, _a, =
_t, _e)
+#define stbma(_s, _t, _a, _e) def_store_ai_insn(stbs, 1, "r", _s, _a, _t=
, _e)
+#define ldwma(_s, _a, _t, _e) def_load_ai_insn(ldw, 4, "=3Dr", _s, _a, _=
t, _e)
+#define stwma(_s, _t, _a, _e) def_store_ai_insn(stw, 4, "r", _s, _a, _t,=
 _e)
+#define flddma(_s, _a, _t, _e) def_load_ai_insn(fldd, 8, "=3Df", _s, _a,=
 _t, _e)
+#define fstdma(_s, _t, _a, _e) def_store_ai_insn(fstd, 8, "f", _s, _a, _=
t, _e)
+
+#define def_load_insn(_insn, _tt, _s, _o, _a, _t, _e)                  \=

+       __asm__ __volatile__ ("\n"                                      \=

+       "1:     " #_insn "              " #_o "(" _s ", %1), %0\n"      \=

+       "       .section __ex_table,\"aw\"\n"                           \=

+       "       " EXC_WORD "    1b\n"                                   \=

+       "       " EXC_WORD "    " #_e "\n"                              \=

+       "       .previous"                                              \=

+               : _tt(_t)                                               \=

+               : "r"(_a)                                               \=

+               : "r8"                                                  \=

+       )
+
+#define def_store_insn(_insn, _tt, _s, _t, _o, _a, _e)                 \=

+       __asm__ __volatile__ ("\n"                                      \=

+       "1:     " #_insn "              %0, " #_o "(" _s ", %1)\n"      \=

+       "       .section __ex_table,\"aw\"\n"                           \=

+       "       " EXC_WORD "    1b\n"                                   \=

+       "       " EXC_WORD "    " #_e "\n"                              \=

+       "       .previous"                                              \=

+               :                                                       \=

+               : _tt(_t), "r"(_a)                                      \=

+               : "r8"                                                  \=

+       )
 
-#define ldw(_s,_o,_a,_t,_e)    def_load_insn(ldw,"=3Dr",_s,_o,_a,_t,_e)
-#define stw(_s,_t,_o,_a,_e)    def_store_insn(stw,"r",_s,_t,_o,_a,_e)
+#define ldw(_s, _o, _a, _t, _e)        def_load_insn(ldw, "=3Dr", _s, _o=
, _a,
_t, _e)
+#define stw(_s, _t, _o, _a, _e)        def_store_insn(stw, "r", _s, _t, =
_o,
_a, _e)
 
 #ifdef  CONFIG_PREFETCH
 extern inline void prefetch_src(const void *addr)
 {
-       __asm__("ldw 0(" s_space ",%0), %%r0" : : "r" (addr));
+       __asm__ ("\n"
+       "       ldw             0(" s_space ", %0), %%r0"
+               :
+               : "r" (addr)
+       );
 }
 
 extern inline void prefetch_dst(const void *addr)
 {
-       __asm__("ldd 0(" d_space ",%0), %%r0" : : "r" (addr));
+       __asm__ ("\n"
+       "       ldd             0(" d_space ", %0), %%r0"
+               :
+               : "r" (addr)
+       );
 }
 #else
 #define prefetch_src(addr)
@@ -278,14 +294,14 @@
        return 0;
 
 handle_load_error:
-       __asm__ __volatile__ ("cda_ldw_exc:\n");
+       __asm__ __volatile__ ("\ncda_ldw_exc:\n");
        d =3D &__get_cpu_var(exception_data);
        DPRINTF("cda_ldw_exc: o_len=3D%lu fault_addr=3D%lu o_src=3D%lu re=
t=3D%lu\n",
                o_len, d->fault_addr, o_src, o_len - d->fault_addr + o_sr=
c);
        return o_len * 4 - d->fault_addr + o_src;
 
 handle_store_error:
-       __asm__ __volatile__ ("cda_stw_exc:\n");
+       __asm__ __volatile__ ("\ncda_stw_exc:\n");
        d =3D &__get_cpu_var(exception_data);
        DPRINTF("cda_stw_exc: o_len=3D%lu fault_addr=3D%lu o_dst=3D%lu re=
t=3D%lu\n",
                o_len, d->fault_addr, o_dst, o_len - d->fault_addr + o_ds=
t);
@@ -374,7 +390,7 @@
 
 word_copy:
        while (len >=3D 8*sizeof(unsigned int)) {
-               register unsigned int r1,r2,r3,r4,r5,r6,r7,r8;
+               register unsigned int r1, r2, r3, r4, r5, r6, r7, r8;
                /* prefetch_src((char *)pws + L1_CACHE_BYTES); */
                ldwma(s_space, pws, r1, pmc_load_exc);
                ldwma(s_space, pws, r2, pmc_load_exc);
@@ -397,7 +413,7 @@
        }
 
        while (len >=3D 4*sizeof(unsigned int)) {
-               register unsigned int r1,r2,r3,r4;
+               register unsigned int r1, r2, r3, r4;
                ldwma(s_space, pws, r1, pmc_load_exc);
                ldwma(s_space, pws, r2, pmc_load_exc);
                ldwma(s_space, pws, r3, pmc_load_exc);
@@ -472,14 +488,14 @@
        goto byte_copy;
 
 handle_load_error:
-       __asm__ __volatile__ ("pmc_load_exc:\n");
+       __asm__ __volatile__ ("\npmc_load_exc:\n");
        d =3D &__get_cpu_var(exception_data);
        DPRINTF("pmc_load_exc: o_len=3D%lu fault_addr=3D%lu o_src=3D%lu r=
et=3D%lu\n",
                o_len, d->fault_addr, o_src, o_len - d->fault_addr + o_sr=
c);
        return o_len - d->fault_addr + o_src;
 
 handle_store_error:
-       __asm__ __volatile__ ("pmc_store_exc:\n");
+       __asm__ __volatile__ ("\npmc_store_exc:\n");
        d =3D &__get_cpu_var(exception_data);
        DPRINTF("pmc_store_exc: o_len=3D%lu fault_addr=3D%lu o_dst=3D%lu =
ret=3D%lu\n",
                o_len, d->fault_addr, o_dst, o_len - d->fault_addr + o_ds=
t);
=3D=3D=3D=3D<>=3D=3D=3D=3D

 which seems to make the drill:
-       pmc_store_exc:
+
+pmc_store_exc:
 
 #NO_APP
        addil LR'per_cpu__exception_data-$global$,%r27
@@ -450,37 +451,37 @@
        ldi 0,%r1
 .L38:
 #APP
-       1:      ldw 0(%sr1,%r19), %r22
+
+1:     ldw             0(%sr1, %r19), %r22
        .section __ex_table,"aw"
        .word   1b
        .word   cda_ldw_exc
        .previous
-
-       mtsar %r29
-shrpw %r3, %r1, %sar, %r28
-
-       1:      stw %r28, 0(%sr2,%r20)
+
+       mtsar           %r29
+       shrpw           %r3, %r1,%sar, %r28
+
+1:     stw             %r28, 0(%sr2, %r20)
[...]

Not sure it was usefull but that made me attemptimg to use a same asm blo=
c
template. 

BTW, I tried to apply the same template to some uaccess.h and figure out =
that
this hunk din't mentioned that "r1" was cloberred (iirc in fixup text) wh=
ile
the 32bit one did:
 
#ifdef __LP64__
#define __put_kernel_asm(stx,x,ptr)                         \
       __asm__ __volatile__ (                              \
               "\n1:\t" stx "\t%2,0(%1)\n"                 \
               "\t.section __ex_table,\"aw\"\n"            \
               "\t.dword\t1b,fixup_put_user_skip_1\n"      \
               "\t.previous"                               \
               : "=3Dr"(__pu_err)                            \
               : "r"(ptr), "r"(x), "0"(__pu_err))
[snip]
#else
#define __put_kernel_asm(stx,x,ptr)                         \
       __asm__ __volatile__ (                              \
               "\n1:\t" stx "\t%2,0(%1)\n"                 \
               "\t.section __ex_table,\"aw\"\n"            \
                "\t.word\t1b,fixup_put_user_skip_1\n"      \
                "\t.previous"                              \
               : "=3Dr"(__pu_err)                            \
               : "r"(ptr), "r"(x), "0"(__pu_err)           \
               : "r1")
[snip]

mmm, doen't seems to change anything (I just check sys_parisc32.s) but ma=
y be
else where?

Thanks,
    Joel


=0A=0A---------------------------------------------------------------=0AA=
 free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore inf=
o on http://www.scarlet.be/
--_=__=_XaM3_.1144748258.2A.816162.42.473.52.42.007.1772815055
Content-Type: text/plain;
	name="=?iso-8859-1?Q?memcpy.c.beautify.diff?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?memcpy.c.beautify.diff?="

--- linux-2.6.17-rc1-pa1/arch/parisc/lib/memcpy.c.Orig	2006-04-10 07:24:3=
1.000000000 +0000=0A+++ linux-2.6.17-rc1-pa1/arch/parisc/lib/memcpy.c	200=
6-04-10 15:05:38.000000000 +0000=0A@@ -79,20 +79,24 @@=0A #define get_use=
r_space() (segment_eq(get_fs(), KERNEL_DS) ? 0 : mfsp(3))=0A #define get_=
kernel_space() (0)=0A =0A-#define MERGE(w0, sh_1, w1, sh_2)  ({					\=0A+=
#define MERGE(w0, sh_1, w1, sh_2)	({				\=0A 	unsigned int _r;						\=0A-=
	asm volatile (							\=0A-	"mtsar %3\n"							\=0A-	"shrpw %1, %2, %%sar=
, %0\n"					\=0A-	: "=3Dr"(_r)							\=0A-	: "r"(w0), "r"(w1), "r"(sh_2)	=
				\=0A+	__asm__ __volatile__ ("\n"					\=0A+	"	mtsar		%3\n"					\=0A+	"=
	shrpw		%1, %2,%%sar, %0"			\=0A+		: "=3Dr"(_r)						\=0A+		: "r"(w0), "r=
"(w1), "r"(sh_2)				\=0A 	);								\=0A 	_r;								\=0A })=0A #define T=
HRESHOLD	16=0A =0A #ifdef DEBUG_MEMCPY=0A-#define DPRINTF(fmt, args...) d=
o { printk(KERN_DEBUG "%s:%d:%s ", __FILE__, __LINE__, __FUNCTION__ ); pr=
intk(KERN_DEBUG fmt, ##args ); } while (0)=0A+#define DPRINTF(fmt, args..=
.) do {					\=0A+	printk(KERN_DEBUG "%s:%d:%s ",					\=0A+		__FILE__, __L=
INE__, __FUNCTION__ );			\=0A+	printk(KERN_DEBUG fmt, ##args );				\=0A+}=
 while (0)=0A #else=0A #define DPRINTF(fmt, args...)=0A #endif=0A@@ -103,=
69 +107,81 @@=0A #define EXC_WORD ".dword"=0A #endif=0A =0A-#define def_l=
oad_ai_insn(_insn,_sz,_tt,_s,_a,_t,_e)	\=0A-	__asm__ __volatile__ (				\=0A=
-	"1:\t" #_insn ",ma " #_sz "(" _s ",%1), %0\n" 	\=0A-	"\t.section __ex_t=
able,\"aw\"\n"		\=0A-	"\t" EXC_WORD "\t1b\n"				\=0A-	"\t" EXC_WORD "\t" =
#_e "\n"			\=0A-	"\t.previous\n"					\=0A-	: _tt(_t), "+r"(_a)				\=0A-	:=
 						\=0A-	: "r8")=0A-=0A-#define def_store_ai_insn(_insn,_sz,_tt,_s,_a=
,_t,_e) 	\=0A-	__asm__ __volatile__ (				\=0A-	"1:\t" #_insn ",ma %1, " #=
_sz "(" _s ",%0)\n" 	\=0A-	"\t.section __ex_table,\"aw\"\n"		\=0A-	"\t" E=
XC_WORD "\t1b\n"				\=0A-	"\t" EXC_WORD "\t" #_e "\n"			\=0A-	"\t.previou=
s\n"					\=0A-	: "+r"(_a) 					\=0A-	: _tt(_t)					\=0A-	: "r8")=0A-=0A-#=
define ldbma(_s, _a, _t, _e) def_load_ai_insn(ldbs,1,"=3Dr",_s,_a,_t,_e)=0A=
-#define stbma(_s, _t, _a, _e) def_store_ai_insn(stbs,1,"r",_s,_a,_t,_e)=0A=
-#define ldwma(_s, _a, _t, _e) def_load_ai_insn(ldw,4,"=3Dr",_s,_a,_t,_e)=
=0A-#define stwma(_s, _t, _a, _e) def_store_ai_insn(stw,4,"r",_s,_a,_t,_e=
)=0A-#define flddma(_s, _a, _t, _e) def_load_ai_insn(fldd,8,"=3Df",_s,_a,=
_t,_e)=0A-#define fstdma(_s, _t, _a, _e) def_store_ai_insn(fstd,8,"f",_s,=
_a,_t,_e)=0A-=0A-#define def_load_insn(_insn,_tt,_s,_o,_a,_t,_e) 	\=0A-	_=
_asm__ __volatile__ (				\=0A-	"1:\t" #_insn " " #_o "(" _s ",%1), %0\n"	=
\=0A-	"\t.section __ex_table,\"aw\"\n"		\=0A-	"\t" EXC_WORD "\t1b\n"				\=
=0A-	"\t" EXC_WORD "\t" #_e "\n"			\=0A-	"\t.previous\n"					\=0A-	: _tt(=
_t) 					\=0A-	: "r"(_a)					\=0A-	: "r8")=0A-=0A-#define def_store_insn(=
_insn,_tt,_s,_t,_o,_a,_e) 	\=0A-	__asm__ __volatile__ (				\=0A-	"1:\t" #=
_insn " %0, " #_o "(" _s ",%1)\n" 	\=0A-	"\t.section __ex_table,\"aw\"\n"=
		\=0A-	"\t" EXC_WORD "\t1b\n"				\=0A-	"\t" EXC_WORD "\t" #_e "\n"			\=0A=
-	"\t.previous\n"					\=0A-	: 						\=0A-	: _tt(_t), "r"(_a)				\=0A-	: "=
r8")=0A+#define def_load_ai_insn(_insn, _sz, _tt, _s, _a, _t, _e)		\=0A+	=
__asm__ __volatile__ ("\n"					\=0A+	"1:	" #_insn ",ma		" #_sz "(" _s ", =
%1), %0\n"	\=0A+	"	.section __ex_table,\"aw\"\n"				\=0A+	"	" EXC_WORD "	=
1b\n"					\=0A+	"	" EXC_WORD "	" #_e "\n"				\=0A+	"	.previous"						\=0A=
+		: _tt(_t), "+r"(_a)					\=0A+		: 							\=0A+		: "r8"							\=0A+	)=0A=
+=0A+#define def_store_ai_insn(_insn, _sz, _tt, _s, _a, _t, _e)		\=0A+	__=
asm__ __volatile__ ("\n"					\=0A+	"1:	" #_insn ",ma		%1, " #_sz "(" _s "=
, %0)\n" 	\=0A+	"	.section __ex_table,\"aw\"\n"				\=0A+	"	" EXC_WORD "	1=
b\n"					\=0A+	"	" EXC_WORD "	" #_e "\n"				\=0A+	"	.previous"						\=0A+=
		: "+r"(_a) 						\=0A+		: _tt(_t)						\=0A+		: "r8"							\=0A+	)=0A+=0A=
+#define ldbma(_s, _a, _t, _e) def_load_ai_insn(ldbs, 1, "=3Dr", _s, _a, =
_t, _e)=0A+#define stbma(_s, _t, _a, _e) def_store_ai_insn(stbs, 1, "r", =
_s, _a, _t, _e)=0A+#define ldwma(_s, _a, _t, _e) def_load_ai_insn(ldw, 4,=
 "=3Dr", _s, _a, _t, _e)=0A+#define stwma(_s, _t, _a, _e) def_store_ai_in=
sn(stw, 4, "r", _s, _a, _t, _e)=0A+#define flddma(_s, _a, _t, _e) def_loa=
d_ai_insn(fldd, 8, "=3Df", _s, _a, _t, _e)=0A+#define fstdma(_s, _t, _a, =
_e) def_store_ai_insn(fstd, 8, "f", _s, _a, _t, _e)=0A+=0A+#define def_lo=
ad_insn(_insn, _tt, _s, _o, _a, _t, _e) 			\=0A+	__asm__ __volatile__ ("\=
n"					\=0A+	"1:	" #_insn "		" #_o "(" _s ", %1), %0\n"	\=0A+	"	.section =
__ex_table,\"aw\"\n"				\=0A+	"	" EXC_WORD "	1b\n"					\=0A+	"	" EXC_WORD=
 "	" #_e "\n"				\=0A+	"	.previous"						\=0A+		: _tt(_t) 						\=0A+		: =
"r"(_a)						\=0A+		: "r8"							\=0A+	)=0A+=0A+#define def_store_insn(_i=
nsn, _tt, _s, _t, _o, _a, _e)			\=0A+	__asm__ __volatile__ ("\n"					\=0A=
+	"1:	" #_insn "		%0, " #_o "(" _s ", %1)\n"	\=0A+	"	.section __ex_table,=
\"aw\"\n"				\=0A+	"	" EXC_WORD "	1b\n"					\=0A+	"	" EXC_WORD "	" #_e "\=
n"				\=0A+	"	.previous"						\=0A+		: 							\=0A+		: _tt(_t), "r"(_a)		=
			\=0A+		: "r8"							\=0A+	)=0A =0A-#define ldw(_s,_o,_a,_t,_e)	def_loa=
d_insn(ldw,"=3Dr",_s,_o,_a,_t,_e)=0A-#define stw(_s,_t,_o,_a,_e) 	def_sto=
re_insn(stw,"r",_s,_t,_o,_a,_e)=0A+#define ldw(_s, _o, _a, _t, _e)	def_lo=
ad_insn(ldw, "=3Dr", _s, _o, _a, _t, _e)=0A+#define stw(_s, _t, _o, _a, _=
e)	def_store_insn(stw, "r", _s, _t, _o, _a, _e)=0A =0A #ifdef  CONFIG_PRE=
FETCH=0A extern inline void prefetch_src(const void *addr)=0A {=0A-	__asm=
__("ldw 0(" s_space ",%0), %%r0" : : "r" (addr));=0A+	__asm__ ("\n"=0A+	"=
	ldw		0(" s_space ", %0), %%r0"=0A+		:=0A+		: "r" (addr)=0A+	);=0A }=0A =0A=
 extern inline void prefetch_dst(const void *addr)=0A {=0A-	__asm__("ldd =
0(" d_space ",%0), %%r0" : : "r" (addr));=0A+	__asm__ ("\n"=0A+	"	ldd		0(=
" d_space ", %0), %%r0"=0A+		:=0A+		: "r" (addr)=0A+	);=0A }=0A #else=0A =
#define prefetch_src(addr)=0A@@ -278,14 +294,14 @@=0A 	return 0;=0A =0A h=
andle_load_error:=0A-	__asm__ __volatile__ ("cda_ldw_exc:\n");=0A+	__asm_=
_ __volatile__ ("\ncda_ldw_exc:\n");=0A 	d =3D &__get_cpu_var(exception_d=
ata);=0A 	DPRINTF("cda_ldw_exc: o_len=3D%lu fault_addr=3D%lu o_src=3D%lu =
ret=3D%lu\n",=0A 		o_len, d->fault_addr, o_src, o_len - d->fault_addr + o=
_src);=0A 	return o_len * 4 - d->fault_addr + o_src;=0A =0A handle_store_=
error:=0A-	__asm__ __volatile__ ("cda_stw_exc:\n");=0A+	__asm__ __volatil=
e__ ("\ncda_stw_exc:\n");=0A 	d =3D &__get_cpu_var(exception_data);=0A 	D=
PRINTF("cda_stw_exc: o_len=3D%lu fault_addr=3D%lu o_dst=3D%lu ret=3D%lu\n=
",=0A 		o_len, d->fault_addr, o_dst, o_len - d->fault_addr + o_dst);=0A@@=
 -374,7 +390,7 @@=0A =0A word_copy:=0A 	while (len >=3D 8*sizeof(unsigned=
 int)) {=0A-		register unsigned int r1,r2,r3,r4,r5,r6,r7,r8;=0A+		registe=
r unsigned int r1, r2, r3, r4, r5, r6, r7, r8;=0A 		/* prefetch_src((char=
 *)pws + L1_CACHE_BYTES); */=0A 		ldwma(s_space, pws, r1, pmc_load_exc);=0A=
 		ldwma(s_space, pws, r2, pmc_load_exc);=0A@@ -397,7 +413,7 @@=0A 	}=0A =
=0A 	while (len >=3D 4*sizeof(unsigned int)) {=0A-		register unsigned int=
 r1,r2,r3,r4;=0A+		register unsigned int r1, r2, r3, r4;=0A 		ldwma(s_spa=
ce, pws, r1, pmc_load_exc);=0A 		ldwma(s_space, pws, r2, pmc_load_exc);=0A=
 		ldwma(s_space, pws, r3, pmc_load_exc);=0A@@ -472,14 +488,14 @@=0A 	got=
o byte_copy;=0A =0A handle_load_error:=0A-	__asm__ __volatile__ ("pmc_loa=
d_exc:\n");=0A+	__asm__ __volatile__ ("\npmc_load_exc:\n");=0A 	d =3D &__=
get_cpu_var(exception_data);=0A 	DPRINTF("pmc_load_exc: o_len=3D%lu fault=
_addr=3D%lu o_src=3D%lu ret=3D%lu\n",=0A 		o_len, d->fault_addr, o_src, o=
_len - d->fault_addr + o_src);=0A 	return o_len - d->fault_addr + o_src;=0A=
 =0A handle_store_error:=0A-	__asm__ __volatile__ ("pmc_store_exc:\n");=0A=
+	__asm__ __volatile__ ("\npmc_store_exc:\n");=0A 	d =3D &__get_cpu_var(e=
xception_data);=0A 	DPRINTF("pmc_store_exc: o_len=3D%lu fault_addr=3D%lu =
o_dst=3D%lu ret=3D%lu\n",=0A 		o_len, d->fault_addr, o_dst, o_len - d->fa=
ult_addr + o_dst);=0A
--_=__=_XaM3_.1144748258.2A.816162.42.473.52.42.007.1772815055
Content-Type: text/plain;
	name="=?iso-8859-1?Q?uaccess.h.beautify.diff?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?uaccess.h.beautify.diff?="

--- linux-2.6.17-rc1-pa1/include/asm-parisc/uaccess.h.Orig	2006-04-10 14:=
05:32.000000000 +0000=0A+++ linux-2.6.17-rc1-pa1/include/asm-parisc/uacce=
ss.h	2006-04-10 16:28:14.000000000 +0000=0A@@ -76,97 +76,122 @@=0A 	unsig=
ned long fault_addr;=0A };=0A =0A-#define __get_user(x,ptr)              =
                 \=0A-({                                                 =
     \=0A-	register long __gu_err __asm__ ("r8") =3D 0;      \=0A-	regist=
er long __gu_val __asm__ ("r9") =3D 0;      \=0A-							\=0A-	if (segment=
_eq(get_fs(),KERNEL_DS)) {           \=0A-	    switch (sizeof(*(ptr))) { =
                  \=0A-	    case 1: __get_kernel_asm("ldb",ptr); break; \=
=0A-	    case 2: __get_kernel_asm("ldh",ptr); break; \=0A-	    case 4: __=
get_kernel_asm("ldw",ptr); break; \=0A-	    case 8: LDD_KERNEL(ptr); brea=
k;		\=0A-	    default: __get_kernel_bad(); break;         \=0A-	    }    =
                                       \=0A-	}                           =
                    \=0A-	else {                                         =
 \=0A-	    switch (sizeof(*(ptr))) {                   \=0A-	    case 1: =
__get_user_asm("ldb",ptr); break;   \=0A-	    case 2: __get_user_asm("ldh=
",ptr); break;   \=0A-	    case 4: __get_user_asm("ldw",ptr); break;   \=0A=
-	    case 8: LDD_USER(ptr);  break;		\=0A-	    default: __get_user_bad()=
; break;           \=0A-	    }                                           =
\=0A-	}                                               \=0A-							\=0A-	(=
x) =3D (__typeof__(*(ptr))) __gu_val;            \=0A-	__gu_err;         =
                              \=0A+#define __get_user(x, ptr)	({				\=0A+=
								\=0A+	register long __gu_err __asm__ ("r8") =3D 0;		\=0A+	registe=
r long __gu_val __asm__ ("r9") =3D 0;		\=0A+								\=0A+	if (segment_eq(=
get_fs(), KERNEL_DS)) {			\=0A+		switch (sizeof(*(ptr))) {			\=0A+			case=
 1: __get_kernel_asm("ldb", ptr);	\=0A+				break;				\=0A+			case 2: __ge=
t_kernel_asm("ldh", ptr);	\=0A+				break;				\=0A+			case 4: __get_kernel=
_asm("ldw", ptr);	\=0A+				break;				\=0A+			case 8: LDD_KERNEL(ptr);		\=0A=
+				break;				\=0A+			default: __get_kernel_bad();		\=0A+				break;				\=
=0A+		}						\=0A+	} else {						\=0A+		switch (sizeof(*(ptr))) {			\=0A+=
			case 1: __get_user_asm("ldb", ptr);	\=0A+				break;				\=0A+			case 2:=
 __get_user_asm("ldh", ptr);	\=0A+				break;				\=0A+			case 4: __get_use=
r_asm("ldw", ptr);	\=0A+				break;				\=0A+			case 8: LDD_USER(ptr);			\=0A=
+				break;				\=0A+			default: __get_user_bad();		\=0A+				break;				\=0A=
+		}						\=0A+	}							\=0A+								\=0A+	(x) =3D (__typeof__(*(ptr))) _=
_gu_val;			\=0A+	__gu_err;						\=0A })=0A =0A #ifdef __LP64__=0A-#define=
 __get_kernel_asm(ldx,ptr)                       \=0A-	__asm__("\n1:\t" l=
dx "\t0(%2),%0\n"             \=0A-		"\t.section __ex_table,\"aw\"\n"    =
    \=0A-		"\t.dword\t1b,fixup_get_user_skip_1\n"	\=0A-		"\t.previous"   =
                       	\=0A-		: "=3Dr"(__gu_val), "=3Dr"(__gu_err)      =
  \=0A+#define __get_kernel_asm(ldx, ptr)			\=0A+	__asm__ ("\n"					\=0A+=
	"1:	" ldx "		0(%2), %0\n"		\=0A+	"	.section __ex_table,\"aw\"\n"		\=0A+	=
"	.dword	1b, fixup_get_user_skip_1\n"	\=0A+	"	.previous"				\=0A+		: "=3D=
r"(__gu_val), "=3Dr"(__gu_err)	\=0A 		: "r"(ptr), "1"(__gu_err)		\=0A-		:=
 "r1");=0A+		: "r1"					\=0A+	)=0A =0A-#define __get_user_asm(ldx,ptr)   =
                      \=0A-	__asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"    =
   \=0A-		"\t.section __ex_table,\"aw\"\n"	\=0A-		"\t.dword\t1b,fixup_get=
_user_skip_1\n"	\=0A-		"\t.previous"				\=0A-		: "=3Dr"(__gu_val), "=3Dr"=
(__gu_err)        \=0A+#define __get_user_asm(ldx, ptr)			\=0A+	__asm__ (=
"\n"					\=0A+	"1:	" ldx "		0(%%sr3, %2), %0\n"	\=0A+	"	.section __ex_tab=
le,\"aw\"\n"		\=0A+	"	.dword	1b, fixup_get_user_skip_1\n"	\=0A+	"	.previo=
us"				\=0A+		: "=3Dr"(__gu_val), "=3Dr"(__gu_err)	\=0A 		: "r"(ptr), "1"=
(__gu_err)		\=0A-		: "r1");=0A+		: "r1"					\=0A+	)=0A #else=0A-#define _=
_get_kernel_asm(ldx,ptr)                       \=0A-	__asm__("\n1:\t" ldx=
 "\t0(%2),%0\n"             \=0A-		"\t.section __ex_table,\"aw\"\n"      =
  \=0A-		"\t.word\t1b,fixup_get_user_skip_1\n"	\=0A-		"\t.previous"      =
                    	\=0A-		: "=3Dr"(__gu_val), "=3Dr"(__gu_err)        \=
=0A+#define __get_kernel_asm(ldx, ptr)			\=0A+	__asm__ ("\n"					\=0A+	"1=
:	" ldx "		0(%2), %0\n"		\=0A+	"	.section __ex_table,\"aw\"\n"		\=0A+	"	.=
word	1b, fixup_get_user_skip_1\n"	\=0A+	"	.previous"				\=0A+		: "=3Dr"(_=
_gu_val), "=3Dr"(__gu_err)	\=0A 		: "r"(ptr), "1"(__gu_err)		\=0A-		: "r1=
");=0A+		: "r1"					\=0A+	)=0A =0A-#define __get_user_asm(ldx,ptr)       =
                  \=0A-	__asm__("\n1:\t" ldx "\t0(%%sr3,%2),%0\n"       \=
=0A-		"\t.section __ex_table,\"aw\"\n"	\=0A-		 "\t.word\t1b,fixup_get_use=
r_skip_1\n"	\=0A-		 "\t.previous"                          \=0A-		: "=3Dr=
"(__gu_val), "=3Dr"(__gu_err)        \=0A+#define __get_user_asm(ldx, ptr=
)			\=0A+	__asm__ ("\n"					\=0A+	"1:	" ldx "		0(%%sr3, %2), %0\n"	\=0A+	=
"	.section __ex_table,\"aw\"\n"		\=0A+	"	.word	1b, fixup_get_user_skip_1\=
n"	\=0A+	"	.previous"				\=0A+		: "=3Dr"(__gu_val), "=3Dr"(__gu_err)	\=0A=
 		: "r"(ptr), "1"(__gu_err)		\=0A-		: "r1");=0A+		: "r1"					\=0A+	)=0A =
#endif /* !__LP64__ */=0A =0A-#define __put_user(x,ptr)                  =
                     \=0A-({								\=0A-	register long __pu_err __asm__ =
("r8") =3D 0;      	\=0A-        __typeof__(*(ptr)) __x =3D (__typeof__(*=
(ptr)))(x);	\=0A-								\=0A-	if (segment_eq(get_fs(),KERNEL_DS)) {     =
              \=0A-	    switch (sizeof(*(ptr))) {                        =
   \=0A-	    case 1: __put_kernel_asm("stb",__x,ptr); break;     \=0A-	  =
  case 2: __put_kernel_asm("sth",__x,ptr); break;     \=0A-	    case 4: _=
_put_kernel_asm("stw",__x,ptr); break;     \=0A-	    case 8: STD_KERNEL(_=
_x,ptr); break;			\=0A-	    default: __put_kernel_bad(); break;			\=0A-	 =
   }                                                   \=0A-	}           =
                                            \=0A-	else {                 =
                                 \=0A-	    switch (sizeof(*(ptr))) {     =
                      \=0A-	    case 1: __put_user_asm("stb",__x,ptr); br=
eak;       \=0A-	    case 2: __put_user_asm("sth",__x,ptr); break;       =
\=0A-	    case 4: __put_user_asm("stw",__x,ptr); break;       \=0A-	    c=
ase 8: STD_USER(__x,ptr); break;			\=0A-	    default: __put_user_bad(); b=
reak;			\=0A-	    }                                                   \=0A=
-	}                                                       \=0A-								\=0A=
-	__pu_err;						\=0A+#define __put_user(x, ptr)	({					\=0A+									\=0A=
+	register long __pu_err __asm__ ("r8") =3D 0;			\=0A+        __typeof__(=
*(ptr)) __x =3D (__typeof__(*(ptr)))(x);		\=0A+									\=0A+	if (segment=
_eq(get_fs(),KERNEL_DS)) {				\=0A+		switch (sizeof(*(ptr))) {				\=0A+		=
	case 1: __put_kernel_asm("stb", __x, ptr);	\=0A+				break;					\=0A+			c=
ase 2: __put_kernel_asm("sth", __x, ptr);	\=0A+				break;					\=0A+			cas=
e 4: __put_kernel_asm("stw", __x, ptr);	\=0A+				break;					\=0A+			case =
8: STD_KERNEL(__x, ptr);			\=0A+				break;					\=0A+			default: __put_ker=
nel_bad();			\=0A+				break;					\=0A+		}							\=0A+	} else {							\=0A=
+		switch (sizeof(*(ptr))) {				\=0A+			case 1: __put_user_asm("stb", __x=
, ptr);	\=0A+				break;					\=0A+			case 2: __put_user_asm("sth", __x, pt=
r);	\=0A+				break;					\=0A+			case 4: __put_user_asm("stw", __x, ptr);	=
\=0A+				break;					\=0A+			case 8: STD_USER(__x, ptr);			\=0A+				break;=
					\=0A+			default: __put_user_bad();			\=0A+				break;					\=0A+		}			=
				\=0A+	}								\=0A+	__pu_err;							\=0A })=0A =0A /*=0A@@ -176,75 +=
201,82 @@=0A  */=0A =0A #ifdef __LP64__=0A-#define __put_kernel_asm(stx,x=
,ptr)                         \=0A-	__asm__ __volatile__ (               =
               \=0A-		"\n1:\t" stx "\t%2,0(%1)\n"                 \=0A-		=
"\t.section __ex_table,\"aw\"\n"            \=0A-		"\t.dword\t1b,fixup_pu=
t_user_skip_1\n"	    \=0A-		"\t.previous"                               \=
=0A-		: "=3Dr"(__pu_err)                            \=0A-		: "r"(ptr), "r=
"(x), "0"(__pu_err))=0A-=0A-#define __put_user_asm(stx,x,ptr)            =
               \=0A-	__asm__ __volatile__ (                              =
\=0A-		"\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \=0A-		"\t.section __e=
x_table,\"aw\"\n"            \=0A-		 "\t.dword\t1b,fixup_put_user_skip_1\=
n"	    \=0A-		 "\t.previous"                              \=0A-		: "=3Dr"=
(__pu_err)                            \=0A-		: "r"(ptr), "r"(x), "0"(__pu=
_err)	    \=0A-		: "r1")=0A+#define __put_kernel_asm(stx, x, ptr)			\=0A+=
	__asm__ __volatile__ ("\n"			\=0A+	"1:	" stx "		%2, 0(%1)\n"		\=0A+	"	.s=
ection __ex_table,\"aw\"\n"		\=0A+	"	.dword	1b, fixup_put_user_skip_1\n"	=
\=0A+	"	.previous"				\=0A+		: "=3Dr"(__pu_err)			\=0A+		: "r"(ptr), "r"(=
x), "0"(__pu_err)	\=0A+		: "r1"					\=0A+	)=0A+=0A+#define __put_user_asm=
(stx, x, ptr)			\=0A+	__asm__ __volatile__ ("\n"			\=0A+	"1:	" stx "		%2,=
 0(%%sr3, %1)\n"	\=0A+	"	.section __ex_table,\"aw\"\n"		\=0A+	"	.dword	1b=
, fixup_put_user_skip_1\n"    \=0A+	"	.previous"				\=0A+		: "=3Dr"(__pu_=
err)			\=0A+		: "r"(ptr), "r"(x), "0"(__pu_err)	\=0A+		: "r1"					\=0A+	)=
=0A #else=0A-#define __put_kernel_asm(stx,x,ptr)                         =
\=0A-	__asm__ __volatile__ (                              \=0A-		"\n1:\t"=
 stx "\t%2,0(%1)\n"                 \=0A-		"\t.section __ex_table,\"aw\"\=
n"            \=0A-		 "\t.word\t1b,fixup_put_user_skip_1\n"	    \=0A-		 "=
\t.previous"                              \=0A-		: "=3Dr"(__pu_err)      =
                      \=0A-		: "r"(ptr), "r"(x), "0"(__pu_err)	    \=0A-	=
	: "r1")=0A-=0A-#define __put_user_asm(stx,x,ptr)                        =
   \=0A-	__asm__ __volatile__ (                              \=0A-		"\n1:=
\t" stx "\t%2,0(%%sr3,%1)\n"           \=0A-		"\t.section __ex_table,\"aw=
\"\n"            \=0A-		 "\t.word\t1b,fixup_put_user_skip_1\n"      \=0A-=
		 "\t.previous"                              \=0A-		: "=3Dr"(__pu_err)  =
                          \=0A-		: "r"(ptr), "r"(x), "0"(__pu_err)	    \=0A=
-		: "r1")=0A-=0A-#define __put_kernel_asm64(__val,ptr) do {		    	    \=0A=
-	u64 __val64 =3D (u64)(__val);				    \=0A-	u32 hi =3D (__val64) >> 32;	=
				    \=0A-	u32 lo =3D (__val64) & 0xffffffff;				    \=0A-	__asm__ __v=
olatile__ (				    \=0A-		"\n1:\tstw %2,0(%1)\n"			    \=0A-		"\n2:\tstw =
%3,4(%1)\n"			    \=0A-		"\t.section __ex_table,\"aw\"\n"	    \=0A-		 "\t=
.word\t1b,fixup_put_user_skip_2\n"	    \=0A-		 "\t.word\t2b,fixup_put_use=
r_skip_1\n"	    \=0A-		 "\t.previous"				    \=0A-		: "=3Dr"(__pu_err)   =
                         \=0A-		: "r"(ptr), "r"(hi), "r"(lo), "0"(__pu_er=
r) \=0A-		: "r1");				    \=0A+#define __put_kernel_asm(stx, x, ptr)			\=0A=
+	__asm__ __volatile__ ("\n"			\=0A+	"1:	" stx "		%2, 0(%1)\n"		\=0A+	"	.=
section __ex_table,\"aw\"\n"		\=0A+	"	.word	1b, fixup_put_user_skip_1\n"	=
\=0A+	"	.previous"				\=0A+		: "=3Dr"(__pu_err)			\=0A+		: "r"(ptr), "r"(=
x), "0"(__pu_err)	\=0A+		: "r1"					\=0A+	)=0A+=0A+#define __put_user_asm=
(stx, x, ptr)			\=0A+	__asm__ __volatile__ ("\n"			\=0A+	"1:	" stx "		%2,=
 0(%%sr3, %1)\n"	\=0A+	"	.section __ex_table,\"aw\"\n"		\=0A+	"	.word	1b,=
 fixup_put_user_skip_1\n"	\=0A+	"	.previous"				\=0A+		: "=3Dr"(__pu_err)=
			\=0A+		: "r"(ptr), "r"(x), "0"(__pu_err)	\=0A+		: "r1"					\=0A+	)=0A+=
=0A+#define __put_kernel_asm64(__val, ptr) do {			\=0A+	u64 __val64 =3D (=
u64)(__val);				\=0A+	u32 hi =3D (__val64) >> 32;				\=0A+	u32 lo =3D (__=
val64) & 0xffffffff;			\=0A+	__asm__ __volatile__ ("\n"				\=0A+	"1:	stw	=
	%2, 0(%1)\n"			\=0A+	"2:	stw		%3, 4(%1)\n"			\=0A+	"	.section __ex_table=
,\"aw\"\n"			\=0A+	"	.word	1b, fixup_put_user_skip_2\n"		\=0A+	"	.word	2b=
, fixup_put_user_skip_1\n"		\=0A+	"	.previous"					\=0A+		: "=3Dr"(__pu_e=
rr)				\=0A+		: "r"(ptr), "r"(hi), "r"(lo), "0"(__pu_err)	\=0A+		: "r1"		=
				\=0A+	);							\=0A } while (0)=0A =0A-#define __put_user_asm64(__val=
,ptr) do {		    	    \=0A-	u64 __val64 =3D (u64)__val;				    \=0A-	u32 h=
i =3D (__val64) >> 32;					    \=0A-	u32 lo =3D (__val64) & 0xffffffff;		=
		    \=0A-	__asm__ __volatile__ (				    \=0A-		"\n1:\tstw %2,0(%%sr3,%1=
)\n"		    \=0A-		"\n2:\tstw %3,4(%%sr3,%1)\n"		    \=0A-		"\t.section __e=
x_table,\"aw\"\n"	    \=0A-		 "\t.word\t1b,fixup_get_user_skip_2\n"	    \=
=0A-		 "\t.word\t2b,fixup_get_user_skip_1\n"	    \=0A-		 "\t.previous"			=
	    \=0A-		: "=3Dr"(__pu_err)                            \=0A-		: "r"(pt=
r), "r"(hi), "r"(lo), "0"(__pu_err) \=0A-		: "r1");				    \=0A+#define _=
_put_user_asm64(__val, ptr) do {			\=0A+	u64 __val64 =3D (u64)__val;				\=
=0A+	u32 hi =3D (__val64) >> 32;				\=0A+	u32 lo =3D (__val64) & 0xffffff=
ff;			\=0A+	__asm__ __volatile__ ("\n"				\=0A+	"1:	stw		%2, 0(%%sr3, %1)=
\n"		\=0A+	"2:	stw		%3, 4(%%sr3, %1)\n"		\=0A+	"	.section __ex_table,\"aw=
\"\n"			\=0A+	"	.word	1b, fixup_get_user_skip_2\n"		\=0A+	"	.word	2b, fix=
up_get_user_skip_1\n"		\=0A+	"	.previous"					\=0A+		: "=3Dr"(__pu_err)		=
		\=0A+		: "r"(ptr), "r"(hi), "r"(lo), "0"(__pu_err)	\=0A+		: "r1"						\=
=0A+	);							\=0A } while (0)=0A =0A #endif /* !__LP64__ */=0A@@ -256,7 =
+288,8 @@=0A =0A extern unsigned long lcopy_to_user(void __user *, const =
void *, unsigned long);=0A extern unsigned long lcopy_from_user(void *, c=
onst void __user *, unsigned long);=0A-extern unsigned long lcopy_in_user=
(void __user *, const void __user *, unsigned long);=0A+extern unsigned l=
ong lcopy_in_user(void __user *, const void __user *,=0A+					unsigned lo=
ng);=0A extern long lstrncpy_from_user(char *, const char __user *, long)=
;=0A extern unsigned lclear_user(void __user *,unsigned long);=0A extern =
long lstrnlen_user(const char __user *,long);=0A@@ -265,19 +298,24 @@=0A =
 * Complex access routines -- macros=0A  */=0A =0A-#define strncpy_from_u=
ser lstrncpy_from_user=0A-#define strnlen_user lstrnlen_user=0A-#define s=
trlen_user(str) lstrnlen_user(str, 0x7fffffffL)=0A-#define clear_user lcl=
ear_user=0A-#define __clear_user lclear_user=0A-=0A-unsigned long copy_to=
_user(void __user *dst, const void *src, unsigned long len);=0A-#define _=
_copy_to_user copy_to_user=0A-unsigned long copy_from_user(void *dst, con=
st void __user *src, unsigned long len);=0A-#define __copy_from_user copy=
_from_user=0A-unsigned long copy_in_user(void __user *dst, const void __u=
ser *src, unsigned long len);=0A-#define __copy_in_user copy_in_user=0A-#=
define __copy_to_user_inatomic __copy_to_user=0A-#define __copy_from_user=
_inatomic __copy_from_user=0A+#define strncpy_from_user	lstrncpy_from_use=
r=0A+#define strnlen_user		lstrnlen_user=0A+#define strlen_user(str)	lstr=
nlen_user(str, 0x7fffffffL)=0A+#define clear_user		lclear_user=0A+#define=
 __clear_user		lclear_user=0A+=0A+unsigned long copy_to_user(void __user =
*dst, const void *src,=0A+				unsigned long len);=0A+#define __copy_to_us=
er	copy_to_user=0A+=0A+unsigned long copy_from_user(void *dst, const void=
 __user *src,=0A+				unsigned long len);=0A+#define __copy_from_user 	cop=
y_from_user=0A+=0A+unsigned long copy_in_user(void __user *dst, const voi=
d __user *src,=0A+				unsigned long len);=0A+#define __copy_in_user			cop=
y_in_user=0A+#define __copy_to_user_inatomic		__copy_to_user=0A+#define _=
_copy_from_user_inatomic	__copy_from_user=0A =0A #endif /* __PARISC_UACCE=
SS_H */=0A
--_=__=_XaM3_.1144748258.2A.816162.42.473.52.42.007.1772815055
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--_=__=_XaM3_.1144748258.2A.816162.42.473.52.42.007.1772815055--
