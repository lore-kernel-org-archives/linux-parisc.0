From: Rick Jones <rick.jones2@hp.com>
Subject: Re: Cupertino test ring problem?
Date: Mon, 28 Jul 2008 10:09:54 -0700
Message-ID: <488DFD62.4080307@hp.com>
References: <1217254746.3503.61.camel@localhost.localdomain> <20080728145712.GH18026@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Richard Jones <rick.jones2@hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080728145712.GH18026@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Matthew Wilcox wrote:
> On Mon, Jul 28, 2008 at 09:19:05AM -0500, James Bottomley wrote:
> 
>>The gateway machines to cupertino (gsyfrf11/10) have been inaccessible
>>for most of last week.  Can we get someone local to give them a poke and
>>see what's up with them?
> 
> 
> Dave Anglin asked me about it during OLS.  I suggested he poke Rick
> Jones ...

That explains that mild ache in my side :)

The Cupertino test ring got moved last week from one machine room to 
another. This also included netperf.org and ftp.cup.hp.com. Shutdown was 
about 1600 Pacific time on the 23rd, and power was restored to the racks 
by about that time on Thursday.  I brought-up netperf.org, 
ftp.cup.hp.com and they talked fine and dandy on the network, so I 
simply powered-on the lp1000r gateway and ass-u-me-d it would work as 
well.  I guess it didn't :(  and I will try to take a look at them today.

rick jones

