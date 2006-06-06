From: Kai Holthaus <kmh@sonic.net>
Subject: Re: [parisc-linux] Module Relocation Problem
Date: Mon, 5 Jun 2006 20:20:52 -0700
Message-ID: <200606052020.52908.kmh@sonic.net>
References: <200606060307.k5637AbL016980@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1888165773=="
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606060307.k5637AbL016980@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1888165773==
Content-Type: multipart/signed; boundary="nextPart6890163.XNQZBiOGki";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart6890163.XNQZBiOGki
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

> That's R_PARISC_PCREL21L.  I was afraid this might happen.
>
> About the only easy things are "-Os" and "-fno-inline-functions".
> These might shrink the module a bit.  Oh, "-fno-unroll-loops" might
> also help.

Thanks again for your help - and unfortunately these didn't do the trick,=20
either - same results.

Looking over your earlier reply, you indicated that the module must be=20
quite "large" - do you mean file size of the .ko file?
Because that is way under the 8MB you mentioned - the file is around 200kB =
in=20
size...

The qc-usb module is a driver for Logitech's QuickCam Express cameras, whic=
h=20
are using the kernel usb and video4linux drivers...

Thanks again,

	Kai

=2D-=20
Hofstadter's Law:
  "It always takes longer than you expect,
   even when you take into account Hofstadter's Law."
                             -- Douglas R. Hofstadter

kmh.AT.sonic.net

Check out Mission Octagon - a new, exciting novel!
http://www.missionoctagon.com

--nextPart6890163.XNQZBiOGki
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBEhPSUwl7N6T1/FugRAq7wAJ0TVYjhb7Z7hnc1+OFIA+qVYWMj3wCgqXoi
OJARjAjxUUwVHq5JdpTTbOQ=
=hrsG
-----END PGP SIGNATURE-----

--nextPart6890163.XNQZBiOGki--

--===============1888165773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1888165773==--
