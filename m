From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] Re: NPTL pthread_cancel and libgcc_s.so.2 vs.
	libgcc_s.so.1 (Why the DSO version bump?)
Date: Wed, 3 Aug 2005 10:53:48 -0400
Message-ID: <20050803145343.GO9703@systemhalted.org>
References: <20050803044244.GN9703@systemhalted.org>
	<200508030502.j7352e22021888@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200508030502.j7352e22021888@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Aug 03, 2005 at 01:02:40AM -0400, John David Anglin wrote:
> > i386 only has libgcc_s.so.1 and I'm pretty sure that it is compiled with
> > dwarf2 support. hppa only has libgcc_s.so.1 and it is sjlj for sure.
> > 
> > So we have an inconsistent numbering problem?
> 
> Yup, but it was unavoidable.  Look on the positive side, i386 doesn't
> support sjlj ;)

Haha! :)
 
> > The code on hppa should try to load "libgcc_s.so.2" then?
> 
> Yes.

Perfect. I added some macros to glibc and this worked. It loaded
libgcc_s.so.2 perfectly and the cancellation seems to work. If only I
could fix the other segfault bugs.

> > > > Thus NPTL thread cancellation seems to requires dwarf2 eh support.
> > > > How do I enable sjlj versus dwarf2 (--enable-dwarf2-exceptions?)
> > > 
> > > dwarf2 is the default.  --enable-sjlj-exceptions=yes enables sjlj.
> > > Debian gcc-3.3 uses sjlj.  Debian gcc-3.4 and later use dwarf2.
> > 
> > Okay, perfect.
> 
> Basic TLS support in GCC is currently in the CVS head and will be
> part of gcc-4.1 when it is released.  As long as you don't configure
> it with --enable-sjlj-exceptions=yes you will get "libgcc_s.so.2".

Yes, this is what I was seeing. For the TLS toolchain we are using
dwarf2.

Thanks for the help.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
