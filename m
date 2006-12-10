From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [PATCH] hppa-linux-gas binutils patch
Date: Sun, 10 Dec 2006 18:15:57 +0100
Message-ID: <200612101815.58082.deller__2707.44619560919$1416624229$gmane$org@gmx.de>
References: <200612022113.kB2LDNrS007088@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200612022113.kB2LDNrS007088@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Dave,

On Saturday 02 December 2006 22:13, John David Anglin wrote:
> > a)
> > LABEL: 		.equ VALUE		; NOTE: LABEL with COLON ':'
> > worked before on Linux, will still work. No idea about HPUX
> 
> It works on hpux.
> 
> > b)
> > LABEL 		.equ VALUE		 ; NOTE: LABEL without COLON ':'
> > never worked on Linux, and will still not work. 
> > Standard on HPUX, so gnu as never followed HP-UX here.
> 
> This also works on hpux.  I don't understand your comment about
> GNU as not following the behavior of HP as.  This is the only
> variant allowed by HP as.

I'm not sure why you didn't understood it... Maybe you just mis-read my comment ?
GNU as on Linux does _not_ accept this one, while HP as _accepts_ this syntax only.
So, GNU as and HP as differ in this one, and GNU as does not implement what HP as does.

> > c)
> > 			.equ VAR,VALUE 
> > standard gnu syntax. Didn't worked before on Linux. Will work now.
> > HP-UX probably never allowed this one.
> 
> This isn't good enough.  Either it should work under hpux or be rejected.

I think this is the culprit.
You say, that if this syntax isn't allowed on HP/UX, then it shouldn't be allowed at all on Linux either.

My thinking is, that it seems to be allowed on Linux on most(all?) platforms _except_ PARISC.
The idea of my patch was to make GNU as on Linux/HPPA understand the same things as GNU as on other _Linux_ platforms.
That's completely unrelated to and ignoring what HP as allows or forbid.

> > d)
> > LABEL:		.equ VAR,VALUE
> > never worked on Linux. Will still not work. Use eiter "LABEL:" or "VAR".
> > HP-UX probably never allowed this one.
> 
> Probably, pa_equ should be updated to check that the rest of the line
> is empty.  See s_set for an example.

But then it would be incompatible to HP-as as well.... ?!?
It's inconsitent with your comment to c)

> > @@ -3262,7 +3262,7 @@
> >        return;
> >      }
> >  
> > -  /* Look up the opcode in the has table.  */
> > +  /* Look up the opcode in the hash table.  */
> >    if ((insn = (struct pa_opcode *) hash_find (op_hash, str)) == NULL)
> >      {
> >        as_bad ("Unknown opcode: `%s'", str);
> 
> This typo fix should be a separate patch.  It's fine with the addition
> of a ChangeLog entry.

Ok.

> > @@ -6397,8 +6397,11 @@
> >      {
> >        if (reg)
> >  	as_bad (_(".REG must use a label"));
> > -      else
> > -	as_bad (_(".EQU must use a label"));
> > +      else {
> > +	/* Try gas' standard ".equ X,Y" pseudo opcode.  */
> > +      	s_set(0);
> > +	return;
> > +      }
> 
> I still have a problem with this part.  It drops the ".EQU must use a label"
> error message and s_set has no equivalent error message.  In order to support
> the alternative syntax, you need to parse the rest of the manner similar
> to that done in s_set.  We need a message that handles both ".EQU must use
> a label" and "expected symbol name".

Why do you want the ".EQU must use a label" message ?
Either the user writes
	LABEL:		.equ 5
or
				.equ LABEL , 5
In both variants the user gets a correct error message if the syntax was written wrong.

> The other problem that I see is the dropping of the check on the
> expression value:
> 
>           fudge_reg_expressions = 1;
> 	  seg = expression (&exp);
> 	  fudge_reg_expressions = 0;
> 	  if (exp.X_op != O_constant
> 	      && exp.X_op != O_register)
> 	  ...
> 
> This is likely to be problematic under hpux.  Even under linux,
> the two alternative forms don't handle equivalences in the same
> way.  Compare what assign_symbol does compared with pa_equ.

I would need to check this...
 
> It's certainly possible to do the checks described above.  However,
> I have to wonder if it wouldn't be simpler to just do the following:
> 
> #if !(defined (OBJ_ELF) && (defined (TE_LINUX) || defined (TE_NetBSD)))
>   {"equ", pa_equ, 0},
> #endif
> 
> This would yield the normal GNU syntax under linux and netbsd, and
> retain the existing syntax for other targets.  This might cause some
> current code to fail but it's not a problem for GCC.

I think this is my preferred solution.
(Is there any original HP assembly code at all compiled under Linux with GNU as ?)

> >  @ifset HPPA
> > -The syntax for @code{equ} on the HPPA is 
> > -@samp{@var{symbol} .equ @var{expression}}.
> > +On HPPA the following syntax may be used alternatively:
> > +@samp{@var{symbol:} .equ @var{expression}}
> 
> This also isn't quite right.  See my comment to "b)".  Symbol must
> be a label symbol.

Hmm... I just added the colon. What is exactly wrong ? Do you mean:
+@samp{@var{label:} .equ @var{expression}}

> >  @ifset HPPA
> > -The syntax for @code{set} on the HPPA is
> > -@samp{@var{symbol} .set @var{expression}}.
> > +Alternatively the syntax for @code{set} on the HPPA is
> > +@samp{@var{symbol:} .set @var{expression}}.
> >  @end ifset
> 
> Both the original and proposed change aren't right.  There is no
> special handling for .set on HPPA (see md_pseudo_table).  So, the
> HPPA bit can just be deleted.

Ok.

> In standard GNU syntax, .equ and .set are synonyms.  Since .set has
> the standard behavior, it can be used instead of .equ.  That's why
> I question modifying the syntax of .equ, but I will accept the
> change if it provides a behavior similar to the current behavior.

I see...
- .set can be used instead of .equ
- but: .equ can not be used instead of .set

Or the other alternative would be to just change all ".equ" in ".set" in:
src/binutils/testsuite/binutils-all/localize-hidden-1.s


I'm not sure how to continue now.
I was just playing around with binutils for parisc and the testsuite failed.
My trivial patch fixed it, but it seems there are more changes necessary to
"provide a behavior similar to the current behavior". I think you are right
in asking for this, but personally I don't have time and interest to dig
deeper into this problem.
You said in another mail, that 
"At the moment, I don't see a strong need to do the update."
I agree on this and since it's not really important for me either, I'm better
dropping the whole patch now.

Thanks a lot for your feedback and suggestions,
Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
