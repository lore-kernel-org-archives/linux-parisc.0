From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Sun, 13 Sep 2009 17:00:16 -0400
Message-ID: <20090913210016.GB19494@bombadil.infradead.org>
References: <119aab440909100903u2f25b7f0i73e979ce37c0ff5a@mail.gmail.com> <20090911225732.DF5604E0B@hiauly1.hia.nrc.ca> <119aab440909131356n70ab22b5ge428c3e68c79dfa6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440909131356n70ab22b5ge428c3e68c79dfa6@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Sep 13, 2009 at 04:56:20PM -0400, Carlos O'Donell wrote:
> after that strace still fails with an invalid upeek generated from
> hppa-specific code. I'm working on it right now (today actually).
> 
> AFAICT "strace" *is* our "defense against the dark arts" if you catch
> my harry potter reference :-)
> 

http://shortfin.cabal.ca/~kyle/strace-fix-hppa-syscalls.diff
