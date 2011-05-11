From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please include the namespace file-descriptors tree in
 linux-next
Date: Wed, 11 May 2011 10:27:36 +1000
Message-ID: <20110511102736.7a9dc881.sfr@canb.auug.org.au>
References: <m1sjsmp44c.fsf@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__11_May_2011_10_27_36_+1000_ZDCInZlK1ZAJYEjf"
Cc: "David S. Miller" <davem@davemloft.net>,
	linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	James Bottomley <James.Bottomley@suse.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: ebiederm@xmission.com (Eric W. Biederman)
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <m1sjsmp44c.fsf@fess.ebiederm.org>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Signature=_Wed__11_May_2011_10_27_36_+1000_ZDCInZlK1ZAJYEjf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Tue, 10 May 2011 15:44:51 -0700 ebiederm@xmission.com (Eric W. Biederman=
) wrote:
>
> These changes have just been through review and I expect
> to send Linus a pull request when the merge window opens.
>=20
> This tree holds changes that significantly simply the userspace
> interface to working with namespaces.
>=20
> I had to pull some of net-next and the parisc tress to be able to
> avoid conflicts with system call numbers.  Hopefully that is not
> a problem.

That should be fine as Dave's tree never rebases and the parisc tree
looks pretty stable.  Just keep an eye on those trees, just in case.

> git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/linux-2.6-nsfd.git

This tree will be added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Wed__11_May_2011_10_27_36_+1000_ZDCInZlK1ZAJYEjf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNydf4AAoJEDMEi1NhKgbsl40H/idD8BlhHCozuDDBeytOuwKM
9NBAOQlglG5yC6Cw02chkXZjXs2S7P5JkLqY29oaqiUQJOoLI2Eg4G7UHRmR4TgO
GFj/tKzYBzOZ/pr3qvxT6qTgBOmUFmHPQmB8RTAO5E7xWL/RgU/r6FImBOvmqICO
5qz2rEU0ktXLcNztYkmm4m+GzFmBsWWH93yjdfnQTAiFB3mmUgrFVklxQ+8wxJi4
GcJ3QjKEx24vdn6Hy71mZxFELF+swxFZdo7GfLSQx+c4EtmJQjvNIFmCamtMopjk
b+iAzujGwAk31G1f6ovclwj8gsKSXUr4hiBc1OhQJZidHv9Xlb7frakemStNeuw=
=tTUE
-----END PGP SIGNATURE-----

--Signature=_Wed__11_May_2011_10_27_36_+1000_ZDCInZlK1ZAJYEjf--
