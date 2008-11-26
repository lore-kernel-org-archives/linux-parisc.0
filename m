From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Wed, 26 Nov 2008 18:51:43 +0100
Message-ID: <20081126185143.065841db@tuxicoman.be>
References: <20081123165718.0D5A94DCB@hiauly1.hia.nrc.ca>
	<20081125025421.9745A4FB6@hiauly1.hia.nrc.ca>
	<119aab440811250533y1a09a396i318dfc057ad0d659@mail.gmail.com>
	<20081125145850.1a5ddf23.gmsoft@tuxicoman.be>
	<119aab440811250607h5c2afd5cmf72914c3fe125077@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	grundler@parisc-linux.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440811250607h5c2afd5cmf72914c3fe125077@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi Carlos,

Sure I will. Any particular version you want me to test ?

Also, I was quite lost with the flow of emails about kernel bugs lately.
What kernel version should I use and which what patch set ?

Cheers,
 Guy

On Tue, 25 Nov 2008 09:07:42 -0500
"Carlos O'Donell" <carlos@systemhalted.org> wrote:

> On Tue, Nov 25, 2008 at 8:58 AM, Guy Martin <gmsoft@tuxicoman.be>
> wrote:
> > It has been happening to me as far back as 2.6.25 IIRC.
> > It occurs only on SMP kernels and on various models (K410, L2000).
> >
> > I've tried to bissect that as well but kernel before 2.6.25 aren't
> > really useable SMP due to the global irq bug or so.
> >
> > To me that is a bug that as always been there. It is random but
> > some builds almost always fail. Not always at the same place tho.
> 
> Can you build glibc, run the testsuite, and see if anything fails
> semi-consistently?
> 
> Cheers,
> Carlos.


-- 
Guy Martin
Gentoo Linux - HPPA port lead

