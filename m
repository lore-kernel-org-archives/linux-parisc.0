From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] input constraints in atomic.h too loose ?
Date: Sat, 10 Feb 2007 23:42:39 -0500
Message-ID: <200702102342.40341.vapier__40837.3173246675$1416624281$gmane$org@gentoo.org>
References: <200702102101.l1AL11Ai017315@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1654415512=="
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702102101.l1AL11Ai017315@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1654415512==
Content-Type: multipart/signed; boundary="nextPart2439162.zFk8PRxdZn";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2439162.zFk8PRxdZn
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 10 February 2007, John David Anglin wrote:
> > static void __lll_mutex_lock(int *futex)
> > {
> > 	int lws_errno =3D 14;
> > 	int lws_ret;
> > 	asm (
> > "0:					\n\t"
> > "copy	%3, %%r26			\n\t"
> > "copy	%4, %%r25			\n\t"
> > "copy	%5, %%r24			\n\t"
> > "ble	" "0xb0" "(%%sr2, %%r0)		\n\t"
> > "ldi	" "0" ", %%r20		\n\t"
> > "cmpib,=3D,n " "11" ",%%r21,0b	\n\t"
> > "nop					\n\t"
> > "stw	%%r28, %0			\n\t"
> > "sub	%%r0, %%r21, %%r21		\n\t"
> > "stw	%%r21, %1			\n\t"
> >
> > : "=3Dm" (lws_ret), "=3Dm"(lws_errno), "=3Dm"(*futex)
> > : "r"(futex), "r"(0), "r"(1)
> > :"r1", "r26", "r25", "r24", "r23", "r22", "r21", "r20", "r28", "r31",
> > : "memory"
> >
> > );
> > }
>
> Aren't lws_errno and lws_ret supposed to be global?  As is, they
> are just local variables and do nothing.

right, as they should be i think ... the sample here is reduced preprocesse=
d=20
code so you lose the visibility that ___lll_mutex_lock() is really just an=
=20
expanded macro from the atomic.h header and you lose a lot of the actual co=
de=20
(i removed the stuff that wasnt involved with the bad code generation)

lws_ret for sure should not be a local variable as that is the return value
=2Dmike

--nextPart2439162.zFk8PRxdZn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.2 (GNU/Linux)

iQIVAwUARc6ewEFjO5/oN/WBAQIeLw/9F2Yh9wncGii7bhFLelCGL+OC3kHCoM/X
MuvzAbZZdsljUMsefUKiVHMa/DITpM/P/UQabcO4DwGfKLBDQlnc1D4bO724LJCn
ISM81LlLbbMjI4NwDrTNqyKL7k2GHR0Nh66oxKVuePwteQoyvbe1jwXrctl7eYPY
E4yMuR3iI3Lv37rJoiXJtQu850dxjMNGnzVLvuY++pSYIhI/y6TH6qtb8mgFVbWQ
qVQIKeL5Iz9K4wL/0FfQnzBPXYjHDFioWgAj2q3/4+CxpHVU33IF7RlBC9UnPAct
yMlD/oLLfSnWt0Zhn4XR5LrmDVgFxYJzw3M61BjcZ/DAp3zK3sIbrGlMvl9YwD9N
zF2rCyCm7zqNUzc7+v+m3ZUdETIaat/3akHgbxROkPWpCHvejkrf1JMa2VV9ypxt
rkjhr/MQLb+2yFhG8FOySZF/w4R8mwviogXeGMqLpp0bevVJng9nkd0W94muGDn/
9zfgCwJDvtHPJ180YBfRdEvDN2OP2noyp/HnZMV5KQDG/xa/43hSS1/y7BeVCYI7
NPn/ggb2jCz5EHZrxg6yD8JG2AtLUNe+GeU3ObemxcYw7V+ScmPFZDbGaKUFSGgJ
cn+I0FF/chf4z+xmlnjnj6oPYTwrkC53RodDn4ReoMNcUM0wGL+m2L+QmW9E1vQe
0XktceXi5y8=
=JLLe
-----END PGP SIGNATURE-----

--nextPart2439162.zFk8PRxdZn--

--===============1654415512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1654415512==--
