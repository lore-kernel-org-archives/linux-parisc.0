From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Fwd: hppa glibc clone() patch proposal (3/3)
Date: Mon, 27 Mar 2006 09:33:44 +0800
Message-ID: <442740F8.6070408@tausq.org>
References: <IWMNAP$23D07646E4F7FC13AA5E343EDFB71AEA@scarlet.be>		<119aab440603241148k755eb8a1m10982b0538fc2cf3@mail.gmail.com>		<119aab440603241150p3e15057gc23e355732c1dea@mail.gmail.com>		<442467DF.8060309@tiscali.be>		<119aab440603241504m5f1f8a97tebe4110185d5ac4c@mail.gmail.com>		<4424F7EE.7020002@tiscali.be>	<119aab440603251126s3a599718n32759d5ed0dcd8c0@mail.gmail.com>
	<4426D6A6.5050503@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4426D6A6.5050503@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Joel,

Some comments:

1) I think you are right in fixing the first __syscall_error call. I
don't know why we are doing a b instead of bl now. It seems to be that
the current code will result in an orphaned stack frame if we ever
errored out. However, I see that in the other syscalls, the call to
__syscall_error is inlined. Maybe that would be better.....

2)
>          .text
>  ENTRY(__clone)
> +    /* this proto do: stw rp, -20(sp) */

Yes, you should put "stw %rp, -20(%sp)" here.

> +       /* FIXME: I have no idea how profiling works on hppa. */

Let's leave profiling out of this for now....

> +       /* Sanity check arguments.  */
> +       comib,=         0, %arg0, .Larg_error   /* no NULL function
> pointers */
> +       ldi             -EINVAL, %ret0
> +       comib,=         0, %arg1, .Larg_error   /* no NULL stack
> pointers */
> +       nop

There seems to be some confusion here....

You want clone() to return -1, and set errno = -EINVAL. The logic to do
this is in .Larg_error. Probably better here to just detect the two
error conditions and branch to .Larg_error and handle all the logic there.

>         /* Save the fn ptr and arg on the new stack.  */
>         stwm            %arg0, 64(%arg1)
> @@ -94,13 +102,35 @@
>  #endif
>         /* Set errno */
>         copy            %ret0, %r3
> -       b               __syscall_error
> +       bl              __syscall_error, %rp
>         sub             %r0, %ret0, %arg0
>         copy            %r3, %ret0
>         /* Return after setting errno */
> +       /* Restore rp from ENTRY() */
> +       ldw             -84(%sp), %rp

Right now since you don't store rp, this will give you junk.

> +.Larg_error:
> +
> +       /* Save arg0: the fn ptr.  */
> +       stw             %arg0, -36(%sp)

In the error case, you don't invoke the function, so no need to save and
restore arg0.

> +       /* Save the PIC register? */
> +       stwm            %r3, 64(%sp)

r3 is just a caller-save register; it has nothing to do with PIC. You
don't need to use r3 in this path; just create a stack frame with:
	ldo 64(%sp), %sp

> +       /* Set errno */
> +       copy            %ret0, %r3
> +       bl              __syscall_error, %rp
> +       sub             %r0, %ret0, %arg0

Here, I think you want to do (or inline the __syscall_error logic):
	bl __syscall_error, %rp
	ldi EINVAL, %arg0
	ldi -1, %ret0

> +       /* Restore arg0: the fn ptr.  */
> +       ldw             -100(%sp), %arg0
> +       /* Return after setting errno */
> +       /* Restore rp from ENTRY() */
> +       ldw             -84(%sp), %rp
> +       bv              %r0(%rp)
> +       ldwm            -64(%sp), %r3

and here you can just do:
	ldw -84(%sp), %rp
	bv %r0(%rp)
	ldo -64(%sp), %sp

randolph

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
