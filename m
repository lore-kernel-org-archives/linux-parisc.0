From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Sun, 21 Jun 2009 16:21:28 -0400 (EDT)
Message-ID: <20090621202129.69B214F19@hiauly1.hia.nrc.ca>
References: <119aab440906211301sf3b549dtd2a29839e86d4bfe@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440906211301sf3b549dtd2a29839e86d4bfe@mail.gmail.com> from "Carlos O'Donell" at Jun 21, 2009 04:01:04 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Sorry, this turns out not to be correct, after tracing the assembly
> completely (including loads in delayed branches) it looks like the
> location read from the pid through ptrace might be wrong. I'll have to
> keep debugging this.

Delayed branches are a nasty invention.  I am testing a patch to
fix a problem that appeared last week.

When a conditional branch with an unfilled delay slot is followed
by an asm, bad things may end up in the delay slot.  Even worse,
the branch may branch into the delay slot.  GCC has no idea what's
in an asm.  So, I'm trying to add a nop in the delay slot when a
conditional branch is followed by an asm.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
