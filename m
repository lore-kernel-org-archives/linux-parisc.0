From: David Pye <dmp@davidmpye.dyndns.org>
Subject: [parisc-linux] Re: J5000 LCD heartbeat
Date: Sun, 20 Mar 2005 19:52:29 +0000
Message-ID: <200503201952.31465.dmp__49374.9306224801$1416623701$gmane$org@davidmpye.dyndns.org>
References: <200503191959.05972.dmp@davidmpye.dyndns.org>
	<200503201918.31808.dmp@davidmpye.dyndns.org>
	<20050320204032.3ed40468@Tatooine.r3z0>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============2024669433=="
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050320204032.3ed40468@Tatooine.r3z0>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============2024669433==
Content-Type: multipart/signed; boundary="nextPart1316504.W30BOMpaHa";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1316504.W30BOMpaHa
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi, and thanks for your reply.

On Sunday 20 March 2005 19:40, you wrote:

> > I think I have an idea that it's related to CPU1 init, but I haven't
> > confirmed this yet - depending on your feedback to the idea below, I
> > won't bother tracing it down.
>
> Don't bother. I have that kind of message left on my j5k LCD has well,
> that's been there for ages, without problem.

Well, I'd like to see it gone myself, even though it doesn't do anything=20
unpleasant. It is a little messy, at least having it mangled up with the=20
Linux default text is.

If all it takes to prevent it is to make the lcd init happen slightly later=
 in=20
the boot process (ie after the chassis code was emitted), I'd have thought =
it=20
would be an easy win.

> If you think about the firmware code that drives the display of chassis
> messages, it's firmware, changing how it works is pretty much not
> possible at that point. If you think about the PDC Chassis driver, that
> code doesn't work (read, "isn't activated") on j5k and other System Map
> firmware machines, it only works on PDC PAT machines (eg high end
> servers).

Yeah, true. So, if the PDC chassis driver isn't used on the j5k, how does t=
he=20
chassis message get sent from the kernel to the PDC?  I haven't worked that=
=20
out yet.

> I don't think this is either useful nor desirable. We want to have the
> firmware messages going over whatever the led/lcd driver would have shown,
> and going into such a pain for a corner case doesn't really seem worth it.

At the very least, clearing the display first before the message is shown=20
would have been helpful, imho. =20

I'd personally like to have the firmware message displayed only for a limit=
ed=20
time, though I can see a counter argument for this.  But not for having=20
cleared the display first, though. (Whether this is possible depends on you=
r=20
answer as to how the PDC is told to display the message!)

> > Another idea I had was this:
> >
> > How about making the text scrollable? ie if the string is longer than
> > the viewport, scroll it along at a reasonable rate.
>
> That has been considered and eventually ruled out. Remember we're in
> kernel context, this is not meant to be eye candy etc. The pretty
> formatting you suggest should be eventually a userland task, certainly not
> a supplementary burden for the kernel.

Yep, agreed, that probably isn't a worthwhile thing to add. I was just=20
thinking of other random ideas, that's all.

> > Did you have any hints you could give me as to fix my very occasional
> > heartbeat issue either?
>
> I recall that the LCD heartbeat is quite slow on my j5k as well, but
> nothing really awful, afaicr.

Well, here it's sufficiently slow to be utterly useless as a heartbeat,=20
anyway. It usually flips state every 10-30 seconds, depending on how it=20
feels. It certainly doesn't boot.

I realise the LCD functionality is something fairly minor, and that I'm bei=
ng=20
picky, but I'd be happy to invest some time to do some fine tuning.  The on=
ly=20
two must-haves for me is to nail the INI CC01 message being displayed over=
=20
the Linux kernel version display, and preferably to make my heart beat too =
;)

Thanks,

David

> HTH
>
> Thibaut VARENE
> The PA/Linux Team
> http://www.pateam.org/

--nextPart1316504.W30BOMpaHa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCPdR/OIrGtzS07WgRAuv8AJ4xxOLkWthz+GhkoJI1+EN0YA/hegCfZMBM
vnGYXH1Drk889/tD9z2gjh4=
=DF4t
-----END PGP SIGNATURE-----

--nextPart1316504.W30BOMpaHa--

--===============2024669433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============2024669433==--
