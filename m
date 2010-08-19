From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [alerts@alerts.hp.com: HP SUPPORT ALERT: Change to Patch
	services effective September 18, 2010 ? Action required]
Date: Thu, 19 Aug 2010 13:00:30 -0400
Message-ID: <20100819170030.GA13537@hiauly1.hia.nrc.ca>
References: <20100819013346.GA9194@hiauly1.hia.nrc.ca> <AANLkTinXgNz7cjNV1oiw+Niy78pMyeCYtaxvqNM-fM0R@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTinXgNz7cjNV1oiw+Niy78pMyeCYtaxvqNM-fM0R@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 19 Aug 2010, Carlos O'Donell wrote:

> On Wed, Aug 18, 2010 at 9:33 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> > I have forwarded this message to the list because I believe that
> > this change by HP =A0will impact my support of GCC and binutils on =
parisc
> > particularly for hpux. =A0However, I have always felt that hpux tes=
ting
> > provided an important validation for linux. =A0For many years (sinc=
e
> > at least 1990), patches were available without a support agreement.
> >
> > Comments?
>=20
> Sorry, could you please clarify your position?

I have to say I'm surprised by the change.  I think it will lead to
HP hardware and software products being viewed as unreliable and insecu=
re
as most small businesses and software developers can't afford support
agreements.  When I had a HP system with a support agreement (early 90s=
),
the cost was a few thousand a year (can't remember what it exactly cove=
red).
There is a place for support agreements in large enterprises for missio=
n
critical products.

I have no objection to a timed phase out of support for any product, bu=
t
I think it unusual that HP will require a support agreement to access
its patch database.  Microsoft, Apple and many others provide automatic
updates for serious bugs and security problems for the nominal support
life of their products.  Patching HP-UX is still pretty much a manual
operation, and the patch database provides important clues as to what
a given patch fixes.  As far as I know, there are no product enhancemen=
ts
available through the patch database.

The full implications of the change are not clear.  For example, patche=
s
have been available via ftp without using the patch database.  It may
not apply to products that don't use the patch database for distributio=
n.

Sendmail is broken again in HP-UX (HPSBUX02508 SSRT100007 rev.2)...
Dave
--=20
J. David Anglin                                  dave.anglin@nrc-cnrc.g=
c.ca
National Research Council of Canada              (613) 990-0752 (FAX: 9=
52-6602)
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
