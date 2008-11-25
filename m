From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Tue, 25 Nov 2008 09:07:42 -0500
Message-ID: <119aab440811250607h5c2afd5cmf72914c3fe125077@mail.gmail.com>
References: <20081123165718.0D5A94DCB@hiauly1.hia.nrc.ca>
	 <20081125025421.9745A4FB6@hiauly1.hia.nrc.ca>
	 <119aab440811250533y1a09a396i318dfc057ad0d659@mail.gmail.com>
	 <20081125145850.1a5ddf23.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	grundler@parisc-linux.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: "Guy Martin" <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081125145850.1a5ddf23.gmsoft@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Nov 25, 2008 at 8:58 AM, Guy Martin <gmsoft@tuxicoman.be> wrote:
> It has been happening to me as far back as 2.6.25 IIRC.
> It occurs only on SMP kernels and on various models (K410, L2000).
>
> I've tried to bissect that as well but kernel before 2.6.25 aren't really useable SMP due to the global irq bug or so.
>
> To me that is a bug that as always been there. It is random but some builds almost always fail. Not always at the same place tho.

Can you build glibc, run the testsuite, and see if anything fails
semi-consistently?

Cheers,
Carlos.
