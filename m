From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] Nonexistance of asm/offsets.h
Date: Sat, 14 Jul 2007 02:37:16 -0400
Message-ID: <200707140237.17779.vapier__23094.5320138291$1416624412$gmane$org@gentoo.org>
References: <5b2e36650707131610u7b158370ya591e2076ec980ac@mail.gmail.com>
	<119aab440707131705x5edda0cp12c5af9d0789fbf8@mail.gmail.com>
	<5b2e36650707131844w6dc26599qf9a6797a8c37d58b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0682894152=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5b2e36650707131844w6dc26599qf9a6797a8c37d58b@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0682894152==
Content-Type: multipart/signed; boundary="nextPart1460582.iDvOGuzLHn";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1460582.iDvOGuzLHn
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 13 July 2007, Jeff Bailey wrote:
> On 13/07/07, Carlos O'Donell <carlos@systemhalted.org> wrote:
> > > In the process of getting the world up, running and debugged with
> > > NPTL, Randolph has provided a patch to make gdb work better.  Building
> > > this on Ubuntu turned out to be a problem because we're using the
> > > exported kernel headers rather than the mashup that Debian has been
> > > using.
> > >
> > > The challenge is that the Debian kernel packages used to generate
> > > asm/offsets.h from the 64-bit kernel build's asm-offsets.h and make
> > > that available.  When we created linux-kernel-headers, we just
> > > imported that.
> > >
> > > Now, with the sanitised kernel headers being produced from the kernel
> > > source, this no longer seems right.  It means that there's a header
> > > that's not right for both 32-bit and 64-bit userspace, and it's being
> > > generated, so it might change by accident and break the userspace ABI.
> > >  I'd like to propose that we create a hand-crafted offsets.h that is
> > > intended for userspace consuption and then stop generating the
> > > asm-offsets.h file at build time.  I'll put together a patch to do
> > > this over the weekend unless there's objections.
> >
> > In theory a 64-bit configured kernel should generate both a 32-bit and
> > 64-bit versions of asm-offets.h. IIRC other arches use a wrapper
> > asm-offets.h that checks for a compiler builtin define e.g. __hppa64__
> > to select the right 32 or 64-bit header.
>
> Right.  The question would be how to make a 32-bit kernel generate the
> same header file so that make install_headers does the right thing for
> parisc in all cases.
>
> ppc, x86_64, and i386 don't seem to provide asm-offsets.h or offsets.h
> in their exported headers.  Should we be exporting it at all?  I'll
> look at other arches to see how they provide that data.

i mentioned this a while ago on the lists but didnt seem to get any notice ...

the way other architectures handle this is one of two ways:
 - create a similar static copy "ptrace.h" or "ptrace_offsets.h" in the kernel
 - create a local version for just gdb in the gdb sources
-mike

--nextPart1460582.iDvOGuzLHn
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.5 (GNU/Linux)

iQIVAwUARphvHUFjO5/oN/WBAQI2hA//QJhCih8YNtbjbibAxWzXmL9RoM+TNb7c
KsTo0z5oN4DktuCjPdrcaPdUg98xUKFq0iTeMtNRIv3qVAYw/HnIhiboywImAflN
dWFYMKDpJXmr6t8gh6Ff4+ICWCFDGc6yKcqdHOSf2c9CB/3sjJm+Jn9kVCxZzChF
Q2UjZX4sGRHrPik1Z22OB954L25dnttLZOmFA5qSJPva4AUFevF+s6zoZCKEBQ0b
Dwkocv0yeNB3vSH/0DZEUodAJMjtnUX796aFLLId9g3Rdu+eCTCbW2LlaKqS0Ay/
98yoBZqPiDWQCpk2l2875wV9ONLYri4KH3xNkVTchxLGFhekXQ4hLR0C/9OSIBlU
3fxRh/XIbcYQRkCohT6l4VKhfAQupdPhjIJxsSny7SGMgH7oEdcH7hpqUcVtF4XL
7MP57nV3g1Qn3gV8m8DpTAOxcRcMfo0O1NtA4VW4hxGo/rhamjqvBVB8VXfvgqrQ
pubG2rIhqY6Nb5jjqc8kQ8l/toJKvh8hr0potDV8aHKmorAIDnSi7TNQY5tubfic
vX7+Mn9GsX/wL1jius75XjolbMWWoX8CMTZrRKgcMmcCqjtSDGO0tiMB+QkcsQ7a
krZFrIq0n+izw/Jqy6xf902klOlSZZ7cltmARlx67SCo6AXEpzfCTiX8KJpEyKBm
7OTy3zx/ai4=
=vJZo
-----END PGP SIGNATURE-----

--nextPart1460582.iDvOGuzLHn--

--===============0682894152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0682894152==--
