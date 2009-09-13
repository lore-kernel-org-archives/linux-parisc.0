From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Sun, 13 Sep 2009 17:32:41 -0400
Message-ID: <119aab440909131432i7f818ef5g35629bcea2eecda5@mail.gmail.com>
References: <119aab440909100903u2f25b7f0i73e979ce37c0ff5a@mail.gmail.com>
	 <20090911225732.DF5604E0B@hiauly1.hia.nrc.ca>
	 <119aab440909131356n70ab22b5ge428c3e68c79dfa6@mail.gmail.com>
	 <20090913210016.GB19494@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	Helge Deller <deller@gmx.de>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090913210016.GB19494@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Sep 13, 2009 at 5:00 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> On Sun, Sep 13, 2009 at 04:56:20PM -0400, Carlos O'Donell wrote:
>> after that strace still fails with an invalid upeek generated from
>> hppa-specific code. I'm working on it right now (today actually).
>>
>> AFAICT "strace" *is* our "defense against the dark arts" if you catch
>> my harry potter reference :-)
>>
>
> http://shortfin.cabal.ca/~kyle/strace-fix-hppa-syscalls.diff

Thanks, that solves my problem.

Is it OK if I submit your patch to debian and upstream *again* and
keep doing so until they apply the patches? >:)

I see this ancient bug entry, which I'll update, and bug Roland...

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=437928

Cheers,
Carlos.
