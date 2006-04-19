From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: Any good rules of pratice about branching insn
	into the delay slot of another one?
Date: Wed, 19 Apr 2006 09:09:41 +0100
Message-ID: <IXYMO5$1DE437A4051E8A93EEBB8672C39D9AF4@scarlet.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="_=__=_XaM3_.1145434181.2A.846775.42.7669.52.42.007.991917301"
Cc: parisc-linux <parisc-linux@parisc-linux.org>
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

--_=__=_XaM3_.1145434181.2A.846775.42.7669.52.42.007.991917301
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> On 4/3/06, Joel Soete <soete.joel@tiscali.be> wrote:
> > as well the reference test clone04:
> >
> > # ./clone04 ; echo $?
> > clone04     1  PASS  :  expected failure; Got EINVAL
> > 0
> 
> What was the outcome of this whole thread?
> In summary what needs to be fixed?
> 
Over glibc cvs available at p-l.org this is the best I can do:
--- clone.S.orig2       2006-03-24 10:11:27.000000000 +0100
+++ clone.S.New6        2006-04-13 09:21:11.000000000 +0200
@@ -45,7 +45,29 @@
 
         .text
 ENTRY(__clone)
+    /* this ENTRY() macro do: stw rp, -20(sp)
+       and "FIXME: I have no idea how profiling works on hppa." */
 
+       /* Sanity check arguments.  */
+       comib,=3D         0, %arg0, .Larg_error           /* no NULL func=
tion
pointers */
+       nop                                             /* delay slot */
+       comib,<>,n      0, %arg1, .Lno_arg_error        /* no NULL stack
pointers */
+       nop                                             /* delay slot */
+
+.Larg_error:
+       /* Create a stack frame */
+       ldo             64(%sp), %sp
+       /* Set errno (in the delay slot) */
+       bl              __syscall_error, %rp
+       ldi             EINVAL, %arg0
+
+       /* Return after setting errno */
+       /* Restore rp from ENTRY() */
+       ldw             -84(%sp), %rp
+       bv              %r0(%rp)
+       ldo             -64(%sp), %sp
+
+.Lno_arg_error:
        /* Save the fn ptr and arg on the new stack.  */
        stwm            %arg0, 64(%arg1)
        stw             %arg3, -60(%arg1)
@@ -63,41 +85,40 @@
        stwm            %r3, 64(%sp)
        stw             %r21, -4(%sp)
 
-       /* Save the PIC register. */
-#ifdef PIC
-       copy            %r19, %r3               /* parent */
-#endif
+       SAVE_PIC (TREG)
 
        /* Do the system call */
        ble             0x100(%sr2, %r0)
-       ldi             __NR_clone, %r20
+       ldi             SYS_ify (clone), %r20
 
-       ldi             -4096, %r1
-       comclr,>>=3D      %r1, %ret0, %r0         /* Note: unsigned compa=
re. */
+       ldi             NO_ERROR, %r1
+       comclr,>>=3D      %r1, %ret0, %r20        /* Note: unsigned compa=
re. */
        b,n             .Lerror
+       nop                     /* to avoid next br insn in the delay slo=
t? */
 
        comib,=3D,n       0, %ret0, thread_start
+       nop                     /* to avoid next br insn in the delay slo=
t? */
 
        /* Successful return from the parent
           No need to restore the PIC register, 
           since we return immediately. */
-
        bv              %r0(%rp)
        ldwm            -64(%sp), %r3
 
        /* Something bad happened -- no child created */
 .Lerror:
 
-       /* Restore the PIC register on error */
-#ifdef PIC
-       copy            %r3, %r19               /* parent */ 
-#endif
-       /* Set errno */
-       copy            %ret0, %r3
-       b               __syscall_error
+       LOAD_PIC (TREG)
+
+       /* Use TREG for temp storage */
+       copy            %ret0, TREG
+       /* Set errno (in the delay slot) */
+       bl              __syscall_error, %rp
        sub             %r0, %ret0, %arg0
-       copy            %r3, %ret0
+       copy            TREG, %ret0
        /* Return after setting errno */
+       /* Restore rp from ENTRY() */
+       ldw             -84(%sp), %rp
        bv              %r0(%rp)
        ldwm            -64(%sp), %r3
 
=3D=3D=3D=3D<>=3D=3D=3D=3D

I tried (but without success) to inline  __syscall_error().

Hth,
    Joel

PS: 
  1/ debian gcc-4.0 still lake of a jda patch
  2/ against latest debian libc6 src (2.3.6-7) I applied attached patches=
:
     tls-sysdeps-ng.diff; tst-clone.S.diff
--_=__=_XaM3_.1145434181.2A.846775.42.7669.52.42.007.991917301
Content-Type: text/plain;
	name="=?iso-8859-1?Q?tls-sysdeps-ng.diff?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?tls-sysdeps-ng.diff?="

--- glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/sysdep.c.orig	2006-04-05 14:=
35:11.000000000 +0200=0A+++ glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/sysd=
ep.c	2006-04-05 14:33:21.000000000 +0200=0A@@ -16,12 +16,12 @@=0A    Soft=
ware Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA=0A    02111=
-1307 USA.  */=0A =0A+#include <stdarg.h>=0A #include <sysdep.h>=0A #incl=
ude <errno.h>=0A =0A extern int __syscall_error(int err_no);=0A-extern in=
t syscall (int sysnum, int arg0, int arg1, int arg2,=0A-		    int arg3, i=
nt arg4, int arg5);=0A+extern long int syscall (long int __sysno, ...) __=
THROW;=0A =0A /* This routine is jumped to by all the syscall handlers, t=
o stash=0A    an error number into errno.  */=0A@@ -37,21 +37,34 @@=0A   =
 typically be in syscall.S. Also note that we have INLINE_SYSCALL,=0A    =
INTERNAL_SYSCALL, and all the generated pure assembly syscall wrappers.=0A=
    How often the function is used is unknown. */=0A-int=0A-syscall (int =
sysnum, int arg0, int arg1, int arg2, int arg3, int arg4,=0A-	 int arg5)=0A=
+=0A+long int =0A+syscall (long int __sysno, ...) =0A {=0A   /* FIXME: Ke=
ep this matching INLINE_SYSCALL for hppa */=0A+  va_list args;=0A+  long =
int arg0, arg1, arg2, arg3, arg4, arg5;=0A   long int __sys_res;=0A+=0A+ =
 /* Load varargs */=0A+  va_start (args, __sysno);=0A+  arg0 =3D va_arg (=
args, long int);=0A+  arg1 =3D va_arg (args, long int);=0A+  arg2 =3D va_=
arg (args, long int);=0A+  arg3 =3D va_arg (args, long int);=0A+  arg4 =3D=
 va_arg (args, long int);=0A+  arg5 =3D va_arg (args, long int);=0A+  va_=
end (args);=0A+  =0A   {=0A     register unsigned long int __res asm("r28=
");=0A     LOAD_ARGS_6 (arg0, arg1, arg2, arg3, arg4, arg5)=0A     asm vo=
latile (SAVE_ASM_PIC=0A-		  "	ble  0x100(%%sr2, %%r0)	\n"=0A-		  "	copy %=
1, %%r20		\n"=0A+		  "	ble		0x100(%%sr2, %%r0)	\n"=0A+		  "	copy		%1, %%r=
20		\n"=0A 		  LOAD_ASM_PIC=0A 		  : "=3Dr" (__res)=0A-		  : "r" (sysnum)=
 ASM_ARGS_6=0A+		  : "r" (__sysno) ASM_ARGS_6=0A 		  : "memory", CALL_CLO=
B_REGS CLOB_ARGS_6);=0A     __sys_res =3D __res;=0A   }=0A@@ -62,3 +75,4 =
@@=0A     }=0A   return __sys_res;=0A }=0A+=0A--- glibc-2.3.6/sysdeps/uni=
x/sysv/linux/hppa/sysdep.h.orig	2006-04-05 14:35:11.000000000 +0200=0A+++=
 glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/sysdep.h	2006-04-05 15:16:15.00=
0000000 +0200=0A@@ -22,7 +22,6 @@=0A #include <asm/unistd.h>=0A #include =
<sysdeps/generic/sysdep.h>=0A #include <sys/syscall.h>=0A-#include "confi=
g.h"=0A =0A #undef ASM_LINE_SEP=0A #define ASM_LINE_SEP ! =0A@@ -35,12 +3=
4,12 @@=0A    to another function */=0A #ifdef PIC=0A # define TREG %r3=0A=
-# define SAVE_PIC(SREG) copy %r19, SREG ASM_LINE_SEP=0A-# define LOAD_PI=
C(LREG) copy LREG, %r19 ASM_LINE_SEP=0A+# define SAVE_PIC(SREG) copy		%r1=
9, SREG	ASM_LINE_SEP=0A+# define LOAD_PIC(LREG) copy		LREG, %r19	ASM_LINE=
_SEP=0A /* Inline assembly defines */=0A # define TREG_ASM "%r4" /* Cant =
clobber r3, it holds framemarker */=0A-# define SAVE_ASM_PIC	"       copy=
 %%r19, %" TREG_ASM "\n"=0A-# define LOAD_ASM_PIC	"       copy %" TREG_AS=
M ", %%r19\n"=0A+# define SAVE_ASM_PIC	"       copy		%%r19, %" TREG_ASM "=
\n"=0A+# define LOAD_ASM_PIC	"       copy		%" TREG_ASM ", %%r19\n"=0A # d=
efine USING_TREG	TREG_ASM,=0A #else=0A # define TREG %r3=0A@@ -97,8 +96,8=
 @@=0A #define DOARGS_2 /* nothing */=0A #define DOARGS_3 /* nothing */=0A=
 #define DOARGS_4 /* nothing */=0A-#define DOARGS_5 ldw -52(%sp), %r22		A=
SM_LINE_SEP=0A-#define DOARGS_6 DOARGS_5 ldw -56(%sp), %r21	ASM_LINE_SEP=0A=
+#define DOARGS_5 ldw		-52(%sp), %r22		ASM_LINE_SEP=0A+#define DOARGS_6 D=
OARGS_5 ldw		-56(%sp), %r21	ASM_LINE_SEP=0A =0A #define UNDOARGS_0 /* not=
hing */=0A #define UNDOARGS_1 /* nothing */=0A@@ -123,14 +122,14 @@=0A 	.=
CALLINFO FRAME=3D64,CALLS,SAVE_RP,ENTRY_GR=3D3	ASM_LINE_SEP	\=0A 	.ENTRY	=
					ASM_LINE_SEP	\=0A 	/* SAVE_RP says we do */			ASM_LINE_SEP	\=0A-	stw=
 %rp, -20(%sr0,%sp)				ASM_LINE_SEP	\=0A+	stw		%rp, -20(%sr0, %sp)		ASM_L=
INE_SEP	\=0A 	/*FIXME: Call mcount? (carefull with stack!) */=0A =0A /* S=
ome syscall wrappers do not call other functions, and=0A    hence are cla=
ssified as leaf, so add NO_CALLS for gdb */=0A #define	ENTRY_LEAF(name)		=
				\=0A 	.text						ASM_LINE_SEP	\=0A-	.align ALIGNARG(4)				ASM_LINE_SE=
P	\=0A+	.align	ALIGNARG(4)				ASM_LINE_SEP	\=0A 	.export C_SYMBOL_NAME(na=
me)			ASM_LINE_SEP	\=0A 	.type	C_SYMBOL_NAME(name),@function		ASM_LINE_SE=
P	\=0A 	C_LABEL(name)					ASM_LINE_SEP	\=0A@@ -138,12 +137,12 @@=0A 	.CAL=
LINFO FRAME=3D64,NO_CALLS,SAVE_RP,ENTRY_GR=3D3	ASM_LINE_SEP	\=0A 	.ENTRY	=
					ASM_LINE_SEP	\=0A 	/* SAVE_RP says we do */			ASM_LINE_SEP	\=0A-	stw=
 %rp, -20(%sr0,%sp)				ASM_LINE_SEP	\=0A+	stw		%rp, -20(%sr0, %sp)		ASM_L=
INE_SEP	\=0A 	/*FIXME: Call mcount? (carefull with stack!) */=0A =0A #und=
ef	END=0A #define END(name)							\=0A-  	.EXIT						ASM_LINE_SEP	\=0A+ 	=
.EXIT						ASM_LINE_SEP	\=0A 	.PROCEND					ASM_LINE_SEP	\=0A .size	C_SYMB=
OL_NAME(name), .-C_SYMBOL_NAME(name)	ASM_LINE_SEP=0A =0A@@ -166,50 +165,5=
0 @@=0A 	nop=0A */=0A =0A-#define	PSEUDO(name, syscall_name, args)			\=0A=
-  ENTRY (name)					ASM_LINE_SEP	\=0A-  /* If necc. load args from stack =
*/		ASM_LINE_SEP	\=0A-  DOARGS_##args					ASM_LINE_SEP	\=0A-  DO_CALL (sy=
scall_name, args)			ASM_LINE_SEP	\=0A-  UNDOARGS_##args				ASM_LINE_SEP	\=
=0A-  nop						ASM_LINE_SEP=0A+#define	PSEUDO(name, syscall_name, args)		=
		\=0A+	ENTRY (name)					ASM_LINE_SEP	\=0A+	/* If necc. load args from st=
ack */		ASM_LINE_SEP	\=0A+	DOARGS_##args					ASM_LINE_SEP	\=0A+	DO_CALL (=
syscall_name, args)			ASM_LINE_SEP	\=0A+	UNDOARGS_##args					ASM_LINE_SEP=
	\=0A+	nop						ASM_LINE_SEP=0A =0A #define ret \=0A-  /* Return value se=
t by ERRNO code */		ASM_LINE_SEP	\=0A-  bv,n 0(2)					ASM_LINE_SEP=0A+	/*=
 Return value set by ERRNO code */	ASM_LINE_SEP	\=0A+	bv,n		0(2)				ASM_L=
INE_SEP=0A =0A #undef	PSEUDO_END=0A-#define	PSEUDO_END(name)					\=0A-  E=
ND (name)=0A+#define	PSEUDO_END(name)						\=0A+	END (name)=0A =0A /* We =
don't set the errno on the return from the syscall */=0A-#define	PSEUDO_N=
OERRNO(name, syscall_name, args)		\=0A-  ENTRY_LEAF (name)				ASM_LINE_SE=
P	\=0A-  DOARGS_##args					ASM_LINE_SEP	\=0A-  DO_CALL_NOERRNO (syscall_n=
ame, args)		ASM_LINE_SEP	\=0A-  UNDOARGS_##args				ASM_LINE_SEP	\=0A-  no=
p						ASM_LINE_SEP=0A+#define	PSEUDO_NOERRNO(name, syscall_name, args)		=
	\=0A+	ENTRY_LEAF (name)				ASM_LINE_SEP	\=0A+	DOARGS_##args					ASM_LINE=
_SEP	\=0A+	DO_CALL_NOERRNO (syscall_name, args)		ASM_LINE_SEP	\=0A+	UNDOA=
RGS_##args					ASM_LINE_SEP	\=0A+	nop						ASM_LINE_SEP=0A =0A-#define re=
t_NOERRNO ret=0A+#define ret_NOERRNO	ret=0A =0A #undef	PSEUDO_END_NOERRNO=
=0A-#define	PSEUDO_END_NOERRNO(name)				\=0A-  END (name)=0A+#define	PSEU=
DO_END_NOERRNO(name)					\=0A+	END (name)=0A =0A /* This has to return th=
e error value */=0A #undef  PSEUDO_ERRVAL=0A-#define PSEUDO_ERRVAL(name, =
syscall_name, args)			\=0A-  ENTRY_LEAF (name)				ASM_LINE_SEP	\=0A-  DOA=
RGS_##args					ASM_LINE_SEP	\=0A-  DO_CALL_ERRVAL (syscall_name, args)		A=
SM_LINE_SEP	\=0A-  UNDOARGS_##args				ASM_LINE_SEP	\=0A-  nop						ASM_LI=
NE_SEP=0A+#define PSEUDO_ERRVAL(name, syscall_name, args)				\=0A+	ENTRY_=
LEAF (name)				ASM_LINE_SEP	\=0A+	DOARGS_##args					ASM_LINE_SEP	\=0A+	DO=
_CALL_ERRVAL (syscall_name, args)		ASM_LINE_SEP	\=0A+	UNDOARGS_##args				=
	ASM_LINE_SEP	\=0A+	nop						ASM_LINE_SEP=0A =0A #define ret_ERRVAL ret=0A=
 =0A #undef	PSEUDO_END_ERRVAL=0A-#define PSEUDO_END_ERRVAL(name)					\=0A=
-	END(name)=0A+#define PSEUDO_END_ERRVAL(name)						\=0A+	END (name)=0A =0A=
 #undef JUMPTARGET=0A #define JUMPTARGET(name)	name=0A@@ -222,10 +221,10 =
@@=0A =0A /* int * __errno_location(void) so you have to store your value=
=0A    into the return address! */=0A-#define DEFAULT_SYSCALL_ERROR_HANDL=
ER 			\=0A-	.import __errno_location,code	ASM_LINE_SEP	\=0A-	/* branch to=
 errno handler */	ASM_LINE_SEP	\=0A-	bl __errno_location,%rp		ASM_LINE_SE=
P=0A+#define DEFAULT_SYSCALL_ERROR_HANDLER 					\=0A+	.import __errno_loc=
ation,code			ASM_LINE_SEP	\=0A+	/* branch to errno handler */			ASM_LINE_=
SEP	\=0A+	bl		__errno_location, %rp		ASM_LINE_SEP=0A =0A /* Here are the =
myriad of configuration options that the above can=0A    work for... what=
 we've done is provide the framework for future=0A@@ -249,7 +248,6 @@=0A =
# endif=0A #endif=0A =0A-=0A /* Linux takes system call arguments in regi=
sters:=0A 	syscall number	gr20=0A 	arg 1		gr26=0A@@ -278,61 +276,60 @@=0A=
 #define NO_ERROR -0x1000=0A =0A #undef	DO_CALL=0A-#define DO_CALL(syscal=
l_name, args)				\=0A-  	copy TREG,%r1				ASM_LINE_SEP	\=0A-	copy %sp,TRE=
G				ASM_LINE_SEP	\=0A-	/* Create a frame */			ASM_LINE_SEP	\=0A-	stwm %r=
1, 64(%sp)			ASM_LINE_SEP	\=0A-	stw %rp, -20(%sp)			ASM_LINE_SEP	\=0A-	st=
w TREG, -4(%sp)			ASM_LINE_SEP	\=0A-	/* Save r19 */				ASM_LINE_SEP	\=0A-=
	SAVE_PIC(TREG)				ASM_LINE_SEP	\=0A-	/* Do syscall, delay loads # */		AS=
M_LINE_SEP	\=0A-	ble  0x100(%sr2,%r0)			ASM_LINE_SEP	\=0A-	ldi SYS_ify (s=
yscall_name), %r20	ASM_LINE_SEP	\=0A-	ldi NO_ERROR,%r1			ASM_LINE_SEP	\=0A=
-	cmpb,>>=3D,n %r1,%ret0,L(pre_end)		ASM_LINE_SEP	\=0A-	/* Restore r19 fr=
om TREG */		ASM_LINE_SEP	\=0A-	LOAD_PIC(TREG) /* delay */		ASM_LINE_SEP	\=
=0A-	SYSCALL_ERROR_HANDLER			ASM_LINE_SEP	\=0A-	/* Use TREG for temp stor=
age */		ASM_LINE_SEP	\=0A-	copy %ret0, TREG /* delay */		ASM_LINE_SEP	\=0A=
-	/* OPTIMIZE: Don't reload r19 */	ASM_LINE_SEP	\=0A-	/* do a -1*syscall_=
ret0 */		ASM_LINE_SEP	\=0A-	sub %r0, TREG, TREG			ASM_LINE_SEP	\=0A-	/* S=
tore into errno location */		ASM_LINE_SEP	\=0A-	stw TREG, 0(%sr0,%ret0)		=
	ASM_LINE_SEP	\=0A-	/* return -1 as error */		ASM_LINE_SEP	\=0A-	ldo -1(%=
r0), %ret0			ASM_LINE_SEP	\=0A-L(pre_end):					ASM_LINE_SEP	\=0A-	/* Rest=
ore return pointer */		ASM_LINE_SEP	\=0A-	ldw -84(%sp),%rp			ASM_LINE_SEP=
	\=0A-	/* Restore our frame, restoring TREG */	ASM_LINE_SEP	\=0A-	ldwm -6=
4(%sp), TREG			ASM_LINE_SEP=0A+#define DO_CALL(syscall_name, args)					\=0A=
+  	copy		TREG, %r1			ASM_LINE_SEP	\=0A+	copy		%sp, TREG			ASM_LINE_SEP	\=
=0A+	/* Create a frame */				ASM_LINE_SEP	\=0A+	stwm		%r1, 64(%sp)			ASM_=
LINE_SEP	\=0A+	stw		%rp, -20(%sp)			ASM_LINE_SEP	\=0A+	stw		TREG, -4(%sp)=
			ASM_LINE_SEP	\=0A+	/* Save r19 */					ASM_LINE_SEP	\=0A+	SAVE_PIC (TRE=
G)					ASM_LINE_SEP	\=0A+	/* Do syscall, delay loads # */			ASM_LINE_SEP	=
\=0A+	ble		0x100(%sr2, %r0)		ASM_LINE_SEP	\=0A+	ldi		SYS_ify (syscall_nam=
e), %r20	ASM_LINE_SEP	\=0A+	ldi		NO_ERROR, %r1			ASM_LINE_SEP	\=0A+	cmpb,=
>>=3D,n	%r1, %ret0,L(pre_end)		ASM_LINE_SEP	\=0A+	/* Restore r19 from TRE=
G */			ASM_LINE_SEP	\=0A+	LOAD_PIC(TREG)			/* delay */	ASM_LINE_SEP	\=0A+=
	SYSCALL_ERROR_HANDLER				ASM_LINE_SEP	\=0A+	/* Use TREG for temp storage=
 */			ASM_LINE_SEP	\=0A+	copy		%ret0, TREG	/* delay */	ASM_LINE_SEP	\=0A+=
	/* OPTIMIZE: Don't reload r19 */		ASM_LINE_SEP	\=0A+	/* do a -1*syscall_=
ret0 */			ASM_LINE_SEP	\=0A+	sub		%r0, TREG, TREG			ASM_LINE_SEP	\=0A+	/*=
 Store into errno location */			ASM_LINE_SEP	\=0A+	stw		TREG, 0(%sr0, %re=
t0)		ASM_LINE_SEP	\=0A+	/* return -1 as error */			ASM_LINE_SEP	\=0A+	ldo=
		-1(%r0), %ret0			ASM_LINE_SEP	\=0A+L(pre_end):						ASM_LINE_SEP	\=0A+	=
/* Restore return pointer */			ASM_LINE_SEP	\=0A+	ldw		-84(%sp), %rp			AS=
M_LINE_SEP	\=0A+	/* Restore our frame, restoring TREG */		ASM_LINE_SEP	\=0A=
+	ldwm		-64(%sp), TREG			ASM_LINE_SEP=0A =0A /* We do nothing with the re=
turn, except hand it back to someone else */=0A #undef  DO_CALL_NOERRNO=0A=
-#define DO_CALL_NOERRNO(syscall_name, args)			\=0A-	/* No need to store =
r19 */		ASM_LINE_SEP	\=0A-	ble  0x100(%sr2,%r0)                    ASM_LI=
NE_SEP    \=0A-	ldi SYS_ify (syscall_name), %r20        ASM_LINE_SEP    \=
=0A-	/* Caller will restore r19 */		ASM_LINE_SEP=0A+#define DO_CALL_NOERR=
NO(syscall_name, args)				\=0A+	/* No need to store r19 */			ASM_LINE_SEP=
	\=0A+	ble		0x100(%sr2, %r0)		ASM_LINE_SEP    \=0A+	ldi		SYS_ify (syscall=
_name), %r20	ASM_LINE_SEP    \=0A+	/* Caller will restore r19 */			ASM_LI=
NE_SEP=0A =0A /* Here, we return the ERRVAL in assembly, note we don't ca=
ll the=0A    error handler function, but we do 'negate' the return _IF_=0A=
    it's an error. Not sure if this is the right semantic. */=0A =0A #und=
ef	DO_CALL_ERRVAL=0A-#define DO_CALL_ERRVAL(syscall_name, args)			\=0A-	/=
* No need to store r19 */		ASM_LINE_SEP	\=0A-	ble  0x100(%sr2,%r0)			ASM_=
LINE_SEP	\=0A-	ldi SYS_ify (syscall_name), %r20	ASM_LINE_SEP	\=0A-	/* Cal=
ler will restore r19 */		ASM_LINE_SEP	\=0A-	ldi NO_ERROR,%r1			ASM_LINE_S=
EP	\=0A-	cmpb,>>=3D,n %r1,%ret0,0f			ASM_LINE_SEP	\=0A-	sub %r0, %ret0, %=
ret0			ASM_LINE_SEP	\=0A-0:						ASM_LINE_SEP=0A-=0A+#define DO_CALL_ERRV=
AL(syscall_name, args)				\=0A+	/* No need to store r19 */			ASM_LINE_SEP=
	\=0A+	ble		0x100(%sr2, %r0)		ASM_LINE_SEP	\=0A+	ldi		SYS_ify (syscall_na=
me), %r20	ASM_LINE_SEP	\=0A+	/* Caller will restore r19 */			ASM_LINE_SEP=
	\=0A+	ldi		NO_ERROR, %r1			ASM_LINE_SEP	\=0A+	cmpb,>>=3D,n	%r1, %ret0, 0=
f			ASM_LINE_SEP	\=0A+	sub		%r0, %ret0, %ret0		ASM_LINE_SEP	\=0A+0:						=
	ASM_LINE_SEP=0A =0A #else=0A =0A@@ -360,8 +357,8 @@=0A 		/* FIXME: HACK =
save/load r19 around syscall */		\=0A 		asm volatile(						\=0A 			SAVE_A=
SM_PIC					\=0A-			"	ble  0x100(%%sr2, %%r0)\n"		\=0A-			"	ldi %1, %%r20\=
n"			\=0A+			"	ble		0x100(%%sr2, %%r0)\n"	\=0A+			"	ldi		%1, %%r20\n"		\=0A=
 			LOAD_ASM_PIC					\=0A 			: "=3Dr" (__res)					\=0A 			: "i" (SYS_ify(=
name)) ASM_ARGS_##nr		\=0A@@ -385,7 +382,7 @@=0A    In our case we just f=
lip the sign. */=0A =0A #undef INTERNAL_SYSCALL_DECL=0A-#define INTERNAL_=
SYSCALL_DECL(err) do { } while (0)=0A+#define INTERNAL_SYSCALL_DECL(err) =
=0A =0A /* Equivalent to  (val < 0)&&(val > -4095) which is what we want =
*/=0A #undef INTERNAL_SYSCALL_ERROR_P=0A@@ -406,8 +403,8 @@=0A 		/* FIXME=
: HACK save/load r19 around syscall */		\=0A 		asm volatile(						\=0A 		=
	SAVE_ASM_PIC					\=0A-			"	ble  0x100(%%sr2, %%r0)\n"		\=0A-			"	ldi %1,=
 %%r20\n"			\=0A+			"	ble	0x100(%%sr2, %%r0)\n"		\=0A+			"	ldi	%1, %%r20\=
n"			\=0A 			LOAD_ASM_PIC					\=0A 			: "=3Dr" (__res)					\=0A 			: "i" =
(SYS_ify(name)) ASM_ARGS_##nr		\=0A@@ -418,25 +415,49 @@=0A 	__sys_res;		=
					\=0A  })=0A =0A+=0A+/* The _NCS variant allows non-constant syscall =
numbers.  */=0A+#undef INTERNAL_SYSCALL_NCS=0A+#define INTERNAL_SYSCALL_N=
CS(name, err, nr, args...) 			\=0A+({									\=0A+	long __sys_res;						=
	\=0A+	{								\=0A+		register unsigned long __res asm("r28");		\=0A+		L=
OAD_ARGS_##nr(args)					\=0A+		/* FIXME: HACK save/load r19 around syscal=
l */		\=0A+		asm volatile(						\=0A+			SAVE_ASM_PIC					\=0A+			"	ble	0x=
100(%%sr2, %%r0)\n"		\=0A+			"	copy	%1, %%r20\n"			\=0A+			LOAD_ASM_PIC		=
			\=0A+			: "=3Dr" (__res)					\=0A+			: "r" (name) ASM_ARGS_##nr			\=0A=
+			: "memory", CALL_CLOB_REGS CLOB_ARGS_##nr	\=0A+		);							\=0A+		__sy=
s_res =3D (long)__res;				\=0A+	}								\=0A+	__sys_res;							\=0A+ })=0A=
+=0A #define LOAD_ARGS_0()=0A #define LOAD_ARGS_1(r26)						\=0A-  regist=
er unsigned long __r26 __asm__("r26") =3D (unsigned long)(r26);	\=0A-  LO=
AD_ARGS_0()=0A+	register unsigned long __r26 __asm__("r26") =3D (unsigned=
 long)(r26); \=0A+	LOAD_ARGS_0()=0A #define LOAD_ARGS_2(r26,r25)						\=0A=
-  register unsigned long __r25 __asm__("r25") =3D (unsigned long)(r25);	=
\=0A-  LOAD_ARGS_1(r26)=0A+	register unsigned long __r25 __asm__("r25") =3D=
 (unsigned long)(r25); \=0A+	LOAD_ARGS_1(r26)=0A #define LOAD_ARGS_3(r26,=
r25,r24)					\=0A-  register unsigned long __r24 __asm__("r24") =3D (unsi=
gned long)(r24);	\=0A-  LOAD_ARGS_2(r26,r25)=0A+	register unsigned long _=
_r24 __asm__("r24") =3D (unsigned long)(r24); \=0A+	LOAD_ARGS_2(r26,r25)=0A=
 #define LOAD_ARGS_4(r26,r25,r24,r23)					\=0A-  register unsigned long _=
_r23 __asm__("r23") =3D (unsigned long)(r23);	\=0A-  LOAD_ARGS_3(r26,r25,=
r24)=0A+	register unsigned long __r23 __asm__("r23") =3D (unsigned long)(=
r23); \=0A+	LOAD_ARGS_3(r26,r25,r24)=0A #define LOAD_ARGS_5(r26,r25,r24,r=
23,r22)				\=0A-  register unsigned long __r22 __asm__("r22") =3D (unsign=
ed long)(r22);	\=0A-  LOAD_ARGS_4(r26,r25,r24,r23)=0A-#define LOAD_ARGS_6=
(r26,r25,r24,r23,r22,r21)				\=0A-  register unsigned long __r21 __asm__(=
"r21") =3D (unsigned long)(r21);	\=0A-  LOAD_ARGS_5(r26,r25,r24,r23,r22)=0A=
+	register unsigned long __r22 __asm__("r22") =3D (unsigned long)(r22); \=
=0A+	LOAD_ARGS_4(r26,r25,r24,r23)=0A+#define LOAD_ARGS_6(r26,r25,r24,r23,=
r22,r21)				 \=0A+	register unsigned long __r21 __asm__("r21") =3D (unsig=
ned long)(r21); \=0A+	LOAD_ARGS_5(r26,r25,r24,r23,r22)=0A =0A /* Even wit=
h zero args we use r20 for the syscall number */=0A #define ASM_ARGS_0=0A=

--_=__=_XaM3_.1145434181.2A.846775.42.7669.52.42.007.991917301
Content-Type: text/plain;
	name="=?iso-8859-1?Q?tst-clone.S.diff?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="=?iso-8859-1?Q?tst-clone.S.diff?="

--- glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S.orig	2006-04-15 15:1=
1:23.000000000 +0200=0A+++ glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone=
.S	2006-04-15 15:13:02.000000000 +0200=0A@@ -26,74 +26,121 @@=0A #define =
_ERRNO_H	1=0A #include <bits/errno.h>=0A =0A-/* int clone(int (*fn)(void =
*arg), void *child_stack, int flags, void *arg) */=0A+/* Non-thread code =
calls __clone with the following parameters:=0A+   int clone(int (*fn)(vo=
id *arg), void *child_stack, int flags, void *arg)=0A+   =0A+   NPTL Code=
 will call __clone with the following parameters:=0A+   int clone(int (*f=
n)(void *arg), void *child_stack, int flags, void *arg,=0A+	     int *par=
ent_tidptr, struct user_desc *newtls, int *child_pidptr)=0A+	=0A+   The c=
ode should not mangle the extra input registers.=0A+   Syscall expects:		=
		Input to __clone:=0A+	r26 - clone flags.			(arg2)=0A+	r25 - user stack =
pointer.		(arg1)=0A+	r24 - parent tid pointer.		(stack - 52)=0A+	r23 - st=
ruct user_desc newtls pointer.	(stack - 56)=0A+	r22 - child tid pointer.	=
	(stack - 60)=0A+	r20 - clone syscall number		(constant)=0A+ */=0A =0A   =
      .text=0A ENTRY(__clone)=0A-	/* FIXME: I have no idea how profiling =
works on hppa. */=0A+    /* this ENTRY() macro do: stw rp, -20(sp)=0A+   =
    and "FIXME: I have no idea how profiling works on hppa." */=0A =0A 	/=
* Sanity check arguments.  */=0A-	comib,=3D  0,%arg0,.Lerror        /* no=
 NULL function pointers */=0A-	ldi     -EINVAL,%ret0=0A-	comib,=3D  0,%ar=
g1,.Lerror        /* no NULL stack pointers */=0A-	nop=0A-=0A+	comib,=3D	=
	0, %arg0, .Larg_error		/* no NULL function pointers */=0A+	nop						/* d=
elay slot */=0A+	comib,<>,n	0, %arg1, .Lno_arg_error	/* no NULL stack poi=
nters */=0A+	nop						/* delay slot */=0A+=0A+.Larg_error:=0A+	/* Create =
a stack frame */=0A+	ldo             64(%sp), %sp=0A+	/* Set errno (in th=
e delay slot) */=0A+	bl		__syscall_error, %rp=0A+	ldi		EINVAL, %arg0=0A+=0A=
+	/* Return after setting errno */=0A+	/* Restore rp from ENTRY() */=0A+	=
ldw		-84(%sp), %rp=0A+	bv		%r0(%rp)=0A+	ldo             -64(%sp), %sp=0A+=
	=0A+.Lno_arg_error:=0A 	/* Save the fn ptr and arg on the new stack.  */=
=0A-	stwm    %arg0,64(%arg1)=0A-	stw	%arg3,-60(%arg1)=0A+	stwm		%arg0, 64=
(%arg1)=0A+	stw		%arg3, -60(%arg1)=0A+	/* Clone arguments are (int flags,=
 void * child_stack) */=0A+	copy		%arg2, %arg0		/* flags are first */=0A+=
	/* User stack pointer is in the correct register already */=0A+=0A+	/* L=
oad args from stack... */=0A+	ldw		-52(%sp), %arg2		/* Load parent_tidptr=
 */=0A+	ldw		-56(%sp), %arg3		/* Load newtls */=0A+	ldw		-60(%sp), %r22		=
/* Load child_tidptr */=0A+=0A+	/* Create frame for function */=0A+	copy	=
	%sp, %r21=0A+	stwm		%r3, 64(%sp)=0A+	stw		%r21, -4(%sp)=0A =0A-	/* Save =
the PIC register. */=0A-#ifdef PIC=0A-	stw	%r19,-32(%sr0, %sp)	/* parent =
*/=0A-#endif=0A+	SAVE_PIC (TREG)=0A =0A 	/* Do the system call */=0A-	cop=
y	%arg2,%arg0=0A-	ble     0x100(%sr2,%r0)=0A-	ldi	__NR_clone,%r20=0A-=0A-=
	ldi	-4096,%r1=0A-	comclr,>>=3D %r1,%ret0,%r0	/* Note: unsigned compare. =
*/=0A-	b,n	.Lerror=0A+	ble		0x100(%sr2, %r0)=0A+	ldi		SYS_ify (clone), %r=
20=0A+=0A+	ldi		NO_ERROR, %r1=0A+	comclr,>>=3D	%r1, %ret0, %r0		/* Note: =
unsigned compare. */=0A+	ldi		1, %r20=0A+	comib,=3D,n	1, %r20, .Lerror=0A=
+	nop			/* to avoid next br insn in the delay slot? */=0A =0A-	comib,=3D,=
n 0,%ret0,thread_start=0A+	comib,=3D,n	0, %ret0, thread_start=0A+	nop			/=
* to avoid next br insn in the delay slot? */=0A =0A 	/* Successful retur=
n from the parent=0A 	   No need to restore the PIC register, =0A 	   sin=
ce we return immediately. */=0A-=0A-	bv	%r0(%rp)=0A-	nop=0A+	bv		%r0(%rp)=
=0A+	ldwm		-64(%sp), %r3=0A =0A 	/* Something bad happened -- no child cr=
eated */=0A .Lerror:=0A =0A-	/* Restore the PIC register on error */=0A-#=
ifdef PIC=0A-	ldw	-32(%sr0, %sp), %r19	/* parent */=0A-#endif=0A+	LOAD_PI=
C (TREG)=0A =0A-	b	__syscall_error=0A-	sub     %r0,%ret0,%arg0=0A+	/* Use=
 TREG for temp storage */=0A+	copy		%ret0, TREG=0A+	/* Set errno (in the =
delay slot) */=0A+	bl		__syscall_error, %rp=0A+	sub		%r0, %ret0, %arg0=0A=
+	copy		TREG, %ret0=0A+	/* Return after setting errno */=0A+	/* Restore r=
p from ENTRY() */=0A+	ldw		-84(%sp), %rp=0A+	bv		%r0(%rp)=0A+	ldwm		-64(%=
sp), %r3=0A =0A thread_start:=0A =0A 	/* Load up the arguments.  */=0A-	l=
dw	-60(%sr0, %sp),%arg0=0A-	ldw     -64(%sr0, %sp),%r22=0A+	ldw		-60(%sr0=
, %sp), %arg0=0A+	ldw		-64(%sr0, %sp), %r22=0A =0A 	/* $$dyncall fixes ch=
ilds PIC register */=0A =0A 	/* Call the user's function */=0A-	bl	$$dync=
all,%r31=0A-	copy	%r31,%rp=0A+	bl		$$dyncall, %r31=0A+	copy		%r31, %rp=0A=
 =0A-	bl	_exit,%rp=0A-	copy	%ret0,%arg0=0A+	bl		_exit, %rp=0A+	copy		%ret=
0, %arg0=0A =0A 	/* Die horribly.  */=0A-	iitlbp	%r0,(%sr0,%r0)=0A+	iitlb=
p		%r0, (%sr0, %r0)=0A =0A PSEUDO_END(__clone)=0A =0A-weak_alias(__clone,=
 clone)=0A+weak_alias (__clone, clone)=0A
--_=__=_XaM3_.1145434181.2A.846775.42.7669.52.42.007.991917301
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--_=__=_XaM3_.1145434181.2A.846775.42.7669.52.42.007.991917301--
