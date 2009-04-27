From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: SMP: CPU:1 is stuck. on J6750
Date: Mon, 27 Apr 2009 13:01:51 -0400
Message-ID: <20090427170151.GA7823@bombadil.infradead.org>
References: <200904240915.44386.nick.leippe@whitecanyon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Nicholas Leippe <nick.leippe@whitecanyon.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200904240915.44386.nick.leippe@whitecanyon.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Apr 24, 2009 at 09:15:44AM -0600, Nicholas Leippe wrote:
> I'm still experiencing this issue on a J6750.
> I've gotten this w/kernels 2.6.26 thru 2.6.29.
> Other than the missing cpu, things seem to function just fine.
> Increasing the timeout in smp.c line 410 to 100000 did not help.
> 

Does it work in 32-bit mode?

I seem to recall being unable to reproduce this. It's very strange...

regards, Kyle
