From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] forgotten refcount on sysctl root table
Date: Thu, 04 Sep 2008 11:15:43 -0500
Message-ID: <1220544943.3276.20.camel@localhost.localdomain>
References: <1220540651.3276.16.camel@localhost.localdomain>
	 <20080904160557.GT28946@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080904160557.GT28946@ZenIV.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2008-09-04 at 17:05 +0100, Al Viro wrote:
> 	We should've set refcount on the root sysctl table; otherwise we'll
> blow up the first time we get down to zero dynamically registered sysctl
> tables.
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

That fixes the problem,

Thanks,

James


