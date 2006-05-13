From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] [RFC] using 64bit wide registers with 32bit kernel
Date: Sun, 14 May 2006 00:32:33 +0200
Message-ID: <7d01f9f00605131532n39626580j370336a67c98e0af@mail.gmail.com>
References: <7d01f9f00605130841v6185b06dybae82c9f9c77e2b4@mail.gmail.com>
	<1147539787.6632.7.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "James Bottomley" <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1147539787.6632.7.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 5/13/06, James Bottomley <James.Bottomley@steeleye.com> wrote:
> On Sat, 2006-05-13 at 17:41 +0200, Thibaut VARENE wrote:
> > 1) we claim what I'm trying to do should not be done on parisc-linux
> > =3D> using ldd/std, MAX2 and other insns that rely on 64bit regs should
> > be prohibited by binutils for non-wide code (currently gcc/binutils
> > happily build my code with -mpa-risc-2-0, which generates level 2.0
> > non wide code)
>
> I really don't think doubling the size of our register file on all tasks
> and doubling the size of the saved registers on stack for interruptions
> is really a sensible thing to do just so some multi-media extension can
> be made to work.

that's not my point. It's not only about "some multimedia extension".
It's about being able to do 64bit logic on 64bit-wide registers with
32bit kernels...

> > 2) we claim what I'm trying to do should be possible on parisc-linux
> > =3D> we need to fix context switching in 32bit kernels.
> >
> > Comments?
>
> There is a third possibility, and that's to execute the instruction in
> the kernel where there wouldn't be a danger of context switches, where
> the return values could be packaged properly and where it could be
> emulated if necessary.  It would be nice to use a vDSO for this, but I
> suspect Carlos' lightweight semaphore infrastructure can be pressed into
> service for this.

If by "executing the instruction" you mean one specific insn, that
sounds like a nightmare to me. I've got some routines asm-optimized
that are about 15 lines of asm. Each of these routines handle packs of
16 pixels. On a 640x480@25fps movie for instance, these routines would
typically be called at least 480000 times per second, and they're
expected to be executed as fast as possible (which is the whole point
of doing them in hand crafted asm)...

I don't know about vDSO, but the thought of having to call something
in the kernel in that perspective doesn't feel about right to me. I've
been reading other archs optimizations, and all do straight forward
asm computation.

What I'm looking for is a way to use the architecture to the best of
its design, and said design comprises 64bit wide GPRs...

If that's not possible in parisc-linux, fine, I'd just like to have
this clarified so I don't waste my time on pointless code :-)

HTH

T-Bone

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
