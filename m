From: David Pye <dmp@davidmpye.dyndns.org>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Sat, 26 Mar 2005 15:51:46 +0000
Message-ID: <200503261551.47477.dmp@davidmpye.dyndns.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<1111851236.5711.17.camel@mulgrave>
	<200503261545.05372.dmp@davidmpye.dyndns.org>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1683040616=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503261545.05372.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1683040616==
Content-Type: multipart/signed; boundary="nextPart1118757.MjXZ654jfD";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1118757.MjXZ654jfD
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 26 March 2005 15:33, you wrote:

> This is a natural consequence of converting from a tasklet to a
> workqueue. =A0workqueues and msleep are controlled by the scheduler. =A0T=
he
> guarantee is not that the task will be awoken at the specified interval,
> but that the task will be marked ready to run at the specified interval.
> When it actually runs is within the gift of the scheduler and depends
> entirely on how many other runnable tasks there are and what priorities
> they have.
>
> If you want absolute control of the timings then you have to use a
> tasklet or timer (as per the original implementation)

Yep, I agree entirely. =A0The problem with the previous solution arrived be=
cause=20
of the fact that by nature of the way the LCD updates work, they're not=20
atomic - ie there's a minimum write time between each write. =A0Because=20
tasklets cannot sleep, it ends up turning into a can of worms to ensure tha=
t=20
you waited long enough, etc.=20

The old solution of writing the cmd reg one tasklet run, and the data reg t=
he=20
next generated some nasty race conditions that Grant spotted - specifically=
,=20
with lcd_print. =A0It stops the tasklet, does its thing, and restarts it. =
=A0
Unfortunately, if the tasklet had written the cmd reg before, it now expect=
s=20
to write the data reg next. This seems to be the cause of the missing lcd=20
characters you sometimes ended up with if you tried to make heavy use of=20
lcd_print.

Personally, I think the workqueue idea is better, partly because of the fac=
t=20
that it greatly simplifies led_LCD_driver, and partly because of the fact=20
that by running quite a bit less often, should impose lower CPU time usage.
(and not just because I wrote the patch ;)

Cheers,

David

--nextPart1118757.MjXZ654jfD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCRYUTOIrGtzS07WgRAugbAJ9d9Mi485TrhxKYwGB2OHW8MMHhVgCgkbOu
kJG1umowQL0//ZuP9RjKjOQ=
=iZKS
-----END PGP SIGNATURE-----

--nextPart1118757.MjXZ654jfD--

--===============1683040616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1683040616==--
