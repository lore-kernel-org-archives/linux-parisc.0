From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Fwd: [PATCH] fix mapping_writably_mapped()
Date: Thu, 11 Dec 2008 07:52:53 -0500 (EST)
Message-ID: <20081211125254.858B54EF0@hiauly1.hia.nrc.ca>
References: <20081211082940.GA29091@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@infradead.org, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081211082940.GA29091@colo.lackof.org> from "Grant Grundler" at Dec 11, 2008 01:29:40 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, Dec 10, 2008 at 04:46:38PM -0500, Kyle McMartin wrote:
> > This may explain some of the userspace issues we've been seeing.
> 
> It seems to fix the issues I pointed out.
> 2.6.28-rc8 (linus' linux-2.6 git) is able to build a kernel from
> scratch without segfaulting! :)
> Previous 2.6.27 and 2.6.28 kernels that I tested weren't able to do that.

That's excellent news.  I applied it to my 2.6.22.19 tree.  My first
gcc build had an unexpected segfault, but the second try was ok.

I'll try 2.6.28-rc8 soon.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
