From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Fwd: hppa glibc clone() patch proposal (3/3)
Date: Mon, 27 Mar 2006 17:59:56 +0100
Message-ID: <IWSPVW$130BBFD1D2134CD001AE6C41E403D25D@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 tsg45800 <tsg45800@scarlet.be>
To: "soete.joel" <soete.joel@tiscali.be>
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

> > Joel,
> > 
> > Some comments:
> > 
> > 1) I think you are right in fixing the first __syscall_error call. I
> > don't know why we are doing a b instead of bl now. It seems to be tha=
t
> > the current code will result in an orphaned stack frame if we ever
> > errored out. However, I see that in the other syscalls, the call to
> > __syscall_error is inlined. Maybe that would be better.....
> > 
> I just lake of knowledge to do it in asm but if you show me another exa=
mple, I
> could try it ;-)
> 
> > 2)
> > >          .text
> > >  ENTRY(__clone)
> > > +    /* this proto do: stw rp, -20(sp) */
> > 
> > Yes, you should put "stw %rp, -20(%sp)" here.
> > 
> well my comment seems to be bad, I would mean:
>         /* this Entry() macro do a: stw rp, -20(sp) */
> 
> sysdeps/unix/sysv/linux/hppa/sysdep.h
> [snip]
> /* Define an entry point visible from C.
> 
>    There is currently a bug in gdb which prevents us from specifying
>    incomplete stabs information.  Fake some entries here which specify
>    the current source file.  */
> #define ENTRY(name)                                                    =
 \
>         .text                                           ASM_LINE_SEP   =
 \
>         .align ALIGNARG(4)                              ASM_LINE_SEP   =
 \
>         .export C_SYMBOL_NAME(name)                     ASM_LINE_SEP   =
 \
>         .type   C_SYMBOL_NAME(name),@function           ASM_LINE_SEP   =
 \
>         C_LABEL(name)                                   ASM_LINE_SEP   =
 \
>         .PROC                                           ASM_LINE_SEP   =
 \
>         .CALLINFO FRAME=3D64,CALLS,SAVE_RP,ENTRY_GR=3D3     ASM_LINE_SE=
P    \
>         .ENTRY                                          ASM_LINE_SEP   =
 \
>         /* SAVE_RP says we do */                        ASM_LINE_SEP   =
 \
>         stw             %rp, -20(%sr0, %sp)             ASM_LINE_SEP   =
 \
>         /*FIXME: Call mcount? (carefull with stack!) */
> [snip]
> 
> > > +       /* FIXME: I have no idea how profiling works on hppa. */
> > 
> > Let's leave profiling out of this for now....
> > 
> > > +       /* Sanity check arguments.  */
> > > +       comib,=3D         0, %arg0, .Larg_error   /* no NULL functi=
on
> > > pointers */
> > > +       ldi             -EINVAL, %ret0
> > > +       comib,=3D         0, %arg1, .Larg_error   /* no NULL stack
> > > pointers */
> > > +       nop
> > 
> > There seems to be some confusion here....
> > 
> > You want clone() to return -1, and set errno =3D -EINVAL. The logic t=
o do
> > this is in .Larg_error. Probably better here to just detect the two
> > error conditions and branch to .Larg_error and handle all the logic t=
here.
> > 
> Totaly agree, as a first attempt I wonder based that on just reverting =
a
> previous hunk of patch, I will make much effort ;-)
>   
> > >         /* Save the fn ptr and arg on the new stack.  */
> > >         stwm            %arg0, 64(%arg1)
> > > @@ -94,13 +102,35 @@
> > >  #endif
> > >         /* Set errno */
> > >         copy            %ret0, %r3
> > > -       b               __syscall_error
> > > +       bl              __syscall_error, %rp
> > >         sub             %r0, %ret0, %arg0
> > >         copy            %r3, %ret0
> > >         /* Return after setting errno */
> > > +       /* Restore rp from ENTRY() */
> > > +       ldw             -84(%sp), %rp
> > 
> > Right now since you don't store rp, this will give you junk.
> > 
> > > +.Larg_error:
> > > +
> > > +       /* Save arg0: the fn ptr.  */
> > > +       stw             %arg0, -36(%sp)
> > 
> > In the error case, you don't invoke the function, so no need to save =
and
> > restore arg0.
> > 
> Thanks, I would be sure that gcc will not rely on the availability of t=
his var
> in r26 after the function call.
> 
> > > +       /* Save the PIC register? */
> > > +       stwm            %r3, 64(%sp)
> > 
> > r3 is just a caller-save register; it has nothing to do with PIC. You=

> > don't need to use r3 in this path; just create a stack frame with:
> > 	ldo 64(%sp), %sp
> > 
> Yes, I just read jda comment about another thread: PIC register is actu=
aly r19.
> 
> > > +       /* Set errno */
> > > +       copy            %ret0, %r3
> > > +       bl              __syscall_error, %rp
> > > +       sub             %r0, %ret0, %arg0
> > 
> > Here, I think you want to do (or inline the __syscall_error logic):
> > 	bl __syscall_error, %rp
> > 	ldi EINVAL, %arg0
> > 	ldi -1, %ret0
> > 
> > > +       /* Restore arg0: the fn ptr.  */
> > > +       ldw             -100(%sp), %arg0
> > > +       /* Return after setting errno */
> > > +       /* Restore rp from ENTRY() */
> > > +       ldw             -84(%sp), %rp
> > > +       bv              %r0(%rp)
> > > +       ldwm            -64(%sp), %r3
> > 
> > and here you can just do:
> > 	ldw -84(%sp), %rp
> > 	bv %r0(%rp)
> > 	ldo -64(%sp), %sp
> > 
> Cool.
> 
> Many thanks for all your accurate advises,
>     Joel
> 
mmm, a bit busy in prod (unfortunately 2 mirrored boot disk was corrupted=
 ->
hope that ignite tape would help)

please review this next attempt (not yet tested):
# diff -Nau clone.S.orig2 clone.S.New2
--- clone.S.orig2       2006-03-24 10:11:27.000000000 +0100
+++ clone.S.New2        2006-03-27 18:34:54.000000000 +0200
@@ -45,7 +45,27 @@
 
         .text
 ENTRY(__clone)
+    /* this ENTRY() macro do: stw rp, -20(sp) */
 
+       /* Sanity check arguments.  */
+       and             %arg0, %arg1, %r20      /* no NULL function point=
ers */
+       comib,<>,n      0, %r20, .Lno_arg_error 
+
+       /* Create a stack frame */
+       ldo             64(%sp), %sp
+
+       /* Set errno */
+       bl              __syscall_error, %rp
+       ldi             EINVAL, %arg0
+/*     ldi             -1, %ret0 */
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
@@ -94,10 +114,12 @@
 #endif
        /* Set errno */
        copy            %ret0, %r3
-       b               __syscall_error
+       bl              __syscall_error, %rp
        sub             %r0, %ret0, %arg0
        copy            %r3, %ret0
        /* Return after setting errno */
+       /* Restore rp from ENTRY() */
+       ldw             -84(%sp), %rp
        bv              %r0(%rp)
        ldwm            -64(%sp), %r3
 
=3D=3D=3D=3D<>=3D=3D=3D=3D

Some comments:
  1/ I just comment out "ldi -1, %ret0" because imho our __syscall_error(=
) did
it already:
sysdeps/unix/sysv/linux/hppa/sysdep.c:
[snip]
int
__syscall_error (int err_no)
{
  __set_errno (err_no);
  return -1;
}
[snip]

  2/ hope that r20 is a good choice?

Thanks again,
    Joel=0A=0A-----------------------------------------------------------=
----=0AA free anti-spam and anti-virus filter on all Scarlet mailboxes=0A=
More info on http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
