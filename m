From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] [RFC] using 64bit wide registers with 32bit kernel
Date: Sun, 14 May 2006 00:43:36 +0200
Message-ID: <7d01f9f00605131543p1458c0c9l55863d71f1a039d8@mail.gmail.com>
References: <7d01f9f00605130841v6185b06dybae82c9f9c77e2b4@mail.gmail.com>
	<200605131707.k4DH765S029172@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200605131707.k4DH765S029172@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 5/13/06, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > Two options from there:
> > 1) we claim what I'm trying to do should not be done on parisc-linux
> > =3D> using ldd/std, MAX2 and other insns that rely on 64bit regs should
> > be prohibited by binutils for non-wide code (currently gcc/binutils
> > happily build my code with -mpa-risc-2-0, which generates level 2.0
> > non wide code)
>
> Well, hpux supports using 64-bit registers in non-wide code, so
> I don't particularly like the idea that code generation changes
> between linux and hpux.  64-bit registers are a PA 2.0 feature
> and their use is independent of whether or not the processor is
> in wide mode.

Yes I took back the wrong implication in a subsequent post.
I'm glad to hear that, that sounds sensible to me.

> > 2) we claim what I'm trying to do should be possible on parisc-linux
> > =3D> we need to fix context switching in 32bit kernels.
>
> I believe that's the correct approach.  The context state needs to
> be updated for 64-bit userspace anyway.  HP-UX has some horrible
> macros like GetSSReg for accessing register values in context data
> (see pa/save_state.h).

As James pointed out, fixing this means doubling the size of saved
registers on stack...

> config.guess for the distinguishes narrow and wide hpux kernels
> (hppa2.0, hppa2.0n and hppa2.0w).  The hppa2.0 and hppa2.0n kernels
> are narrow and don't support 64-bit context information.  As far
> as I know, wide kernels support 64-bit context information for
> the 32-bit runtime.
>
> The GMP library is one bit of code that attempts to make use of this
> capability.  It's a problem for GCC as there's no way to describe that
> a register is partially call clobbered.

There I'm a bit confused. Correct me if I'm wrong, but to be able to
effectively use 64bit registers you need the kernel to save 64bit
registers on context switch? So if the narrow kernel doesn't support
64bit context information (as it's currently the case with
parisc-linux), you can't use them?

Are you trying to say that userspace code shouldn't be using the full
registers width when running a 32bit (narrow) kernel?

If so, how can hpux support using 64bit registers in non wide mode?
Upon any context switch, their content would be messed up if only half
of it is saved...

T-Bone

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
