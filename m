From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
	__put_kernel_asm() 64bit?
Date: Tue, 18 Apr 2006 17:35:02 -0500
Message-ID: <200604181735.02973.mszick@morethan.org>
References: <IXJXEQ$C47DD9AC94AAFC817D7A8379F72B1E8E@scarlet.be>
	<4442A5AB.5080604@tiscali.be>
	<119aab440604181335r585ab489je1bef3c952a5a79b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440604181335r585ab489je1bef3c952a5a79b@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue April 18 2006 15:35, Carlos O'Donell wrote:
> On 4/16/06, Joel Soete <soete.joel@tiscali.be> wrote:
> > Hello all,
> >
> > I tried to apply my 'beautify' asm template to some uaccess.h and figure out that
> > this hunk din't mentioned that "r1" was cloberred (iirc in fixup text) while
> > the 32bit one did:
> >
> > mmm, doesn't seems to change anything (I just check sys_parisc32.s) but may be elsewhere?
> 
> Please put on your thinking cap.
>
Please do not assume that was not step 1.

> 
> a) What does a clobber mean from the viewpoint of an __asm?
>
Why not from the syntax used?

Two possibilities:
1) Compiler can not distinguish the effects of assemble statements
on register usage.  It has to be told, as a general rule.

2) Compiler can distinguish the effects of assemble statements.
In this case, there is no reason for the clobber field.

Since there IS a clobber field in the syntax, then (2) must be
the intended assumption.

> b) Which insn clobber r1?
>
If (1) holds, it does not matter, the compiler already knows
when r1 will be trashed.

If (2) holds, the code author should know.
 
> Research both and return with the answer.
> Double marks if you solve...
> 
> c) Should any of the __put_kernel_asm's have r1 listed as a clobber?
> 
if (1) holds, it does not matter.

if (2) holds, then at least two more possibilities:

3) The compiler never carries a live value in r1 across an __asm block.
This is the same result as if r1 was listed as a clobber from the viewpoint
of preserving a value in r1 - there isn't one to preserve.

4) The compiler considers r1 a general purpose register.
In this case, the code author should not make an exception from the 
general rule implied by the supplied syntax of __asm blocks.

Q.E.D:
Safe coding practice over the lifetime of changing compiler versions
answers the question - r1 should appear in the clobber list of any
block that changes its value.

Either:
a) It makes no difference for some combinations of the above;
Or:
b) It is required.

> Cheers,
Your welcome,
Mike

> Carlos.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
