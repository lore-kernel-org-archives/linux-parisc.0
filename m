Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA07422
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Dec 2000 22:26:13 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 6 Dec 2000 05:28:48 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id QAA03164;
	Wed, 6 Dec 2000 16:28:27 +1100
Date: Wed, 6 Dec 2000 16:28:27 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: law@redhat.com, gcc-bugs@gcc.gnu.org, gcc-patches@gcc.gnu.org,
        parisc-linux@thepuffingroup.com
Subject: Re: testcase for hppa64 gcc bug
In-Reply-To: <200012060415.XAA19968@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0012061607530.16721-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 5 Dec 2000, John David Anglin wrote:

> >   > 2000-11-07  John David Anglin  <dave@hiauly1.hia.nrc.ca>
> >   > 
> >   > 	* pa-linux64.h (ARG_POINTER_INVARIANT): Define even when the
> >   > 	arg_pointer is being eliminated.
> >   > 	(ELIMINABLE_REGS): Enable elimination of the arg_pointer.
> >   > 	(INITIAL_ELIMINATION_OFFSET): Revise offsets for arg_pointer.
> >   > 	* pa.md (mulsi3, divsi3, udivsi3, modsi3, umodsi3 and
> >   > 	canonicalize_funcptr_for_compare): Put "(reg:SI 26)" inside
> >   > 	unspec to prevent elimination.
> >   > 	(call, call_value): Always USE the arg_pointer for TARGET_64BIT.
> >   > 	Use the new addmovdi3 insn to load the arg_pointer register.
> >   > 	(addmovdi3 and mov_from_r29_si): New insn and expand which prevent
> >   > 	r29 from being eliminated in call setups and millicode returns.
> > I haven't followed this discussion too closely.  Is this patch still needed
> > after some of the recent changes in how we compute liveness for the argument
> > pointer?
> 
> I think this needs to be reexamined.  Allan's ARG_POINTER_INVARIANT patch
> might not be needed now.

It's still needed.  The problem is that gcc thinks the arg pointer is
unchanged from the entry value to a function, even when the arg pointer
needs to be set to call other functions.

Actually, given the nature of the problem, I'm inclined to think that all
targets that use an arg pointer should probably define
ARG_POINTER_INVARIANT = 0.  Or equivalently, don't apply my
ARG_POINTER_INVARIANT patch and simply remove tests for arg_pointer_rtx in
rtx_unstable_p, rtx_varies_p, rtx_addr_can_trap_p, function_invariant_p,
loop_invariant_p, and possibly other places I've missed.

Here's the testcase again:

extern void abort(void);

char p;

int f1 (char **);
int f2 (char *, char **);

char *f3 (char *a, char *b)
{
  char *c = 0;

  if (f1 (&b) != 0)
    goto out;

  /* hppa64 passes bogus value for b */
  f2 (b, &c);

out:
  return c;
}

int f1 (char **x)
{
  if (*x != &p)
    abort ();
  return 0;
}

int f2 (char *a, char **b)
{
  if (a != &p)
    abort ();
  *b += 1;
  return 0;
}

int main (void)
{
  if (f3 (0, &p) != (char *) 0 + 1)
    abort ();
  return 0;
}

Results of compiling with -O2 -S for hppa64-hpux11-gcc built from CVS
of less that an hour ago.

	.LEVEL 2.0w
gcc2_compiled.:
	.IMPORT f1,ENTRY
	.IMPORT f2,ENTRY
	.text
	.align 8
	.EXPORT f3,ENTRY
f3
	.PROC
	.CALLINFO FRAME=128,CALLS,SAVE_RP,ENTRY_GR=3
	.ENTRY
	std %r2,-16(%r30)
	ldo -56(%r29),%r26	! r26 = &b = r29 - 56
	ldo 128(%r30),%r30
	std %r4,-104(%r30)
	copy %r27,%r4
	std %r25,-56(%r29)
	ldo -16(%r30),%r29
	b,l f1,%r2
	std %r0,-120(%r30)
	ldo -16(%r30),%r29	! arg pointer set to current frame
	ldo -120(%r30),%r25
	cmpib,= 0,%r28,L$0005
	copy %r4,%r27
L$0004
	ldd -120(%r30),%r28
L$0006
	ldd -144(%r30),%r2
	ldd -104(%r30),%r4
	bve (%r2)
	ldo -128(%r30),%r30
L$0005
	ldo -64(%r29),%r29	! r29 = curr_r30 - 16 - 64
	b,l f2,%r2
	ldd 8(%r29),%r26	! try to load b from r29 - 56, but
				! gcc misses fact that r29 has changed
	b L$0006
	ldd -120(%r30),%r28
	.EXIT
	.PROCEND
[snip]

-- 
Linuxcare.  Support for the Revolution.
