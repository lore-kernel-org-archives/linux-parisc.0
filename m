From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: ldcw inline assembler patch
Date: Mon, 16 Jun 2008 23:34:01 -0400
Message-ID: <119aab440806162034m3800b8ebxfc001bbe5e2b4b9a@mail.gmail.com>
References: <4853E587.9020802@gmx.de>
	 <119aab440806161350w4d15c14ex735377b78f697fd8@mail.gmail.com>
	 <4856D5E4.7090206@gmx.de>
	 <119aab440806161454v49c15f47k75dbf27215d4a978@mail.gmail.com>
	 <20080616215726.GD18358@phobos.i.cabal.ca>
	 <20080616220550.GB28190@parisc-linux.org>
	 <119aab440806161514j16dad9ednb1b5124f52b6f162@mail.gmail.com>
	 <119aab440806161856h6133585cpfadb8fe0427e901e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Kyle McMartin" <kyle@mcmartin.ca>, "Helge Deller" <deller@gmx.de>,
	linux-parisc@vger.kernel.org,
	"John David Anglin" <dave.anglin@nrc.ca>
To: "Matthew Wilcox" <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440806161856h6133585cpfadb8fe0427e901e@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 16, 2008 at 9:56 PM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> The compiler creates memory temporaries all the times and expects the
> optimizers to see that the temporaries are not needed. However,
> sometimes the temporaries aren't removed.

It turns out this should never happen because raw_spinlock_t->lock is volatile.

Therefore the memory clobber is not required.

The memory barriers will prevent code from being moved before the lock
or past the unlock.

Cheers,
Carlos.
