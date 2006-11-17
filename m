From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] gcc ICE PR29114 (was: 64-bit long double support.)
Date: Fri, 17 Nov 2006 16:16:01 -0500
Message-ID: <200611171616.02722.vapier@gentoo.org>
References: <119aab440611161731p47779d1hdc7e7dbd336eb23c@mail.gmail.com>
	<20061117205126.GA15716@hiauly1.hia.nrc.ca>
	<200611171612.36286.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_SaiXF7fy2/dbKAm"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 dave.anglin@nrc.ca
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611171612.36286.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_SaiXF7fy2/dbKAm
Content-Type: multipart/signed; boundary="nextPart1315750.gZm9xlAsX3";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1315750.gZm9xlAsX3
Content-Type: text/plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 17 November 2006 16:12, Mike Frysinger wrote:
> updated trace with automatic pretty prints attached to each breakpoint

here's the .gdbinit i'm using btw
-mike

--nextPart1315750.gZm9xlAsX3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUARV4mkkFjO5/oN/WBAQJ0aA//f5mnd70YaJq4tGd2R0gXpk44AeRLeRgS
qs+RMjH2gmUkhyVLPwoxzkkmk71NgrvejwkkyG4qN51L3n4MVhhHUcxmEWpG6tG9
akcAtXxhq70YEkFQmkJcwLeSJWOeq+xduzqVifCN9gakRH+7xBvtUuYU8Pcn6aKS
ubfR/vgrr0vDIqW2eXV4b6mUlE/BVe0rbtKA7OPOvGHyFmZKWOs89f40I6Yj4Y01
1j58uObCIMX06ToPItbm536obzEqM9TM3ZWf2rI1AMXu1lfKB3sYtg2xtB7Kuty8
+K5agq1pD9ciyWHp38AWQaM2fwlTclxb1zzaEWgg8J5LRxmJ+8ofdwEv450RMRXN
6YXcjBDN1x+YTspDDNOoiN4IIqtwqvEoHUvbJL84u8uhmV0s+GV5ErDeOfmPkog/
czbd440sJwgagiOJgPUwXfyhp+Qip5kRyWVZ2aNPkeiU784Dvao8PIGzTXpOAyu1
DkTO8Xga6uYGaDQ/sRlM6YRWX60tQLnem6WQXL5ESUFhVfL9bC9ZNK8t/oj/hdUY
kUgki3gudp+RPje2FWaEHeguFd+q9hZAV/Ilk0LsNx3i5iSLJpJpW9EV/3sdkRka
sVvz4FjfbYxs8tep+xJKdlL1wJW+F8v89g2WWb/xSGjGDwWWnllwEUKv6NdSWGsP
Jk8q1JmPWYY=
=nOQZ
-----END PGP SIGNATURE-----

--nextPart1315750.gZm9xlAsX3--

--Boundary-00=_SaiXF7fy2/dbKAm
Content-Type: text/plain;
  charset="iso-8859-6";
  name=".gdbinit"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=".gdbinit"

file gcc/cc1
set args -fpreprocessed ../seed48_r.i -quiet -dumpbase seed48_r.i -auxbase seed48_r -version -o /tmp/cc9E3kFl.s

b emit_move_sequence
b emit_insn
b emit_insn_after
b emit_insn_before
commands 1
	print *operands[0]
	print *operands[1]
end
commands 2
	if x > 0
		print *x
	end
end
commands 3
	p *pattern
	p *after
end
r

--Boundary-00=_SaiXF7fy2/dbKAm
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_SaiXF7fy2/dbKAm--
