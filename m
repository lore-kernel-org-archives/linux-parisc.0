From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Fwd: hppa glibc clone() patch proposal (3/3)
Date: Thu, 30 Mar 2006 16:08:05 +0100
Message-ID: <IWY4PH$66A7B7349BAF4B2D0043D5D9DC7413F8@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 tsg45800 <tsg45800@scarlet.be>
To: "randolph" <randolph@tausq.org>
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

Hello Randolph, Carlos,

> Joel,
> 
> Some comments:
> 
> 1) I think you are right in fixing the first __syscall_error call. I
> don't know why we are doing a b instead of bl now. It seems to be that
> the current code will result in an orphaned stack frame if we ever
> errored out. However, I see that in the other syscalls, the call to
> __syscall_error is inlined. Maybe that would be better.....
> 
> 2)
> >          .text
> >  ENTRY(__clone)
> > +    /* this proto do: stw rp, -20(sp) */
> 
> Yes, you should put "stw %rp, -20(%sp)" here.
> 
> > +       /* FIXME: I have no idea how profiling works on hppa. */
> 
> Let's leave profiling out of this for now....
> 
> > +       /* Sanity check arguments.  */
> > +       comib,=3D         0, %arg0, .Larg_error   /* no NULL function=

> > pointers */
> > +       ldi             -EINVAL, %ret0
> > +       comib,=3D         0, %arg1, .Larg_error   /* no NULL stack
> > pointers */
> > +       nop
> 
> There seems to be some confusion here....
> 
> You want clone() to return -1, and set errno =3D -EINVAL. The logic to =
do
> this is in .Larg_error. Probably better here to just detect the two
> error conditions and branch to .Larg_error and handle all the logic the=
re.
> 
> >         /* Save the fn ptr and arg on the new stack.  */
> >         stwm            %arg0, 64(%arg1)
> > @@ -94,13 +102,35 @@
> >  #endif
> >         /* Set errno */
> >         copy            %ret0, %r3
> > -       b               __syscall_error
> > +       bl              __syscall_error, %rp
> >         sub             %r0, %ret0, %arg0
> >         copy            %r3, %ret0
> >         /* Return after setting errno */
> > +       /* Restore rp from ENTRY() */
> > +       ldw             -84(%sp), %rp
> 
> Right now since you don't store rp, this will give you junk.
> 
> > +.Larg_error:
> > +
> > +       /* Save arg0: the fn ptr.  */
> > +       stw             %arg0, -36(%sp)
> 
> In the error case, you don't invoke the function, so no need to save an=
d
> restore arg0.
> 
> > +       /* Save the PIC register? */
> > +       stwm            %r3, 64(%sp)
> 
> r3 is just a caller-save register; it has nothing to do with PIC. You
> don't need to use r3 in this path; just create a stack frame with:
> 	ldo 64(%sp), %sp
> 
So excepted this above stuff (for which I didn't yet understand the pb) a=
nd
inlining __syscall_error() (not yet enough knowledge to do), ...

> > +       /* Set errno */
> > +       copy            %ret0, %r3
> > +       bl              __syscall_error, %rp
> > +       sub             %r0, %ret0, %arg0
> 
> Here, I think you want to do (or inline the __syscall_error logic):
> 	bl __syscall_error, %rp
> 	ldi EINVAL, %arg0
> 	ldi -1, %ret0
> 
> > +       /* Restore arg0: the fn ptr.  */
> > +       ldw             -100(%sp), %arg0
> > +       /* Return after setting errno */
> > +       /* Restore rp from ENTRY() */
> > +       ldw             -84(%sp), %rp
> > +       bv              %r0(%rp)
> > +       ldwm            -64(%sp), %r3
> 
> and here you can just do:
> 	ldw -84(%sp), %rp
> 	bv %r0(%rp)
> 	ldo -64(%sp), %sp
> 
here is the last proposal:
--- glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S.orig2      2006-03-2=
4
10:11:27.000000000 +0100
+++ glibc-2.3.6/sysdeps/unix/sysv/linux/hppa/clone.S    2006-03-30
13:56:56.000000000 +0200
@@ -45,7 +45,30 @@
 
         .text
 ENTRY(__clone)
+    /* this ENTRY() macro do: stw rp, -20(sp)
+       and "FIXME: I have no idea how profiling works on hppa." */
 
+       /* Sanity check arguments.  */
+       comib,=3D         0, %arg0, .Larg_error           /* no NULL func=
tion
pointers */
+       nop
+       comib,<>,n      0, %arg1, .Lno_arg_error        /* no NULL stack
pointers */
+       nop
+
+.Larg_error:
+       /* Create a stack frame */
+       stwm            %r3, 64(%sp)
+       /* Set errno */
+       bl              __syscall_error, %rp
+       ldi             EINVAL, %arg0
+/*     ldi             -1, %ret0 */
+
+       /* Return after setting errno */
+       /* Restore rp from ENTRY() */
+       ldw             -84(%sp), %rp
+       bv              %r0(%rp)
+       ldwm            -64(%sp), %r3
+
+.Lno_arg_error:
        /* Save the fn ptr and arg on the new stack.  */
        stwm            %arg0, 64(%arg1)
        stw             %arg3, -60(%arg1)
@@ -94,10 +117,12 @@
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

May be should I still put the:
+       /* Create a stack frame */
+       stwm            %r3, 64(%sp)

in the delay slot of the first cmpib,=3D (on going to test ...)

Thanks,
    Joel=0A=0A-------------------------------------------------------=0AN=
OTE! My email address is changing to ... @scarlet.be=0APlease make the ne=
cessary changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
