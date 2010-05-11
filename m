From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Tue, 11 May 2010 17:26:27 -0400 (EDT)
Message-ID: <20100511212628.59FFD505C@hiauly1.hia.nrc.ca>
References: <4BE9C0FE.80509@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org,
	gniibe@fsij.org, linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BE9C0FE.80509@gmx.de> from "Helge Deller" at May 11, 2010 10:41:34 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On 05/10/2010 09:20 PM, Helge Deller wrote:
> > On 05/10/2010 04:56 PM, John David Anglin wrote:
> >> Yes, just after sending, I noticed gcc testsuite and minifail were
> >> broken on gsyprf11.  [...]
> >>
> >> The attached works better on gsyprf11.  I haven't tested it on anything
> >> else.
> 
> Hi Dave,
> 
> I still can see segfaults of the minifail_dave.cpp program.
> 
> In addition I see some memory corruptions.
> Those corruptions are not new due to your patch, I could see them with
> other patches (and maybe even plain 2.6.32.3 kernel) as well...
> 
> pagealloc: memory corruption

I haven't seen this.  Which allocator are you using?  I have
CONFIG_SLAB=y.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
