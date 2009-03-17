From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: hpmc on rp3440 with 2.6.29-rc5
Date: Mon, 16 Mar 2009 21:18:14 -0400 (EDT)
Message-ID: <20090317011815.B63EE4E9D@hiauly1.hia.nrc.ca>
References: <20090317005624.GE4282@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090317005624.GE4282@bombadil.infradead.org> from "Kyle McMartin" at Mar 16, 2009 08:56:24 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Woah. Really good catch, we're missing compat handlers for virtually all
> the ipc functions!

Is there some way to do an audit as to what else might be missing?

The reason I ask is that I tried linus 2.6.29-rc8 on my c3750 Saturday.
There's still a problem with user and group access by sshd.  There may
be a load dependence.  I have only seen this with 32-bit kernels.  It's
not present in 2.6.22.

Other common problems are occasional timeouts in the GCC testsuite
by some programs that shouldn't timeout.  There are also occasional
timeouts in pthread related applications but that's likely a glibc
issue.

I also see truncated output from some tests that generate a lot of
output.  This seems worse with 32-bit kernels.  There are a couple of
tests in the binutils gas testsuite that trigger this all the time.
I would think this has something to do with exit and pipe sizes.

The last two problems have been around for a long time.

> I'll fix this up ASAP.

Fantastic!

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
