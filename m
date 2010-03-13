From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Fri, 12 Mar 2010 21:06:47 -0500
Message-ID: <20100313020647.GA26384@hiauly1.hia.nrc.ca>
References: <20100307171207.GA22856@hiauly1.hia.nrc.ca> <20100307203230.CAC964E77@hiauly1.hia.nrc.ca> <20100311032049.GA14312@hiauly1.hia.nrc.ca> <20100311135418.GA22698@bombadil.infradead.org> <20100311224044.GA18789@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>, deller@gmx.de,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100311224044.GA18789@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 11 Mar 2010, John David Anglin wrote:

> I am 95% certain that the bug has to do with the clone implementation
> and scheduling.  I have attached another version of the minifail test.
> The loops after the fork and pthread_create calls are to isolate these
> syscalls.  Typically, I see something like:

Here's another idea.  In entry.S, there are some tricky tests to determine
whether to do signals and reschedule.  Based on testing, I'm not sure
that cr30 is always valid (e.g., external interrupt at boot) when we get to
intr_check_resched and intr_check_sig.

The other issue is r16.  I'm thinking we may need to reload r16 as the
context may change if we schedule, etc.  If this checking is broken, it
would break the LWS assumptions.

Thoughts?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
