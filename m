From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Fri, 11 Sep 2009 18:57:31 -0400 (EDT)
Message-ID: <20090911225732.DF5604E0B@hiauly1.hia.nrc.ca>
References: <119aab440909100903u2f25b7f0i73e979ce37c0ff5a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440909100903u2f25b7f0i73e979ce37c0ff5a@mail.gmail.com> from "Carlos O'Donell" at Sep 10, 2009 12:03:48 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> No, it's not neccessary. This way I simply have to audit the incorrect
> comparisons of a inferior's function pointer to a constant. If I were
> to disable canonicalization I'd have to audit the entire compilation
> unit to prove I haven't broken any valid function pointer comparisons.

I'm thinking we have OPD support with recent binutils, so the
above shouldn't be necessary.  Wasn't that something you added?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
