From: David Pye <dmp@davidmpye.dyndns.org>
Subject: Re: J5000 LCD heartbeat
Date: Sun, 20 Mar 2005 23:17:03 +0000
Message-ID: <200503202317.05481.dmp__40671.3862940252$1416623704$gmane$org@davidmpye.dyndns.org>
References: <200503191959.05972.dmp@davidmpye.dyndns.org> <20050320210357.53534d01@Tatooine.r3z0> <200503202257.31924.dmp@davidmpye.dyndns.org>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2180826.Ni0TVgB4DN";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: parisc-linux@lists.parisc-linux.org
To: debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200503202257.31924.dmp@davidmpye.dyndns.org>
Resent-Message-ID: <pcqZVB.A.w_H.9RgPCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

--nextPart2180826.Ni0TVgB4DN
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 20 March 2005 22:57, David Pye wrote:

> Well, I've had a bit of a play with this, and think I have a feel of what
> causes it.
>
> The led_LCD_driver() fires each time the tasklet decides the led statuses
> should change, but each time it only updates at best one of the four LEDs.
>
> Every time it fires, it either updates one led, or it writes the command
> register, to avoid sleeping.   This means, that it requires eight fires of
> the tasklet (and eight times of it having decided an LCD state should fli=
p)
> before the heartbeat will be written to.  It seems to be a rare occasion
> that these all line up (most of the time the heartbeat has pulsed back to
> its previous state before the LCD panel itself gets updated.

     =20
It appears my hunch was correct
  /* update the LCD/LEDs */
        if (currentleds !=3D lastleds || led_type =3D=3D LED_HASLCD) {
            led_func_ptr(currentleds);
            lastleds =3D currentleds;
        }

If I modify the conditional as above, so it fires the led_func_ptr each tim=
e=20
the tasklet fires for LCD users (even if the leds haven't nominally changed=
)=20
my heart beats!

Admittedly, it doesn't QUITE beat right, because of the rate the tasklet=20
fires, and the rate at which the heart is supposed to beat.

I'm convinced another solution, like one of the ones I mentioned earlier, i=
s a=20
better idea, of course.

I now get:

a normal double beat, followed a single beat (repeats).

Which is better than no beats at all in my book!

Cheers,

David

> Cheers,
>
> David

--nextPart2180826.Ni0TVgB4DN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCPgRxOIrGtzS07WgRApjGAJwJsHEWijv7Pqg9ZzS1otNGrn3j0ACfQG7j
OC3UDp/tbaxFzVL59tDrdZ4=
=KHpQ
-----END PGP SIGNATURE-----

--nextPart2180826.Ni0TVgB4DN--


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
