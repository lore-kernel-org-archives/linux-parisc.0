From: David Pye <dmp@davidmpye.dyndns.org>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Fri, 25 Mar 2005 17:05:00 +0000
Message-ID: <200503251705.02441.dmp@davidmpye.dyndns.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<200503242100.06699.dmp@davidmpye.dyndns.org>
	<20050325062517.GH29361@colo.lackof.org>
Reply-To: dmp@davidmpye.dyndns.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0678055370=="
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050325062517.GH29361@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============0678055370==
Content-Type: multipart/signed; boundary="nextPart222359852.47e4TTfOMp";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart222359852.47e4TTfOMp
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 25 March 2005 06:25, you wrote:
> On Thu, Mar 24, 2005 at 09:00:05PM +0000, David Pye wrote:
> ...
>
> > + for (i=3D0; i<4; ++i)
> > + {
> > +  if ((leds & mask[i]) !=3D (lastleds & mask[i]))
> > +  {
> > +   gsc_writeb( blockp[i]->command, LCD_CMD_REG );
> > +   msleep(msec_cmd_delay);
> > +
> > +   gsc_writeb( leds & mask[i] ? blockp[i]->on :
> > +     blockp[i]->off, LCD_DATA_REG );
> > +   msleep(msec_cmd_delay);
> > +  }
> >   }
> > + lastleds =3D leds;
>
> I still *really* like this bit. Good work!

Thankyou :)

> > -   ** updates the chassis LCD/LED
> > +   ** is scheduled every 5 milliseconds and updates the chassis LCD/LED
>
> ...
>
> > -#define NORMALIZED_COUNT(count) (count/(HZ/100))
> > +#define LED_MINIMUM_ON_TIME (HZ*10/100)
>
> Why not just update every 10ms and ditch all the "minimum on time" stuff?
> Can someone tell if an LED/LCD came on 5ms later than it should have been?

There is a reason for this, though there may be a better way of doing it. =
=20

If you remove it, and set the update interval to 10mS, what tends to happen=
 is=20
that because each time you flip a symbol on the lcd you have to wait 2=20
jiffies (once before cmd reg, once before writing data reg), and sometimes=
=20
more, because the kernel may put you to sleep a bit longer than the time yo=
u=20
asked for,  is that the heartbeat starts skipping beats when the io/lan led=
s=20
are changing on/off all the time.

If you really don't like the minimum_on_time, another solution is to leave =
the=20
work queued every five secs, and make sure you service the heartbeat on one=
=20
cycle, and the led/diskio on the other.  If you think that's cleaner, I can=
=20
change it to do that.

> >   /* blink all LEDs twice a second if we got an Oops (HPMC) */
> > - if (oops_in_progress) {
> > + if (oops_in_progress)
> > + {
> >    currentleds =3D (count_HZ<=3D(HZ/2)) ? 0 : 0xff;
> >   }
>
> Will this work for LCD?
> Will the itimer continue to run and workq continue to get serviced?
> Even if it does, I'm nervous about it.
> Maybe stop all activity at that point?
> The panic chassis log will get printed and that should be a good indicato=
r.
> Anyway, this is a seperate issue from the rest of the patch.

I think it'd be better to just rewrite that so that the work only requeues=
=20
itself if an oops ISNT in progress, but as you say, it wasn't something I=20
changed!

Cheers,

David

>
> thanks,
> grant

--nextPart222359852.47e4TTfOMp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCRES+OIrGtzS07WgRAhxqAKC2gYfA+4xNwnK2jHy3FNrQj0czHgCfe8Jl
DldElzX+F6ChqUrB+zd3ijA=
=QWju
-----END PGP SIGNATURE-----

--nextPart222359852.47e4TTfOMp--

--===============0678055370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0678055370==--
