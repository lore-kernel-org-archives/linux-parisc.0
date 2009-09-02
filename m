From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: hppa nptl switch
Date: Wed, 2 Sep 2009 16:55:48 +0200
Message-ID: <20090902145548.GB10024@hall.aurel32.net>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz> <119aab440909010655j148ad3b8oae5328d646ef570c@mail.gmail.com> <4A9D42C3.70103@aurel32.net> <200909012003.49114.vapier@gentoo.org> <119aab440909020709m72645cf7j61103d577bd387d7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Cc: Mike Frysinger <vapier@gentoo.org>, debian-hppa@lists.debian.org,
	debian-glibc@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440909020709m72645cf7j61103d577bd387d7@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Sep 02, 2009 at 10:09:22AM -0400, Carlos O'Donell wrote:
> On Tue, Sep 1, 2009 at 8:03 PM, Mike Frysinger<vapier@gentoo.org> wro=
te:
> > i think the question was one about packaging rather than general us=
e ? =A0if you
> > build a package against a newer glibc version but it only uses olde=
r symbols,
> > then in theory it should work fine with older glibc versions. =A0if=
 the symbol
> > changes between versions, then it should have corresponding symbol =
version
> > changes as well (which will automatically be recorded in the binary=
).
>=20
> Yes, the question is specifically about packaging.
>=20
> If the answer is "Debian does not prevent you from downgrading glibc,
> even if you have new packages built against the new glibc", then I
> accept that.
>=20

With the correct shlibs and symbol files, all packages built against th=
e
new glibc will depends on libc6 (>=3D 2.10). This way it won't be possi=
ble
to downgrade the libc6 packages is packages compiled against the new
glibc are installed.

--=20
Aurelien Jarno	                        GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
