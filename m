From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: False advertising (was: C8000 cpu upgrade problem)
Date: Sun, 24 Oct 2010 05:18:17 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010240504560.30241@artax.karlin.mff.cuni.cz>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz> <AANLkTi=YJJgP-tDhh2g6D8d8BkKa-ENoJankd-ZMV+i2@mail.gmail.com> <alpine.DEB.1.10.1010231118350.23687@artax.karlin.mff.cuni.cz> <AANLkTikD5cvJdAxUg7zj0ySM9z6fThE-9H9txVpNC9Ez@mail.gmail.com>
 <alpine.DEB.1.10.1010231620190.12135@artax.karlin.mff.cuni.cz> <1287853058.3003.18.camel@mulgrave.site> <AANLkTimSda7Ki+uUW-hgkxhMhjeP7R5N3wkHb-hTyb4L@mail.gmail.com> <7FB655BE-108B-4FF6-888A-249C29064838@parisc-linux.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Matt Turner <mattst88@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: =?ISO-8859-15?Q?Thibaut_VAR=C8NE?= <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7FB655BE-108B-4FF6-888A-249C29064838@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Sun, 24 Oct 2010, Thibaut VAR?NE wrote:

> Disclaimer: IANAL and I don't know C8000.
> 
> I suppose we can't put the procedure about how to to do that on the website
> for two reasons:
> 
> 1) if my assumptions are right, enabling the extra CPU requires entering
> Manufacturing Mode (MFG in PDC parlance) in order to change the Model String
> (suppositions based on previous experience with a different machine), which
> itself needs a hardware-specific password, generated with an HP tool using the
> crypto challenge prompted by the firmware when trying to activate this mode
> (been there on another machine).
> 2) it would most likely be illegal (and a liability) to either disclose the
> means to circumvent HP's upgrading policy or to provide the HP-internal tools
> to do so, if ever we had them (which we do not). Even more so since our
> website is hosted @HP.
> 
> James rightfully pointed out that the best way to solve this issue would be to
> kindly ring a bell within HP and try to work this out on a one-on-one basis,
> hopefully avoiding calling names. HP has a history of being relatively helpful
> with that sort of matters, I'd expect this to turn for the best.

I think that asking employees to do illegal things (or things against 
corporate rules) isn't a viable way to go.

Once (a long time ago, on a totally different project) I got an offer for 
some internal code from an employee, who thought that it could improve my 
open source work. I refused it because I don't want to get into unneeded 
trouble. If I accepted it, I'd have to be careful to not ever disclose 
implicitly or explicitly that I saw the code.

Mikulas

> HTH
> 
> T-Bone
