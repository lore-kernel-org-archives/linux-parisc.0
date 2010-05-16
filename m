From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sun, 16 May 2010 17:38:27 -0400
Message-ID: <20100516213826.GA22615@hiauly1.hia.nrc.ca>
References: <20100511212628.59FFD505C@hiauly1.hia.nrc.ca> <4BE9CEF6.7010203@gmx.de> <20100515210251.GA16614@hiauly1.hia.nrc.ca> <4BF053EA.8090503@gmx.de>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	carlos@systemhalted.org, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BF053EA.8090503@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 16 May 2010, Helge Deller wrote:

> I wish could report success as well....
> But I still do see segfaults (although they seem to happen not as often as before).

Thanks again for testing.

I'm convinced that we have various race conditions in doing cache
user and kernel flushes that are not easily fixed.  For example,
in pte_wrprotect, it difficult to ensure that the cache is clean
in a SMP environment.  Think there are similar problems with
copy_user_page.

At the moment, I'm fairly pessimistic about finding a solution with
our current implementation of copy_user_page.  I've done more than a
hundred kernel builds, and while things are better, there are still
problems that look like cache corruption.  Often, it takes more than
a day for problems to appear.

> Which kernel do you test? I'm on 2.6.33.3 + your patches.

I'm on to 2.6.33.4.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
