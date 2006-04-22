From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Bug#364231: exception catching broken on HPPA
Date: Sat, 22 Apr 2006 11:22:20 -0400 (EDT)
Message-ID: <200604221522.k3MFMKpi010218__3809.54022189162$1416624065$gmane$org@hiauly1.hia.nrc.ca>
References: <20060422084136.GC22720@mauritius.dodds.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: steven.robbins@videotron.ca,
 364231@bugs.debian.org,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: vorlon@debian.org (Steve Langasek)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060422084136.GC22720@mauritius.dodds.net> from "Steve
	Langasek" at Apr 22, 2006 01:41:36 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sat, Apr 22, 2006 at 10:00:04AM +0200, Matthias Klose wrote:
> > $ ldd a.out
> >         libstdc++.so.6 =3D> /usr/lib/libstdc++.so.6 (0x40575000)
> >         libm.so.6 =3D> /lib/libm.so.6 (0x4046e000)
> >         libgcc_s.so.2 =3D> /lib/libgcc_s.so.2 (0x40068000)
> >         libc.so.6 =3D> /lib/libc.so.6 (0x4074b000)
> >         libgcc_s.so.4 =3D> /lib/libgcc_s.so.4 (0x40015000)
> >         /lib/ld.so.1 (0x400e1000)
> 
> > We end up with both libgcc_s.so.2 and libgcc_s.so.4 linked.  Is there
> > a solution other than making gcc-4.1/g++-4.1 the default and
> > rebuilding the libstdc++6 dependent packages with binary NMU's?
> 
> I guess having gcc-4.0 link against libgcc4 is out of the question?

Doing so is not a good idea, but it's only going to break numeric
applications using complex numbers and possibly vectors.

The calling conventions for passing complex values was changed between
4.0 and 4.1 when it was discovered that it didn't conform to the runtime
documentation.  Support for complex and vector objects was added to GCC
some time ago.  However noone noticed that these values weren't being
passed correctly...

The change affects the routines __muldc3, __mulsc3, __divdc3 and __divsc3
in libgcc_s.  It also affects any package/library using complex numbers,
including glibc since the registers used for passing the first few
arguments and the return value have changed.  Particularly, complex
floats are no longer passed in the floating registers.

I think the approach suggested by Matthias is ultimately the only
viable solution but the impact is broader than the libstdc++6 dependent
packages.  The situation is similar to that when DWARF EH support was
introduced.  The only other option that I can see is to delay 4.1.
However, I would like 4.1 to become the default.

For the most part, the passing of complex values in 4.0 and earlier
is internally self-consistent (there's a minor incompatibility between
PA 1.0 code and PA 1.1 code due to the fact that the left and right
halves of floating-point registers are not independently accessible
when generating PA 1.0 code).

I recognized that this was going to cause pain, and brought the matter
up for discussion on the parisc-linux list a few months ago.  There
wasn't much in the way of comments for or against.  In the end, I
decided it was probably better to make the change in 4.1 and let time
smooth over the difficulties.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
