From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: NPTL pthread_cancel and libgcc_s.so.2 vs.
	libgcc_s.so.1 (Why the DSO version bump?)
Date: Wed, 3 Aug 2005 01:02:40 -0400 (EDT)
Message-ID: <200508030502.j7352e22021888@hiauly1.hia.nrc.ca>
References: <20050803044244.GN9703@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050803044244.GN9703@systemhalted.org> from "Carlos O'Donell"
	at Aug 3, 2005 00:42:45 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> i386 only has libgcc_s.so.1 and I'm pretty sure that it is compiled with
> dwarf2 support. hppa only has libgcc_s.so.1 and it is sjlj for sure.
> 
> So we have an inconsistent numbering problem?

Yup, but it was unavoidable.  Look on the positive side, i386 doesn't
support sjlj ;)

> The code on hppa should try to load "libgcc_s.so.2" then?

Yes.

> > > Thus NPTL thread cancellation seems to requires dwarf2 eh support.
> > > How do I enable sjlj versus dwarf2 (--enable-dwarf2-exceptions?)
> > 
> > dwarf2 is the default.  --enable-sjlj-exceptions=yes enables sjlj.
> > Debian gcc-3.3 uses sjlj.  Debian gcc-3.4 and later use dwarf2.
> 
> Okay, perfect.

Basic TLS support in GCC is currently in the CVS head and will be
part of gcc-4.1 when it is released.  As long as you don't configure
it with --enable-sjlj-exceptions=yes you will get "libgcc_s.so.2".

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
