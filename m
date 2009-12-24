From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: No drives come online in 2.6.32?
Date: Thu, 24 Dec 2009 00:40:54 -0500
Message-ID: <119aab440912232140x6f61ce12r9e9448ae690489a2@mail.gmail.com>
References: <119aab440912231819x621898d2lf2b58a3e27b86047@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912231819x621898d2lf2b58a3e27b86047@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 23, 2009 at 9:19 PM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> When booting 2.6.32, my scsi drives don't come online, all I see during boot is:
> ~~~
> sym53c8xx 0000:00:01.0: enabling device (0000 -> 0003)
> sym53c8xx 0000:00:01.0: enabling SERR and PARITY (0003 -> 0143)
> sym53c8xx 0000:00:01.1: enabling device (0000 -> 0003)
> sym53c8xx 0000:00:01.1: enabling SERR and PARITY (0003 -> 0143)
> sym53c8xx 0000:00:02.0: enabling device (0000 -> 0003)
> sym53c8xx 0000:00:02.0: enabling SERR and PARITY (0003 -> 0143)
> sym53c8xx 0000:00:02.1: enabling device (0146 -> 0147)
> ~~~
> When booting 2.6.32-rc6 the drives come online right away after they
> are enabled.
>
> No amount of waiting helps.
>
> Any clues?

I've started bisecting the commits between 2.6.32-rc6 and 2.6.32 to
see what broke this for my setup.

Cheers,
Carlos.
