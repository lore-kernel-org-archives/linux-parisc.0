From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [GIT PULL] parisc fixes for 3.4-rc1
Date: Thu, 07 Jun 2012 14:59:00 +0900
Message-ID: <1339048740.26595.8.camel@dabdike.int.hansenpartnership.com>
References: <1339047493.26595.7.camel@dabdike.int.hansenpartnership.com>
	 <20120607055256.GA15428@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120607055256.GA15428@kroah.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2012-06-07 at 14:52 +0900, Greg KH wrote:
> On Thu, Jun 07, 2012 at 02:38:13PM +0900, James Bottomley wrote:
> > This is a set of three bug fixes for minor build breakages that got
> > introduced just before 3.4-rc1 was released.
> 
> 3.4-rc1 or 3.5-rc1?  I ask as if this is 3.4-rc1, these should go to the
> stable tree, right?

Sorry, mislabel ... it's 3.5-rc1 ... they all fix breaks that were
introduced within the last week, so no need for a stable backport.

James


