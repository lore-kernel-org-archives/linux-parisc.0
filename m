From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [RFC] using 64bit wide registers with 32bit kernel
Date: Sat, 13 May 2006 13:07:06 -0400 (EDT)
Message-ID: <200605131707.k4DH765S029172@hiauly1.hia.nrc.ca>
References: <7d01f9f00605130841v6185b06dybae82c9f9c77e2b4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: T-Bone@parisc-linux.org (Thibaut VARENE)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00605130841v6185b06dybae82c9f9c77e2b4@mail.gmail.com>
	from "Thibaut VARENE" at May 13, 2006 05:41:53 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Two options from there:
> 1) we claim what I'm trying to do should not be done on parisc-linux
> => using ldd/std, MAX2 and other insns that rely on 64bit regs should
> be prohibited by binutils for non-wide code (currently gcc/binutils
> happily build my code with -mpa-risc-2-0, which generates level 2.0
> non wide code)

Well, hpux supports using 64-bit registers in non-wide code, so
I don't particularly like the idea that code generation changes
between linux and hpux.  64-bit registers are a PA 2.0 feature
and their use is independent of whether or not the processor is
in wide mode.

> 2) we claim what I'm trying to do should be possible on parisc-linux
> => we need to fix context switching in 32bit kernels.

I believe that's the correct approach.  The context state needs to
be updated for 64-bit userspace anyway.  HP-UX has some horrible
macros like GetSSReg for accessing register values in context data
(see pa/save_state.h).

config.guess for the distinguishes narrow and wide hpux kernels
(hppa2.0, hppa2.0n and hppa2.0w).  The hppa2.0 and hppa2.0n kernels
are narrow and don't support 64-bit context information.  As far
as I know, wide kernels support 64-bit context information for
the 32-bit runtime.

The GMP library is one bit of code that attempts to make use of this
capability.  It's a problem for GCC as there's no way to describe that
a register is partially call clobbered.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
