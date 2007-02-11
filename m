From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Expect defunct, kill -9 panics kernel?
Date: Sun, 11 Feb 2007 14:35:06 -0600
Message-ID: <1171226106.3406.47.camel__9782.75502934611$1416624285$gmane$org@mulgrave.il.steeleye.com>
References: <200702101937.l1AJb7Uo014941@hiauly1.hia.nrc.ca>
	<1171158607.3373.54.camel@mulgrave.il.steeleye.com>
	<119aab440702110909r2018a297k98b4f1baed54821a@mail.gmail.com>
	<1171221592.3406.32.camel@mulgrave.il.steeleye.com>
	<119aab440702111221k19b2643em26ac943399274b9f@mail.gmail.com>
	<119aab440702111222v3562f308v9808b4dea7b73d59@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702111222v3562f308v9808b4dea7b73d59@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-02-11 at 15:22 -0500, Carlos O'Donell wrote:
> On 2/11/07, Carlos O'Donell <carlos@systemhalted.org> wrote:
> > The faulting instruction is:
> >   74:   52 82 00 20     ldd 10(r20),rp
> >
> > Which is just before the curr->func call.
> >   78:   e8 40 f0 00     bve,l (rp),rp
> >   7c:   52 9b 00 30     ldd 18(r20),dp
> >
> > So your assumption was correct. The value of curr->func is null.
> > How did the list get corrupted?
> 
> ... to be precise, the faulting instruction is the break at 0x10 that
> we use for null pointer dereferences.

Right, now here's a bit of really useful detective work:

In the same piece of disassembly can you see what happens to %r26 ...
the first argument to __wake_up_common() which is the wait queue?  It
may be clobbered, but if it isn't by the time we fault we know that
0x45f10250 is the address of the wait queue.  If we're incredibly lucky,
it's a symbol in the vmlinux, can you see if it is (and if it's valid)?

Knowing what the wait queue is will tell us (hopefully) with precision
where the fault lies.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
