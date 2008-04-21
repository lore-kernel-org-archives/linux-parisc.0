From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [REGRESSION] 2.6.25 on parisc - CPU 1 is stuck
Date: Mon, 21 Apr 2008 09:07:41 -0400 (EDT)
Message-ID: <20080421130742.79F9D4DE4@hiauly1.hia.nrc.ca>
References: <20080421050029.GC15080@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080421050029.GC15080@colo.lackof.org> from "Grant Grundler" at Apr 20, 2008 11:00:29 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Releasing cpu 1 now, hpa=fffffffffffa2000
> > SMP: CPU:1 is stuck.
> 
> BTW, I'm not sure this is a kernel problem. Do older kernels still work?

I'm not sure this is related but a few months ago I noticed that only
two of the four cpus in the rp3440 that I have were running.  I reenabled
the two cpus that were not running, but I had to do it a couple of more
times before the two cpus remained enabled across reboots.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
