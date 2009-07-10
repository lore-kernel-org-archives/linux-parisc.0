From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Wierd code in Entry.S
Date: Fri, 10 Jul 2009 11:55:58 -0400 (EDT)
Message-ID: <20090710155559.CFAA44FC4@hiauly1.hia.nrc.ca>
References: <20090710153620.GB28778@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, artem.alimarine@stromasys.com,
	linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090710153620.GB28778@lackof.org> from "Grant Grundler" at Jul 10, 2009 09:36:20 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> But I'm still wondering what the effect of this bug will be.
> The first order (not setting U-bit) should only affect ZX1 (pa8800/pa8900)
> machines. Those have uncacheable IO space between 2GB-4GB physical address.
> My guess is the machines should HPMC since the CPU would attempt to access
> those ranges as a cacheline read/write instead of sub-cacheline transactions.

I think the depdi change may fix the random memory corruption that
I have been complaining about.  My rp3440 has got through a full build
of GCC with 2.6.30.1.  Previous two attempts failed with segmentation
faults in the dynamic loader, one of which I reported on.  It will
take a few more builds to be sure.  Your comment would explain why I
don't see this on c3750.  Could this affect PA8700?

I installed the change on my rp3440, c3750 and gsyprf11 last night.
At some point, I need to test the change with an SMP build on the rp3440.

There is one other issue that I see on the rp3440 which I don't see
on the c3750 or gsyprf11.  I get occassional testsuite timeouts during
compilation on compilations that shouldn't timeout.  I had always
thought this to be a tcl/expect issue, but now I think this is likely
a kernel issue.  I need to change the timeout value in the testsuite
to something big so I can see what's happening.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
