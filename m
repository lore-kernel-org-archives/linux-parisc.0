From: David Pye <dmp@davidmpye.dyndns.org>
Subject: [parisc-linux] RE: J5000 heartbeat
Date: Sun, 20 Mar 2005 23:20:26 +0000
Message-ID: <200503202320.28031.dmp@davidmpye.dyndns.org>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0809243431=="
To: parisc-linux@lists.parisc-linux.org
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

--===============0809243431==
Content-Type: multipart/signed; boundary="nextPart3181268.95lL0VQsb7";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3181268.95lL0VQsb7
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 20 March 2005 20:03, Thibaut VARENE wrote:
> On Sun, 20 Mar 2005 19:52:29 +0000
>
> David Pye <dmp@davidmpye.dyndns.org> wrote:
> > Hi, and thanks for your reply.
> >
> > On Sunday 20 March 2005 19:40, you wrote:
> > > > I think I have an idea that it's related to CPU1 init, but I haven't
> > > > confirmed this yet - depending on your feedback to the idea below, I
> > > > won't bother tracing it down.
> > >
> > > Don't bother. I have that kind of message left on my j5k LCD has well,
> > > that's been there for ages, without problem.
<snip>

> it's not that simple.
> If you want to have it gone, add
> @reboot echo "" > /proc/pdc/lcd
> in your root crontab :)

I think that's a perfectly acceptable solution for me, so I've done that.=20
Thankyou!
<snip>

> > > > Did you have any hints you could give me as to fix my very
> > > > occasional heartbeat issue either?
> > >
> > > I recall that the LCD heartbeat is quite slow on my j5k as well, but
> > > nothing really awful, afaicr.
> >
> > Well, here it's sufficiently slow to be utterly useless as a heartbeat,
> > anyway. It usually flips state every 10-30 seconds, depending on how it
> > feels. It certainly doesn't boot.
> >
> > I realise the LCD functionality is something fairly minor, and that I'm
> > being picky, but I'd be happy to invest some time to do some fine
> > tuning. =A0The only two must-haves for me is to nail the INI CC01 messa=
ge
> > being displayed over the Linux kernel version display, and preferably to
> > make my heart beat too ;)
>
> The LED/LCD driver uses tasklets, which are quite CPU expensive. I think
> this is one of the reason the heartbeat is slow. Though 30s seems alot to
> me either.

Well, I've had a bit of a play with this, and think I have a feel of what=20
causes it. =A0

The led_LCD_driver() fires each time the tasklet decides the led statuses=20
should change, but each time it only updates at best one of the four LEDs.

Every time it fires, it either updates one led, or it writes the command=20
register, to avoid sleeping. =A0 This means, that it requires eight fires o=
f=20
the tasklet (and eight times of it having decided an LCD state should flip)=
=20
before the heartbeat will be written to. =A0It seems to be a rare occasion =
that=20
these all line up (most of the time the heartbeat has pulsed back to its=20
previous state before the LCD panel itself gets updated.

I'm wondering whether it's worth doing one of the following:

Add a separate workqueue and use that instead of the tasklet, as the workqu=
eue=20
function can sleep, update the heartbeat each time it fires, as well as any=
=20
of the other LEDs that have changed state.

Add a single workqueue item for the heartbeat LED and use the tasklet to=20
handle the rest of the LEDs, as it seems to do an acceptable job for them.

What are your thoughts on that?

Cheers,

David


> HTH
>
> Thibaut VARENE
> The PA/Linux Team
> http://www.pateam.org/

--nextPart3181268.95lL0VQsb7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCPgU8OIrGtzS07WgRAv0tAJ98wRPdBAvpg4CrPGO8229Ind1r0gCeOhNa
bpAeSxM8I7/4iuHyQkrYM+0=
=4MMo
-----END PGP SIGNATURE-----

--nextPart3181268.95lL0VQsb7--

--===============0809243431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0809243431==--
