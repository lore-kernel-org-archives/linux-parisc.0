From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
	__put_kernel_asm() 64bit?
Date: Thu, 20 Apr 2006 13:09:20 -0400
Message-ID: <119aab440604201009t2e5513c4n69b4a68477998768@mail.gmail.com>
References: <IY13E1$80C55BA8C044E2D421CA2D8B24C31D6A@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: "Joel Soete" <soete.joel@tiscali.be>,
 "Parisc List" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IY13E1$80C55BA8C044E2D421CA2D8B24C31D6A@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 4/20/06, Joel Soete <soete.joel@tiscali.be> wrote:
> Please help me I hate this game:
>   - tel me why?
>   - no tel me why not?
>   - ...

This is all part of learning. We want to teach you to do some of the
research yourself before emailing to the list. When you send email you
should have some research done which contributes to the solution of
the problem. For example the research you have done below is exactly
what I would have expected from a serious hacker. This is an excellent
amount of research! Good work Joel.

> > a) What does a clobber mean from the viewpoint of an __asm?
>
> Sorry, I was the first to put this question:
> "btw I had another question: what's the meaning of 'clobber' in the sens =
of
> asm extension of gcc?

*I* know the answer. The question is intended for you to learn how to resea=
rch.
Google is a horrible research tool. I recommend going to the source. GCC ha=
s
great manuals.

a) Go to "http://gcc.gnu.org/"
b) Click on "Manual"
c) Click on "GCC 4.1.0 Manual"
d) Read sections 5.34 and 5.35 describing the behaviour of asm's.

Please read the manuals if you don't know the answer. It keeps others from
being frustrated. The manuals were written for a reason.

> > b) Which insn clobber r1?
> >
> Hey, may be am I be confused by the complexity if this stuff: fixup().

The following is not an answer to the question. Though it is a good
analysis of the problem.

[snip]

> My understanding of all those matter is: when an error occures while the =
store
> (here) insn, an interruption occures which in turn launch the
> fixup_put_user_skip_1()

A couple more questions for research :)

Q: Does the process of interruption clobber registers?
Q: Does fixup_put_user_skip_1() execute in the interruption, or after when
     returning the interrupted user process?

> imho, it would make sense that the fixup_*()'s author
> <http://cvs.parisc-linux.org/linux-2.6/include/asm-parisc/uaccess.h?r1=3D=
1.15&r2=3D1.16>
> put r1 in clobbered list "to tell the compiler the" gr1's value is modifi=
ed.

Don't trust other authors, Randolph might have made a mistake!

> > c) Should any of the __put_kernel_asm's have r1 listed as a clobber?
> imho, Yes (if there wasn't anoying fusy _probably_).

Haha! :)

> That said, according to the same logic, Mike make me also noticed that in=
 our
> unaligned.c we have e.g.:
> static int emulate_ldh(struct pt_regs *regs, int toreg)
> also shouldn't we also 'probably' put r1 in the clobbered register list.

Yes, if you can answer the questions above then you have a valid basis
for adding "r1" to the clober list.

Joel, I'm only trying to help, so stick with it, we're almost done the
problem analysis. After which there will be some *real* work to do to
fix our kernel :)

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
