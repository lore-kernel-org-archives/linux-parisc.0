From: David Pye <dmp@davidmpye.dyndns.org>
Subject: Re: J5000 LCD heartbeat
Date: Sun, 20 Mar 2005 19:18:29 +0000
Message-ID: <200503201918.31808.dmp__33106.9208602004$1416623701$gmane$org@davidmpye.dyndns.org>
References: <200503191959.05972.dmp@davidmpye.dyndns.org> <200503192233.26991.dmp@davidmpye.dyndns.org> <20050319231911.GB21898@colo.lackof.org>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1173332.YS2Icdyj7t";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20050319231911.GB21898@colo.lackof.org>
Resent-Message-ID: <JqTw2B.A.tSF.RycPCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

--nextPart1173332.YS2Icdyj7t
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 19 March 2005 23:19, Grant Grundler wrote:
> On Sat, Mar 19, 2005 at 10:33:24PM +0000, David Pye wrote:
> > The other thing is that the kernel version which is displayed on the lcd
> > by default is overwritten partly by a:
> >
> > INI CC01
> >
> > It's not a huge issue for me, as I can overwrite it again by echo'ing my
> > message into /proc/pdc/lcd post boot.
>
> This is the firmware showing the "Chassis Log" as emitted by the kernel.
> Some platforms (e.g. A500/rp2470) use chassis logs to set the LED
> properly.
>
> > Is it possible to make the write to the display later in the boot
> > process, so it occurs after the INI CC01 is printed?
>
> I would think it's possible.
> You want to track down where the CC01 chassis_log is emitted then
> propose a better place to initialize LED display?

I think I have an idea that it's related to CPU1 init, but I haven't confir=
med=20
this yet - depending on your feedback to the idea below, I won't bother=20
tracing it down.

> Another idea is the chassis log code might want to clear the LED
> diplay when displaying a chassis log and then a few seconds later
> refresh the LED display with the original contents or something.

At the very least, I think it needs to clear the lcd display before it send=
s=20
the chassis code to the PDC.  How does this sound:

Clear the lcd
Send the chassis code
set up a timer for 15 seconds, say, to restore the original display text

This requires a couple of changes to led.c so firmware.c can tell whether t=
he=20
machine has an LCD or not. (If it does, then do the above, otherwise just=20
send the chassis code as before.)

If you agree that this is something useful, I will do some more hacking on =
it.=20
Otherwise, I'll do the other option and arrange the the chassis log to be=20
sent before the lcd has the initial text printed on it.

Another idea I had was this:

How about making the text scrollable? ie if the string is longer than the=20
viewport, scroll it along at a reasonable rate.

I'm willing to have a play with this too, if people think it's something wo=
rth=20
having.

Did you have any hints you could give me as to fix my very occasional=20
heartbeat issue either?=20

Cheers,

David

<snip>

> thanks,
> grant

--nextPart1173332.YS2Icdyj7t
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCPcyHOIrGtzS07WgRAt0nAKDJaLLPsi/j3+x4zOI54p/1V8f/+QCfdGjR
M8Td92NIeLBI1O4/x/v4c0Q=
=9KnP
-----END PGP SIGNATURE-----

--nextPart1173332.YS2Icdyj7t--


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
