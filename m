From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
	__put_kernel_asm() 64bit?
Date: Fri, 21 Apr 2006 10:13:31 +0100
Message-ID: <IY2EYJ$B66EBAC0020CC120973C76DCF7A32794@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="_=__=_XaM3_.1145610812.2A.67635.42.18204.52.42.007.582837036"
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "carlos" <carlos@systemhalted.org>
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

--_=__=_XaM3_.1145610812.2A.67635.42.18204.52.42.007.582837036
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> On 4/20/06, Joel Soete <soete.joel@tiscali.be> wrote:
> > Please help me I hate this game:
> >   - tel me why?
> >   - no tel me why not?
> >   - ...
> 
> This is all part of learning. We want to teach you to do some of the
> research yourself before emailing to the list. When you send email you
> should have some research done which contributes to the solution of
> the problem. For example the research you have done below is exactly
> what I would have expected from a serious hacker. This is an excellent
> amount of research! Good work Joel.
> 
Ok next time I will do so 

> > > a) What does a clobber mean from the viewpoint of an __asm?
> >
> > Sorry, I was the first to put this question:
> > "btw I had another question: what's the meaning of 'clobber' in the s=
ens of
> > asm extension of gcc?
> 
> *I* know the answer. The question is intended for you to learn how to r=
esearch.
> Google is a horrible research tool. I recommend going to the source. GC=
C has
> great manuals.
> 
> a) Go to "http://gcc.gnu.org/"
> b) Click on "Manual"
> c) Click on "GCC 4.1.0 Manual"
> d) Read sections 5.34 and 5.35 describing the behaviour of asm's.
> 
> Please read the manuals if you don't know the answer. It keeps others f=
rom
> being frustrated. The manuals were written for a reason.
> 
installing gcc-4.0-doc dpkg is also a way to access to info files ;-)

According to your next mail:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2006-April/028827.h=
tml>

Here attched is the patch proposal (just includes some few white space
cleanup) ;-)

Thanks a lot all,
    Joel

--_=__=_XaM3_.1145610812.2A.67635.42.18204.52.42.007.582837036
Content-Type: text/plain;
	name="=?iso-8859-1?Q?FixupUpdate.diff?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="=?iso-8859-1?Q?FixupUpdate.diff?="

--- ./include/asm-parisc/uaccess.h.Orig	2005-09-14 14:57:40.000000000 +02=
00=0A+++ ./include/asm-parisc/uaccess.h	2006-04-21 10:32:54.000000000 +02=
00=0A@@ -49,20 +49,20 @@=0A #define STD_KERNEL(x, ptr)	__put_kernel_asm64=
(x,ptr)=0A #define STD_USER(x, ptr)	__put_user_asm64(x,ptr)=0A #else=0A-#=
define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)=0A-#define LDD_USER(pt=
r) __get_user_asm("ldd",ptr)=0A-#define STD_KERNEL(x, ptr) __put_kernel_a=
sm("std",x,ptr)=0A-#define STD_USER(x, ptr) __put_user_asm("std",x,ptr)=0A=
+#define LDD_KERNEL(ptr)		__get_kernel_asm("ldd",ptr)=0A+#define LDD_USER=
(ptr)		__get_user_asm("ldd",ptr)=0A+#define STD_KERNEL(x, ptr)	__put_kern=
el_asm("std",x,ptr)=0A+#define STD_USER(x, ptr)	__put_user_asm("std",x,pt=
r)=0A #endif=0A =0A /*=0A  * The exception table contains two values: the=
 first is an address=0A  * for an instruction that is allowed to fault, a=
nd the second is=0A- * the address to the fixup routine. =0A+ * the addre=
ss to the fixup routine.=0A  */=0A =0A struct exception_table_entry {=0A-=
	unsigned long insn;  /* address of insn that is allowed to fault.   */=0A=
+	unsigned long insn;  /* address of insn that is allowed to fault. */=0A=
 	long fixup;          /* fixup routine */=0A };=0A =0A@@ -76,6 +76,58 @@=
=0A 	unsigned long fault_addr;=0A };=0A =0A+/*=0A+  Refering to Carlos' m=
ail:=0A+  <http://lists.parisc-linux.org/pipermail/parisc-linux/2006-Apri=
l/028827.html>=0A+=0A+  Routines used reside in:=0A+  ~~~~~~~~~~~~~~~~~=0A=
+  kernel/entry.S=0A+  kernel/traps.c=0A+  mm/fault.c=0A+=0A+  Exception =
Stages:=0A+  ~~~~~~~~~~~~~~=0A+  Exception happens.=0A+  Trap handler exe=
cutes.=0A+  We don't handle the exception in assembly(?)=0A+  Shadow regi=
sters are not enough to execute C code.=0A+  All registers saved.=0A+  Lo=
ad or Store has an exception table entry "fixup" in the kernel.=0A+  iaoq=
[0] and iaoq[1] are set to the address of the fixup.=0A+  PSW has the B-b=
it zeroed.=0A+  When the interrupt returns you execute the fixup function=
.=0A+=0A+  A: The process of interruption does not clobber any registers.=
=0A+  Corollory: The process of fixup uses r8/r9 as outputs, with r1 clob=
bered.=0A+=0A+  A: The fixups run in the original context of the failed l=
oad/store.=0A+=0A+  Generic Fixup Functions=0A+  ~~~~~~~~~~~~~~~~~~=0A+  =
There are 4 generic fixup functions:=0A+  The first 2 correspond to faile=
d loads.=0A+  The second 2 correspond to failed stores.=0A+  There is als=
o a FIXUP_BRANCH in the emulation routines.=0A+=0A+  arch/parisc/lib/fixu=
p.S=0A+  fixup_get_user_skip_1  (Skip 1 word, used in 32-bit mode)=0A+  f=
ixup_get_user_skip_2  (Skip 2 words, used in 64-bit mode)=0A+  fixup_put_=
user_skip_1  ( " )=0A+  fixup_put_user_skip_2  ( " )=0A+=0A+  The macro "=
get_fault_ip" is used by each of the 4 generic=0A+  fixups and clobbers b=
oth inputs and r1.=0A+=0A+  The registers used for each of the following =
functions:=0A+  r8 - Stores return value / Used as temp in "get_fault_ip1=
" clobbered.=0A+=0A+  Caveats:=0A+  - The fixup routines read the excepti=
on tables but don't list that=0A+    memory as an input. Hence mixing put=
 and get user/kernel=0A+    calls and modifications to the exception tabl=
es is dangerous?=0A+ */=0A+=0A #define __get_user(x,ptr)                 =
              \=0A ({                                                    =
  \=0A 	register long __gu_err __asm__ ("r8") =3D 0;      \=0A@@ -183,7 +=
235,8 @@=0A 		"\t.dword\t1b,fixup_put_user_skip_1\n"	    \=0A 		"\t.previ=
ous"                               \=0A 		: "=3Dr"(__pu_err)             =
               \=0A-		: "r"(ptr), "r"(x), "0"(__pu_err))=0A+		: "r"(ptr),=
 "r"(x), "0"(__pu_err)	    \=0A+		: "r1")=0A =0A #define __put_user_asm(s=
tx,x,ptr)                           \=0A 	__asm__ __volatile__ (         =
                     \=0A@@ -215,10 +268,10 @@=0A 		: "r"(ptr), "r"(x), "=
0"(__pu_err)	    \=0A 		: "r1")=0A =0A-#define __put_kernel_asm64(__val,p=
tr) do {		    	    \=0A-	u64 __val64 =3D (u64)(__val);				    \=0A-	u32 h=
i =3D (__val64) >> 32;					    \=0A-	u32 lo =3D (__val64) & 0xffffffff;		=
		    \=0A+#define __put_kernel_asm64(__val,ptr) do {		    \=0A+	u64 __va=
l64 =3D (u64)(__val);			    \=0A+	u32 hi =3D (__val64) >> 32;			    \=0A+=
	u32 lo =3D (__val64) & 0xffffffff;		    \=0A 	__asm__ __volatile__ (				=
    \=0A 		"\n1:\tstw %2,0(%1)\n"			    \=0A 		"\n2:\tstw %3,4(%1)\n"			 =
   \=0A@@ -231,10 +284,10 @@=0A 		: "r1");				    \=0A } while (0)=0A =0A=
-#define __put_user_asm64(__val,ptr) do {		    	    \=0A-	u64 __val64 =3D=
 (u64)__val;				    \=0A-	u32 hi =3D (__val64) >> 32;					    \=0A-	u32 l=
o =3D (__val64) & 0xffffffff;				    \=0A+#define __put_user_asm64(__val,=
ptr) do {		    \=0A+	u64 __val64 =3D (u64)__val;			    \=0A+	u32 hi =3D (=
__val64) >> 32;			    \=0A+	u32 lo =3D (__val64) & 0xffffffff;		    \=0A =
	__asm__ __volatile__ (				    \=0A 		"\n1:\tstw %2,0(%%sr3,%1)\n"		    \=
=0A 		"\n2:\tstw %3,4(%%sr3,%1)\n"		    \=0A--- ./arch/parisc/kernel/unal=
igned.c.Orig	2006-04-21 10:36:23.000000000 +0200=0A+++ ./arch/parisc/kern=
el/unaligned.c	2006-04-21 10:45:18.000000000 +0200=0A@@ -39,13 +39,15 @@=0A=
 #define RFMT "%08lx"=0A #endif=0A =0A-#define FIXUP_BRANCH(lbl) \=0A+/* =
see <include/asm-parisc/uaccess.h> Carlos' mail reference */=0A+=0A+#defi=
ne FIXUP_BRANCH(lbl)				\=0A 	"\tldil L%%" #lbl ", %%r1\n"			\=0A 	"\tldo=
 R%%" #lbl "(%%r1), %%r1\n"		\=0A 	"\tbv,n %%r0(%%r1)\n"=0A =0A /* 1111 1=
100 0000 0000 0001 0011 1100 0000 */=0A-#define OPCODE1(a,b,c)	((a)<<26|(=
b)<<12|(c)<<6) =0A+#define OPCODE1(a,b,c)	((a)<<26|(b)<<12|(c)<<6)=0A #de=
fine OPCODE2(a,b)	((a)<<26|(b)<<1)=0A #define OPCODE3(a,b)	((a)<<26|(b)<<=
2)=0A #define OPCODE4(a)	((a)<<26)=0A@@ -132,7 +134,7 @@=0A 	unsigned lon=
g val =3D 0;=0A 	int ret;=0A =0A-	DPRINTF("load " RFMT ":" RFMT " to r%d =
for 2 bytes\n", =0A+	DPRINTF("load " RFMT ":" RFMT " to r%d for 2 bytes\n=
",=0A 		regs->isr, regs->ior, toreg);=0A =0A 	__asm__ __volatile__  (=0A@=
@ -157,7 +159,7 @@=0A "	.previous\n"=0A 	: "=3Dr" (val), "=3Dr" (ret)=0A =
	: "0" (val), "r" (saddr), "r" (regs->isr)=0A-	: "r20" );=0A+	: "r1", "r2=
0" );=0A =0A 	DPRINTF("val =3D 0x" RFMT "\n", val);=0A =0A@@ -173,7 +175,=
7 @@=0A 	unsigned long val =3D 0;=0A 	int ret;=0A =0A-	DPRINTF("load " RF=
MT ":" RFMT " to r%d for 4 bytes\n", =0A+	DPRINTF("load " RFMT ":" RFMT "=
 to r%d for 4 bytes\n",=0A 		regs->isr, regs->ior, toreg);=0A =0A 	__asm_=
_ __volatile__  (=0A@@ -202,7 +204,7 @@=0A "	.previous\n"=0A 	: "=3Dr" (v=
al), "=3Dr" (ret)=0A 	: "0" (val), "r" (saddr), "r" (regs->isr)=0A-	: "r1=
9", "r20" );=0A+	: "r1", "r19", "r20" );=0A =0A 	DPRINTF("val =3D 0x" RFM=
T "\n", val);=0A =0A@@ -219,7 +221,7 @@=0A 	__u64 val =3D 0;=0A 	int ret;=
=0A =0A-	DPRINTF("load " RFMT ":" RFMT " to r%d for 8 bytes\n", =0A+	DPRI=
NTF("load " RFMT ":" RFMT " to r%d for 8 bytes\n",=0A 		regs->isr, regs->=
ior, toreg);=0A #ifdef CONFIG_PA20=0A =0A@@ -253,7 +255,7 @@=0A "	.previo=
us\n"=0A 	: "=3Dr" (val), "=3Dr" (ret)=0A 	: "0" (val), "r" (saddr), "r" =
(regs->isr)=0A-	: "r19", "r20" );=0A+	: "r1", "r19", "r20" );=0A #else=0A=
     {=0A 	unsigned long valh=3D0,vall=3D0;=0A@@ -287,7 +289,7 @@=0A "	.p=
revious\n"=0A 	: "=3Dr" (valh), "=3Dr" (vall), "=3Dr" (ret)=0A 	: "0" (va=
lh), "1" (vall), "r" (saddr), "r" (regs->isr)=0A-	: "r19", "r20" );=0A+	:=
 "r1", "r19", "r20" );=0A 	val=3D((__u64)valh<<32)|(__u64)vall;=0A     }=0A=
 #endif=0A@@ -310,7 +312,7 @@=0A 	if (!frreg)=0A 		val =3D 0;=0A =0A-	DPR=
INTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 2 bytes\n", frreg, =
=0A+	DPRINTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 2 bytes\n",=
 frreg,=0A 		val, regs->isr, regs->ior);=0A =0A 	__asm__ __volatile__ (=0A=
@@ -335,7 +337,7 @@=0A "	.previous\n"=0A 	: "=3Dr" (ret)=0A 	: "r" (val),=
 "r" (regs->ior), "r" (regs->isr)=0A-	: "r19" );=0A+	: "r1", "r19" );=0A =
=0A 	return ret;=0A }=0A@@ -352,7 +354,7 @@=0A 	else=0A 		val =3D 0;=0A =0A=
-	DPRINTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 4 bytes\n", fr=
reg, =0A+	DPRINTF("store r%d (0x" RFMT ") to " RFMT ":" RFMT " for 4 byte=
s\n", frreg,=0A 		val, regs->isr, regs->ior);=0A =0A =0A@@ -389,7 +391,7 =
@@=0A "	.previous\n"=0A 	: "=3Dr" (ret)=0A 	: "r" (val), "r" (regs->ior),=
 "r" (regs->isr)=0A-	: "r19", "r20", "r21", "r22", "r1" );=0A+	: "r1", "r=
19", "r20", "r21", "r22" );=0A =0A 	return 0;=0A }=0A@@ -405,7 +407,7 @@=0A=
 	else=0A 		val =3D 0;=0A =0A-	DPRINTF("store r%d (0x%016llx) to " RFMT "=
:" RFMT " for 8 bytes\n", frreg, =0A+	DPRINTF("store r%d (0x%016llx) to "=
 RFMT ":" RFMT " for 8 bytes\n", frreg,=0A 		val,  regs->isr, regs->ior);=
=0A =0A #ifdef CONFIG_PA20=0A@@ -450,7 +452,7 @@=0A "	.previous\n"=0A 	: =
"=3Dr" (ret)=0A 	: "r" (val), "r" (regs->ior), "r" (regs->isr)=0A-	: "r19=
", "r20", "r21", "r22", "r1" );=0A+	: "r1", "r19", "r20", "r21", "r22" );=
=0A #else=0A     {=0A 	unsigned long valh=3D(val>>32),vall=3D(val&0xfffff=
fffl);=0A@@ -495,7 +497,7 @@=0A "	.previous\n"=0A 	: "=3Dr" (ret)=0A 	: "=
r" (valh), "r" (vall), "r" (regs->ior), "r" (regs->isr)=0A-	: "r19", "r20=
", "r21", "r1" );=0A+	: "r1", "r19", "r20", "r21" );=0A     }=0A #endif=0A=
 =0A@@ -523,7 +525,7 @@=0A 			last_time =3D jiffies;=0A 		}=0A =0A-		if (=
!(current->thread.flags & PARISC_UAC_NOPRINT) =0A+		if (!(current->thread=
.flags & PARISC_UAC_NOPRINT)=0A 		    && ++unaligned_count < 5) {=0A 			c=
har buf[256];=0A 			sprintf(buf, "%s(%d): unaligned access to 0x" RFMT " =
at ip=3D0x" RFMT "\n",=0A
--_=__=_XaM3_.1145610812.2A.67635.42.18204.52.42.007.582837036
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--_=__=_XaM3_.1145610812.2A.67635.42.18204.52.42.007.582837036--
