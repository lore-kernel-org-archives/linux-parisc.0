From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Sun, 7 Apr 2013 14:39:13 -0400
Message-ID: <201304071439.15297.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <CAKgNAkgODPSWSeA8ZymiAjFBqSAZQMtQe9GW84Y6QHdFEc9S-w@mail.gmail.com> <20130407135514.GW12938@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3083340.OZ26A3xkpg";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
	"linux-man" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	Kyle McMartin <kyle-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>,
	Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>,
	"James E.J. Bottomley" <jejb-6jwH94ZQLHl74goWV3ctuw@public.gmane.org>,
	linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyle McMartin <kyle-pfcGkIkfWfAsA/PxXw9srA@public.gmane.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130407135514.GW12938-PfSpb0PWhxZc2C7mugBRk2EX/6BAtgUQ@public.gmane.org>
List-ID: <linux-man.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart3083340.OZ26A3xkpg
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sunday 07 April 2013 09:55:14 Kyle McMartin wrote:
> On Sun, Apr 07, 2013 at 12:00:50PM +0200, Michael Kerrisk (man-pages) wro=
te:
> > [Adding a few people to CC who may be able to help with Mike's doubts
> > on PA-RISC; folks, if any of you could have a quick look at the parisc
> > piece below, that would be helpful]
>=20
> The syscall number is in %r20, everything else looks correct. The
> returned value is in %r28 and the args are %r26 through %r21.

just to be clear, the only insn you need is:
	ble 0x100(%sr2, %r0);

the kernel docs say sr2 holds the kernel gateway page (so i guess 0x100 is =
a=20
known offset into that).  the docs don't mention r0 that i can see, so i'm=
=20
guessing it's one of those "always 0" registers ?

the sysdep code has an ldi call in the branch delay slot (i think), but all=
=20
that seems to do is load r20 with the syscall nr.
=2Dmike

--nextPart3083340.OZ26A3xkpg
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRYb1TAAoJEEFjO5/oN/WBK1gP/24N2rGmae6jL4w81wzHXw6B
e/io85mHhqqNHRCcnEI/d1jSlMRl02GnAyt0rZ20uaFiRxcFK8rBV/dgmY3HeerK
IAh9BPGQg/V8wwaSjjsKGPjlqKewotz3Kc6OvxRk4qniezyzU5hB8yecpl2vf6L1
PjnuoI/idI1BF8OxL0SOTTuE/LOJ2KavoJt2j5TPes1QnNLXy3JC97ibjC4qB2q6
B4rpwtOcJOm2ZytXRViAjWw3rBPAyGGvsEH7wKY/I+6A8K3YXGYOlRLowJL0J0Mf
aX6AXDlkLDy4Huoez4Z7rtQIHuEedG5wZEW/qhM6nQK2lVWlDhnOxcJ2W9dbSu++
3C28uf9XEBjwsLVd1RAGh0pUXtYe9s+tjJTjXAG0N9G4aZUR2WXiEyYlqyOFfP4q
uRd2re8w1W53t0ByhNLhkR2c41VwcJ+9+M++Vd3loQv3U7v93v0FiPB3RZFsPp4D
Yye1q/vqWwAeKwL/UIH6q+jSUuvuf2kZ2nZt2N0b9E138t5acnMU9r5/6gEDGvQp
gQAO9CBZiWcv9pTY1nzaMuUtaZJl9auFSJSlhEE8w66PdWEi4wffG9Xx2NiA50Kf
mrrcmm2Zn8bo/3IgzG2ig1ySjxWiUYf7CHx7kMPRWSfrs3QOwn996LjtIiXd/TPa
y654fvSkybJbZnPRGj15
=ZYj+
-----END PGP SIGNATURE-----

--nextPart3083340.OZ26A3xkpg--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
