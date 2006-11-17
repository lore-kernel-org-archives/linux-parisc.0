From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] Re: 64-bit long double support.
Date: Fri, 17 Nov 2006 01:29:44 -0500
Message-ID: <200611170129.45825.vapier@gentoo.org>
References: <119aab440611161731p47779d1hdc7e7dbd336eb23c@mail.gmail.com>
	<200611162310.03845.vapier@gentoo.org>
	<20061117053556.GA694@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0033352241=="
Cc: dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061117053556.GA694@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0033352241==
Content-Type: multipart/signed; boundary="nextPart12153548.vamY4DsR3c";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart12153548.vamY4DsR3c
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 17 November 2006 00:35, John David Anglin wrote:
> > http://gcc.gnu.org/PR29114
>
> This has nothing to do with the discussion about long double support.

i didnt say it does ... i responding to the "testing NPTL in distros" comme=
nt

> From the PR, this only occurs in a cross from 64-bit host to 32-bit targe=
t.
> There's no 64-bit parisc-linux host...

i said that in my e-mail:
"plus, it makes it hard doing cross-compiles when my 64bit hosts"

> It would appear that the adddi3 expander in pa.md isn't used for some
> reason in the initial code expansion as it would reject the insn.  You
> are in the best position to determine where the insn is being emitted fro=
m.
> It could be being emitted from the generic code or the PA backend.  Try
> breaks on emit_move_sequence, emit_insn, emit_insn_after or
> emit_insn_before and see if you can find where the insn is being emitted.

erm, i've never debugged gcc before ... my experience involves producing=20
reduced test cases and getting others to verify/fix gcc :)

but if it'll be of help to people ...
=2Dmike

--nextPart12153548.vamY4DsR3c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUARV1W2UFjO5/oN/WBAQIYCBAAugrFrk0JGE81Ai2ATF24C3zQ77PSPjnT
lnWyMGXGATmb6Va5uk5XZld62DQI35RJayF7ik7v8EFTE9JXv5LdI0CL+AcbTzHj
HLq2ZId6Q0W/lEnZeEC4cxYB0MEGL4xYvMSisOSo3cjqbQIxKmKYLjKdqKBAfVQO
v73WclNUMyGv9/relKT+gFLUsTccPLWiLEhA6/3qKNvbxrJgvfkL4QozsZYXKm9J
o5Mh4JS4I61UuaNOzyNiVCd19w7io73uwYKqS4ZyRsUoxmnal8cfSSyAVexVV48u
K5+mbGOw1oW+4c4uSzzEDntBblllRqIPQT/fcQ0i3O/h6roxscGMzN9ZeT2JFs3O
fW9pw6WWjuY7v8mMoMsbEGFLGyV1B4nwya8temYwcUbb1pUsd6VAPf2o3ja2T1DQ
jLKK82aZz6rmCyMpS7przKUh2gznGKlCB1yc3GrUjIIePmrLyE2j5KGfCmEYnIR2
1/G5KjSRamAiXBg2Jeec0mEqhLwYqBBUKzT68mOWLKAu7tunr1q5/w634yMUSGHL
52opv3iM/HfTxggyb5UhpNy6P0cPBgDpGhXhM2dO8WuolRUMnGdoo/zs/NCJAtD5
OVpzIWGkzHN2Q5JAqPknDYngrKXi48zmmO4pRkj8c8tTPKnTtBkeMNJ4MrfdzmFK
frM9tJkq5Dk=
=/CQv
-----END PGP SIGNATURE-----

--nextPart12153548.vamY4DsR3c--

--===============0033352241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0033352241==--
