From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Wed, 9 Sep 2009 21:10:09 -0400 (EDT)
Message-ID: <20090910011010.3103E4CFD@hiauly1.hia.nrc.ca>
References: <119aab440909090824n55dff67sb32c0d3468a19d25@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440909090824n55dff67sb32c0d3468a19d25@mail.gmail.com> from "Carlos O'Donell" at Sep 9, 2009 11:24:43 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, Sep 9, 2009 at 11:16 AM, John David
> Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> >> The workaround is to cast both long. I tested this and it works. I'll
> >> submit this to debian as the fix.
> >
> > This is simplest fix.
> 
> Yes, it would appear that strace/gdb (applications that ptrace
> addresses from another process) are most likely applications to suffer
> from this problem, and it may be easier to work around the problem
> there instead of in the compiler.

Actually, it probably would not be too hard to disable canonicalization
with a compiler option.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
