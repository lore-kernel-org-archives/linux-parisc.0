From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <T-Bone@parisc-linux.org>
Subject: Re: False advertising (was: C8000 cpu upgrade problem)
Date: Sun, 24 Oct 2010 03:18:32 +0200
Message-ID: <7FB655BE-108B-4FF6-888A-249C29064838@parisc-linux.org>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz> <AANLkTi=YJJgP-tDhh2g6D8d8BkKa-ENoJankd-ZMV+i2@mail.gmail.com> <alpine.DEB.1.10.1010231118350.23687@artax.karlin.mff.cuni.cz> <AANLkTikD5cvJdAxUg7zj0ySM9z6fThE-9H9txVpNC9Ez@mail.gmail.com> <alpine.DEB.1.10.1010231620190.12135@artax.karlin.mff.cuni.cz> <1287853058.3003.18.camel@mulgrave.site> <AANLkTimSda7Ki+uUW-hgkxhMhjeP7R5N3wkHb-hTyb4L@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	"Carlos O'Donell" <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: Matt Turner <mattst88@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTimSda7Ki+uUW-hgkxhMhjeP7R5N3wkHb-hTyb4L@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Le 23 oct. 10 =E0 19:14, Matt Turner a =E9crit :

> Poor HP.
>
> Seriously though. From a glance, the C8000 seems to be the most
> capable PA-RISC system for someone who wants to help with
> Linux-on-PARISC. Clearly, people like upgrading (and being able to
> upgrade) their computers. If I were to buy a C8000 I'd be interested
> in figuring out how to find a second CPU, add more RAM, and install
> another PCI card. But these debilitating restrictions prevent any of
> this.
>
> So, my question is, if you and Carlos knew about this previously
> (which I assume you did by your responses, but I may be wrong) then
> why can I not find this information anywhere on parisc-linux.org or i=
n
> the appropriate mailing list archives?

Disclaimer: IANAL and I don't know C8000.

I suppose we can't put the procedure about how to to do that on the =20
website for two reasons:

1) if my assumptions are right, enabling the extra CPU requires =20
entering Manufacturing Mode (MFG in PDC parlance) in order to change =20
the Model String (suppositions based on previous experience with a =20
different machine), which itself needs a hardware-specific password, =20
generated with an HP tool using the crypto challenge prompted by the =20
firmware when trying to activate this mode (been there on another =20
machine).
2) it would most likely be illegal (and a liability) to either =20
disclose the means to circumvent HP's upgrading policy or to provide =20
the HP-internal tools to do so, if ever we had them (which we do not). =
=20
Even more so since our website is hosted @HP.

James rightfully pointed out that the best way to solve this issue =20
would be to kindly ring a bell within HP and try to work this out on a =
=20
one-on-one basis, hopefully avoiding calling names. HP has a history =20
of being relatively helpful with that sort of matters, I'd expect this =
=20
to turn for the best.

HTH

T-Bone--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
