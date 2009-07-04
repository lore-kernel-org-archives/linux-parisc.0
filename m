From: Kurt Roeckx <kurt@roeckx.be>
Subject: Re: HPPA and Squeeze
Date: Sun, 5 Jul 2009 01:30:21 +0200
Message-ID: <20090704233021.GA23183@roeckx.be>
References: <20090703185756.GA323@roeckx.be> <20090704195218.1E7B4514A@hiauly1.hia.nrc.ca> <20090704210301.GB19854@roeckx.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090704210301.GB19854@roeckx.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jul 04, 2009 at 11:03:01PM +0200, Kurt Roeckx wrote:
> On Sat, Jul 04, 2009 at 03:52:16PM -0400, John David Anglin wrote:
> > > And then there is glob2 that fails with:
> > > /usr/bin/ld: libgag/src/libgag.a(FileManager.o)(.text+0x2fc8): cannot reach 0000f9bf_memcpy@@GLIBC_2.2+0, recompile with -ffunction-sections
> > > /usr/bin/ld: libgag/src/libgag.a(FileManager.o)(.text+0x2fc8): cannot handle R_PARISC_PCREL17F for memcpy@@GLIBC_2.2
> > > /usr/bin/ld: final link failed: Bad value
> > > collect2: ld returned 1 exit status
> > 
> > I couldn't duplicate the problem with binutils 2.19.1-1 and gcc-4.3
> > 4.3.3-10, or with my own binutils build on two different systems.
> > 
> > The above shouldn't happen as the text size of FileManager.o is well below
> > the size where a 17-bit branch can't reach the stub table.  Possibly, the
> > stub table is full.  On the otherhand, the "0000f9bf_memcpy@@GLIBC_2.2+0"
> > string looks garbled.  So, this may be another form of the SMP memory
> > corruption that causes the segvs, particularly if it isn't reproducible
> > on the build system.
> 
> It actually already failed twice on the same system with the same
> error.  I've just let it retry again, we'll see if it fails again.

And it failed again with the same error, on peri now.


Kurt

