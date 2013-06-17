From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: delete __cpuinit usage from all users
Date: Mon, 17 Jun 2013 15:47:27 -0700
Message-ID: <1371509247.8130.34.camel@dabdike>
References: <1371501264-12546-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1371501264-12546-1-git-send-email-paul.gortmaker@windriver.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2013-06-17 at 16:34 -0400, Paul Gortmaker wrote:
> The __cpuinit type of throwaway sections might have made sense
> some time ago when RAM was more constrained, but now the savings
> do not offset the cost and complications.  For example, the fix in
> commit 5e427ec2d0 ("x86: Fix bit corruption at CPU resume time")
> is a good example of the nasty type of bugs that can be created
> with improper use of the various __init prefixes.
> 
> After a discussion on LKML[1] it was decided that cpuinit should go
> the way of devinit and be phased out.  Once all the users are gone,
> we can then finally remove the macros themselves from linux/init.h.

Fine by us ... I'd recommend just rolling this into one patch for all
the cpuinit tags and sending it via the trivial tree (which goes to
linux-next) that way we'll know if we do anything to compromise it.

James


