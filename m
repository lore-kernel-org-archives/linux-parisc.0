Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id B7C0B48A4
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Oct 2001 11:10:39 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15opXX-0004hQ-00
	for parisc-linux@lists.parisc-linux.org; Wed, 03 Oct 2001 19:10:35 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15opWb-0000Ll-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 03 Oct 2001 19:09:37 +0200
Date: Wed, 3 Oct 2001 19:09:37 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] puffin.external.hp.com,... unreachable through quest
Message-ID: <20011003190937.A1295@dogbert.localdomain>
References: <Pine.BSF.4.30.0109300915230.69485-100000@noc.zabbadoz.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
In-Reply-To: <Pine.BSF.4.30.0109300915230.69485-100000@noc.zabbadoz.net>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Any updates on this situation? puffin is still dead from SourceForge and
some other places I tried.

Regards,

Albert

On Sun, 30 Sep 2001, Bjoern A. Zeeb wrote:

> Hi,
>=20
> after a report on nanog I tired to help to figure out why
> puffin.external.hp.com, www.parisc-linux.org and others are not
> reachable for some people out there.
>=20
> It seems there is a problem with QUEST/HP in Atlanta or behind.
>=20
> Traces to HP seem to be prevented by filters but even ping does not
> work if I check this directly from QUEST router in Atlanta via
> looking glass ( http://stat.qwest.net/flash/lg.cfm ).
>=20
> --- trace from quest router in atlanta ---
> traceroute to puffin.external.hp.com (192.25.206.4), 30 hops max, 40 byte=
 packets
>  1  atl-edge-17.inet.qwest.net (205.171.21.190)  0.514 ms  0.475 ms 0.469=
 ms
>  2  65.112.33.30 (65.112.33.30)  1.460 ms  1.436 ms  1.425 ms
>  3  * * *
> --- ping from quest router in atlanta ---
> PING puffin.external.hp.com (192.25.206.4): 56 data bytes
> --- puffin.external.hp.com ping statistics ---
> 3 packets transmitted, 0 packets received, 100% packet loss
> --- snipp ---
>=20
> I do not directly see this problem because at the momenet I am comming
> in via uunet but two other upstreams I checked here in Germany use
> kpn/quest and thus cannot reach anything in parisc related in
> 192.25.206.0 :( (and most likely more).
>=20
> All those who use kpn/quest or have it as an upstream seem to be
> cut off from mailing lists/web/cvs ?? :((
>=20
> It seems the problem has been there since Sep 25th.
>=20
> Can anybody please try to solve the problem/get information about this
> from other side (HP internal etc. ;) because even email-contacts from
> whois do not work from what I got told :( and this seems to be one of
> the bigger problems (when taking 5 days).
>=20
> Trace back from puffin or www.parisc-linux.org to 65.112.33.30 might
> help to better localize the problem (if there are no internal filters
> in hp bbn that prevent traces)
>=20
> Thanks in advance.
>=20
> --=20
> Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
> 56 69 73 69 74				http://www.zabbadoz.net/
>=20
>=20
>=20
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7u0ZRDg+hOeRZtkMRAvwRAKCXWL+viv9NR1LNGpm+Oefvn0uyaQCfUgA4
4B7cvY8uEvvOvfZKiG0FefA=
=AiFT
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
