From: David Pye <dmp@davidmpye.dyndns.org>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Sun, 27 Mar 2005 09:38:38 +0000
Message-ID: <200503271038.42434.dmp@davidmpye.dyndns.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<200503261514.43287.dmp@davidmpye.dyndns.org>
	<20050327085330.GA17602@colo.lackof.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1257430555=="
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050327085330.GA17602@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1257430555==
Content-Type: multipart/signed; boundary="nextPart31773099.26GnJ3zSzt";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart31773099.26GnJ3zSzt
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 27 March 2005 09:53, Grant Grundler wrote:
> On Sat, Mar 26, 2005 at 03:14:41PM +0000, David Pye wrote:
> > Attached! The only real change now is that the minimum on-time is now L=
CD
> > only, so hopefully this gets us the best of both worlds. LED people won=
't
> > notice anything different, and the LCD should now be nicely responsive.
>
> I've attached the patch I'm willing to commit...works for me.
>
> And I really like the work-queue implementation. It nicely
> solves the cmd/data pair problem and consolidates more of the
> support in led.c.  The only drawback I can see so far is the
> scheduler may chose to not run the led_func when it needs to
> be run. If a machine is really busy, only the hearbeat will
> suffer and I expect users will get other clues that the machine
> is just really busy.

Yep, that's what I'd guess too.

> Sorry - I can't get warm to the implementation of minimum on time.
> It was really cluttering up the main routine.
> Can I commit this patch for now and then we follow up with another
> patch for minimum on-time?

Sure.  It definitely cluttered up the main routine, and I wasn't particular=
ly=20
happy with having to include an if conditional testing led_type in the=20
generic routine.  Hopefully a better idea on how to handle it will emerge=20
shortly.

> I think I would be ok with it implemented inside the led_get*
> activity routines. They have access to lastleds and jiffies and
> that should be enough to figure out how long an LED should stay
> on if it's already on.  The main routine can stay simple/readable.

Yep, I hadn't really thought of doing it in there - I'll have a play with i=
t=20
and maybe annoy everyone with another patch in a bit.   Downside is that it=
's=20
not really the right place to put it *if* you want it to be lcd-only.

The only other way to do it which you might not find as ugly is to move thi=
s=20
into the drivers.  ie the drivers would need to be given the responsibility=
=20
of deciding whether they need to update anything (ie each of them has to=20
store currentleds rather than the generic calculator function). That way,=20
they'll get called each time the work runs, but can decide for themselves=20
whether to actually do anything.  It's only a couple of lines to add to the=
=20
other functions e.g. lasi.   How does that sound?

> I also just realized because led_get* routines are static inline,
> led_lanrxtx and led_diskio tests can be moved to the respective
> routines as well with no harm to performance. May be a bad idea
> though since current construct is pretty obvious what they do.
>
> cheers,
> grant

Cheers,

David

--nextPart31773099.26GnJ3zSzt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCRn8iOIrGtzS07WgRAjnsAJ9iFkzRLyajhlG9+mMiwVq4Wm4DCACgkcrR
bON0PxnY07Q1YtN7AY/hdGU=
=8cP+
-----END PGP SIGNATURE-----

--nextPart31773099.26GnJ3zSzt--

--===============1257430555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1257430555==--
