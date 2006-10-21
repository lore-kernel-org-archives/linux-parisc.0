From: Jeff Bailey <jbailey@raspberryginger.com>
Subject: [parisc-linux] [patch] Remove magic constant from gas/tc-hppa.c
Date: Sat, 21 Oct 2006 14:17:19 -0400
Message-ID: <1161454639.7854.57.camel__16996.0180450746$1416624198$gmane$org@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0472440696=="
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: binutils <binutils@sources.redhat.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============0472440696==
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-77QsHRR0wCfpeR1DfWwm"


--=-77QsHRR0wCfpeR1DfWwm
Content-Type: multipart/mixed; boundary="=-2rleWUrZ+6cxESpkseUj"


--=-2rleWUrZ+6cxESpkseUj
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I was reading through the gas hppa bits trying to find something for the
hppa64 port and wanted to clean this up.  If these types of patches are
acceptable, I'll probably feed a steady stream of them in.

2006-10-21  Jeff Bailey  <jbailey@raspberryginger.com>

        * config/tc-hppa.c: Use defines from bfd.h instead of magic constan=
ts.



--
Jeff Bailey - http://www.raspberryginger.com/jbailey/

--=-2rleWUrZ+6cxESpkseUj
Content-Disposition: attachment; filename=tc-hppa.c.diff
Content-Type: text/x-patch; name=tc-hppa.c.diff; charset=UTF-8
Content-Transfer-Encoding: base64

SW5kZXg6IHRjLWhwcGEuYw0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KUkNTIGZpbGU6IC9jdnMvc3JjL3NyYy9nYXMv
Y29uZmlnL3RjLWhwcGEuYyx2DQpyZXRyaWV2aW5nIHJldmlzaW9uIDEuMTMyDQpkaWZmIC11IC1w
IC1yMS4xMzIgdGMtaHBwYS5jDQotLS0gdGMtaHBwYS5jCTcgSnVuIDIwMDYgMTE6Mjc6NTcgLTAw
MDAJMS4xMzINCisrKyB0Yy1ocHBhLmMJMjEgT2N0IDIwMDYgMTc6NDg6NTkgLTAwMDANCkBAIC0x
MDUsMTIgKzEwNSw2IEBAIHR5cGVkZWYgc29tX3N5bWJvbF90eXBlIG9ial9zeW1ib2xfdHlwZTsN
CiAjZW5kaWYNCiAjZW5kaWYgLyogT0JKX1NPTSAqLw0KIA0KLSNpZiBUQVJHRVRfQVJDSF9TSVpF
ID09IDY0DQotI2RlZmluZSBERUZBVUxUX0xFVkVMIDI1DQotI2Vsc2UNCi0jZGVmaW5lIERFRkFV
TFRfTEVWRUwgMTANCi0jZW5kaWYNCi0NCiAvKiBWYXJpb3VzIHN0cnVjdHVyZXMgYW5kIHR5cGVz
IHVzZWQgaW50ZXJuYWxseSBpbiB0Yy1ocHBhLmMuICAqLw0KIA0KIC8qIFVud2luZCB0YWJsZSBh
bmQgZGVzY3JpcHRvci4gIEZJWE1FOiBTeW5jIHRoaXMgd2l0aCBHREIgdmVyc2lvbi4gICovDQpA
QCAtODI1OSw3ICs4MjUzLDExIEBAIG1kX2JlZ2luICh2b2lkKQ0KICAgY2FsbF9pbmZvX3Jvb3Qg
PSBOVUxMOw0KIA0KICAgLyogU2V0IHRoZSBkZWZhdWx0IG1hY2hpbmUgdHlwZS4gICovDQotICBp
ZiAoIWJmZF9zZXRfYXJjaF9tYWNoIChzdGRvdXRwdXQsIGJmZF9hcmNoX2hwcGEsIERFRkFVTFRf
TEVWRUwpKQ0KKyNpZiBUQVJHRVRfQVJDSF9TSVpFID09IDY0DQorICBpZiAoIWJmZF9zZXRfYXJj
aF9tYWNoIChzdGRvdXRwdXQsIGJmZF9hcmNoX2hwcGEsIGJmZF9tYWNoX2hwcGExMCkpDQorI2Vs
c2UNCisgIGlmICghYmZkX3NldF9hcmNoX21hY2ggKHN0ZG91dHB1dCwgYmZkX2FyY2hfaHBwYSwg
YmZkX21hY2hfaHBwYTIwdykpDQorI2VuZGlmDQogICAgIGFzX3dhcm4gKF8oImNvdWxkIG5vdCBz
ZXQgYXJjaGl0ZWN0dXJlIGFuZCBtYWNoaW5lIikpOw0KIA0KICAgLyogRm9sZGluZyBvZiB0ZXh0
IGFuZCBkYXRhIHNlZ21lbnRzIGZhaWxzIG1pc2VyYWJseSBvbiB0aGUgUEEuDQo=


--=-2rleWUrZ+6cxESpkseUj--

--=-77QsHRR0wCfpeR1DfWwm
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBFOmQv5M5hmdCYCpkRAl0JAKCmdX12fv57CtWCoPA78aONk3odgwCfWSbo
PPFUWpRjUTIf23zBGom1obA=
=8xzd
-----END PGP SIGNATURE-----

--=-77QsHRR0wCfpeR1DfWwm--


--===============0472440696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0472440696==--
