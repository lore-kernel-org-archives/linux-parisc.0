From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Sun, 13 Sep 2009 16:56:20 -0400
Message-ID: <119aab440909131356n70ab22b5ge428c3e68c79dfa6@mail.gmail.com>
References: <119aab440909100903u2f25b7f0i73e979ce37c0ff5a@mail.gmail.com>
	 <20090911225732.DF5604E0B@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090911225732.DF5604E0B@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Sep 11, 2009 at 6:57 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> No, it's not neccessary. This way I simply have to audit the incorre=
ct
>> comparisons of a inferior's function pointer to a constant. If I wer=
e
>> to disable canonicalization I'd have to audit the entire compilation
>> unit to prove I haven't broken any valid function pointer comparison=
s.
>
> I'm thinking we have OPD support with recent binutils, so the
> above shouldn't be necessary. =A0Wasn't that something you added?

I did the work, yes, I rewrote the PLABEL support to include adding
OPD's in the executable (instead of pointing the local PLABEL relocs
at the relevant PLT entry). However, with the start of my Masters I
didn't have time to clean it up, and check it into binutils. This is
*certainly* on my list, we need some work in binutils, but *right now*
I'm working on resurrecting strace which seems to be completely
broken. Fixing the function descriptor problem is only the first step,
after that strace still fails with an invalid upeek generated from
hppa-specific code. I'm working on it right now (today actually).

AFAICT "strace" *is* our "defense against the dark arts" if you catch
my harry potter reference :-)

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
