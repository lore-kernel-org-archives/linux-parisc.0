From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: segv doing execv
Date: Fri, 28 Dec 2007 10:52:56 -0500 (EST)
Message-ID: <200712281553.lBSFrCFK024927@hiauly1.hia.nrc.ca>
References: <119aab440712272012g3ff7c5c6n5e16437bc5dd6003@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440712272012g3ff7c5c6n5e16437bc5dd6003@mail.gmail.com> from "Carlos O'Donell" at Dec 27, 2007 11:12:23 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I don't recognize the assembler dump as any particularly important
> sequence.

Ok, then there's no hope.

> > I'm currently trying to use the debug libraries.  It seems gdb won't
> > load the debug libraries when a failure occurs with non-debug libs.
> 
> Do you actually mean "stripped libraries" vs. "unstripped libraries?"

Yes, the ones with debug info (i.e., those in /usr/lib/debug).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
