From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] Re: update mman.h in latest glibc cvs
Date: Sat, 26 Aug 2006 17:44:06 -0400
Message-ID: <200608261744.07651.vapier@gentoo.org>
References: <200608250050.34940.vapier@gentoo.org>
	<200608260059.00980.vapier@gentoo.org>
	<119aab440608260809v26134ee2w46e5166168607a5f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1945002868=="
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440608260809v26134ee2w46e5166168607a5f@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1945002868==
Content-Type: multipart/signed; boundary="nextPart3146273.IVREhkUUZ3";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3146273.IVREhkUUZ3
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 26 August 2006 11:09, Carlos O'Donell wrote:
> I appreciate it if you say "Is this patch correct?" or some indication
> that it is not final. I spend a different amount of time reviewing
> final patches than just initial hacks.

sorry, my mistake ... i'll keep that in mind in the future

> > > Please avoid superflous style changes.
> >
> > it isnt superfluous, it is the "GNU standard" and the way all other arch
> > mman.h headers are done ... so while i personally consider the GNU codi=
ng
> > standard complete garbage, glibc is a GNU project and adheres pretty
> > rigidly to the GNU coding standard
>
> I don't see a requirement for left single quote and right single quote
> in comments?

as i said i was simply doing exactly what every other arch port in glibc is=
=20
doing ... if you want to keep hppa different, well you're the maintainer ;)

> Thank you. Could you put together another patch please? If you haven't
> done a build test please tell me.

i just do cross-compile builds as my hppa's are too painfully slow to do=20
development natively :)
=2Dmike

--nextPart3146273.IVREhkUUZ3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUARPDAp0FjO5/oN/WBAQJ6mxAAimmeResj9aVp7vqO4hYPoPuUyLi1SJCR
sW5UTBr2oNL+1nNIrO457jIyPTVGgrTKQJ0ew3DVyG3r00gwORPsMw9L8mOdejVb
Ogw71hBpg97JG8E9HlELi2VygksDZ/dUnTW/PmkZAyOMp994efZYeJ2jcRG9kaM1
z0xq4IQfVutj5RF4q9w2THOfCe1JsurLxNXvazwZFbNg6PYLTMDtT51mArspVtS6
4ZYhghelHrNWiR2Vl7Xnw//NybP2SgEM9GTKuAkPZ3bNzm0uiE9KGcsSngdkhnDj
OrcX6EPAgE/oC+7cu6UkeF9RgAFB0l4r/mMzAgO23hGGW3gitDlkTuP8w/bF7SFM
rg3agQkeRqokMeYJOvNTaWPcjJLcofLksxOBPn/kLgMMymSyan/2wIO7JB8mpe7K
+FvSHlLLwPwl6Myo4nZpDmTjyRpynwdrJOn5NBtP8InxwxYHlZFzuPu6PIE1zb5M
4018zgkFN0lbgHc8XLvcesd3EMQb79QwWk2fPa6p34NySAEo6zA6bAxzixrQMoGP
xvEi1jo1Qm+njQHyWXcrkWFJZ4ixZgr+nooI8IpaPRoTYMg7wByZPTducZ4A/RcQ
F/d6PkBvGGIjQXvF/+GXiVZcGSsiESbwVs62ZTmjiQ18ans+ALrxnl+YJz3/YEjo
jnqZJn/nvO4=
=iqjn
-----END PGP SIGNATURE-----

--nextPart3146273.IVREhkUUZ3--

--===============1945002868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1945002868==--
