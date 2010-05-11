From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Tue, 11 May 2010 12:37:01 -0400
Message-ID: <20100511163700.GA20368@hiauly1.hia.nrc.ca>
References: <20100412214118.46D925160@hiauly1.hia.nrc.ca> <20100413115501.307040@gmx.net> <20100419162653.GA106@hiauly1.hia.nrc.ca> <4BCDEB6E.1060408@gmx.de> <20100509124339.GA6797@hiauly1.hia.nrc.ca> <20100510095632.173760@gmx.net> <20100510145648.GA13452@hiauly1.hia.nrc.ca> <4BE85C82.4080202@gmx.de> <20100510210711.GA15723@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	carlos@systemhalted.org, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100510210711.GA15723@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 10 May 2010, John David Anglin wrote:

> I'll do a little more testing tonight.  In testing, I have had a
> couple of boot failures on gsyprf11 starting iptables.  Haven't
> seen any hpmc's starting sshd.

It appears James' kmap change is needed on PA8800 (rp3440) for cache
coherency.  I see segmentation faults in sh with just the flush in
ptep_set_wrprotect.  I haven't had a chance to test whether the flush
in ptep_set_wrprotect is needed to fix minifail on this machine.
However, a GCC build completed successfully with the kmap change and
without the ptep_set_wrprotect flush.

On gsyprf11 (PA8700), James' kmap change doesn't fix minifail and we need
the cache flush in ptep_set_wrprotect to fix minifail.  The kmap change
causes general instability by itself.

Thus, it appears necessary to merge the two approaches and treat PA8700
and PA8800 differently.

I think we are really killing performance with the cache flushing...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
