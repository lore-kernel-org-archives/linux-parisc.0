From: Matt Turner <mattst88@gmail.com>
Subject: Re: False advertising (was: C8000 cpu upgrade problem)
Date: Sat, 23 Oct 2010 21:50:19 -0400
Message-ID: <AANLkTi=MMuFsSdNNCLGnu6sZNetM0f3oCcxcFjUnk2uT@mail.gmail.com>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz>
 <AANLkTi=YJJgP-tDhh2g6D8d8BkKa-ENoJankd-ZMV+i2@mail.gmail.com>
 <alpine.DEB.1.10.1010231118350.23687@artax.karlin.mff.cuni.cz>
 <AANLkTikD5cvJdAxUg7zj0ySM9z6fThE-9H9txVpNC9Ez@mail.gmail.com>
 <alpine.DEB.1.10.1010231620190.12135@artax.karlin.mff.cuni.cz>
 <1287853058.3003.18.camel@mulgrave.site> <AANLkTimSda7Ki+uUW-hgkxhMhjeP7R5N3wkHb-hTyb4L@mail.gmail.com>
 <7FB655BE-108B-4FF6-888A-249C29064838@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	"Carlos O'Donell" <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7FB655BE-108B-4FF6-888A-249C29064838@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Oct 23, 2010 at 9:18 PM, Thibaut VAR=C8NE <T-Bone@parisc-linux.=
org> wrote:
> I suppose we can't put the procedure about how to to do that on the w=
ebsite
> for two reasons:
>
> 1) if my assumptions are right, enabling the extra CPU requires enter=
ing
> Manufacturing Mode (MFG in PDC parlance) in order to change the Model=
 String
> (suppositions based on previous experience with a different machine),=
 which
> itself needs a hardware-specific password, generated with an HP tool =
using
> the crypto challenge prompted by the firmware when trying to activate=
 this
> mode (been there on another machine).
> 2) it would most likely be illegal (and a liability) to either disclo=
se the
> means to circumvent HP's upgrading policy or to provide the HP-intern=
al
> tools to do so, if ever we had them (which we do not). Even more so s=
ince
> our website is hosted @HP.

I wasn't suggesting putting instructions to circumvent whatever
protections HP has in place on the site. I only meant a note saying
"don't expect to be able to add another CPU or even upgrade the RAM or
CPU."

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
