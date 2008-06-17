From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: ldcw inline assembler patch
Date: Mon, 16 Jun 2008 21:56:36 -0400
Message-ID: <119aab440806161856h6133585cpfadb8fe0427e901e@mail.gmail.com>
References: <4853E587.9020802@gmx.de>
	 <119aab440806161350w4d15c14ex735377b78f697fd8@mail.gmail.com>
	 <4856D5E4.7090206@gmx.de>
	 <119aab440806161454v49c15f47k75dbf27215d4a978@mail.gmail.com>
	 <20080616215726.GD18358@phobos.i.cabal.ca>
	 <20080616220550.GB28190@parisc-linux.org>
	 <119aab440806161514j16dad9ednb1b5124f52b6f162@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Kyle McMartin" <kyle@mcmartin.ca>, "Helge Deller" <deller@gmx.de>,
	linux-parisc@vger.kernel.org,
	"John David Anglin" <dave.anglin@nrc.ca>
To: "Matthew Wilcox" <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440806161514j16dad9ednb1b5124f52b6f162@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 16, 2008 at 6:14 PM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> Given:
> mb()
> __ldcw(a)
> mb()
>
> What stops the compiler from doing?
>
> mb()
> *stack_slot = *a
> reg1 = *stack_slot

This is a mistake, and should read:

reg1 = stack_slot

e.g. Copy the address of the stack slot into reg1.

> reg2 = __ldcw(reg1)
> *a = *stack_slot
> mb()
>
> Memory is consistent before and after the memory barriers, but the
> operation is not atomic?
>
> While this seems stupid, the compile may create a memory temporary to
> shuffle things around.

The compiler creates memory temporaries all the times and expects the
optimizers to see that the temporaries are not needed. However,
sometimes the temporaries aren't removed.

Cheers,
Carlos.
