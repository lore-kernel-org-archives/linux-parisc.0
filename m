From: David Pye <dmp@davidmpye.dyndns.org>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Fri, 25 Mar 2005 21:50:26 +0000
Message-ID: <200503252150.28207.dmp@davidmpye.dyndns.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<20050325062517.GH29361@colo.lackof.org>
	<200503251705.02441.dmp@davidmpye.dyndns.org>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0372401009=="
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503251705.02441.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0372401009==
Content-Type: multipart/signed; boundary="nextPart2160418.141bc5vEOP";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2160418.141bc5vEOP
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 25 March 2005 17:05, David Pye wrote:
<snip>
> >
> > > -#define NORMALIZED_COUNT(count) (count/(HZ/100))
> > > +#define LED_MINIMUM_ON_TIME (HZ*10/100)
> >
> > Why not just update every 10ms and ditch all the "minimum on time" stuf=
f?
> > Can someone tell if an LED/LCD came on 5ms later than it should have
> > been?

Ah, I remember now.

That's 100mS, not 10mS for a start ;)  You can't make the whole update=20
interval 100mS, of course, or you'll miss the heartbeats completely.

> There is a reason for this, though there may be a better way of doing it.
>
> If you remove it, and set the update interval to 10mS, what tends to happ=
en
> is that because each time you flip a symbol on the lcd you have to wait 2
> jiffies (once before cmd reg, once before writing data reg), and sometimes
> more, because the kernel may put you to sleep a bit longer than the time
> you asked for,  is that the heartbeat starts skipping beats when the io/l=
an
> leds are changing on/off all the time.
>
> If you really don't like the minimum_on_time, another solution is to leave
> the work queued every five secs, and make sure you service the heartbeat =
on
> one cycle, and the led/diskio on the other.  If you think that's cleaner,=
 I
> can change it to do that.

Having spent the evening trying that, I've found that the 100mS minimum=20
'flutter stop' interval patch gives the most consistent heartbeat of the=20
ideas that I've tried. The solution I suggested above causes the heartbeat =
to=20
become uneven when LAN/DISK IO is present still.

If the 100mS minimum LED illumination bothers people who have 'real' LEDs a=
s=20
opposed to LCD indicators, we can make it LCD only, of course.


Cheers,

David

--nextPart2160418.141bc5vEOP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCRIekOIrGtzS07WgRAgjBAKChhoetnV/zfQMJeAkF4NYjn2c9BQCg0lqT
O/HRAK9mt45PhCRPpXPuqJk=
=lG8A
-----END PGP SIGNATURE-----

--nextPart2160418.141bc5vEOP--

--===============0372401009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0372401009==--
