From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH 1/5] Add generic compat_siginfo_t
Date: Tue, 10 Jan 2006 10:01:41 -0500
Message-ID: <20060110150141.GE28306__38109.2487172738$1416623988$gmane$org@quicksilver.road.mcmartin.ca>
References: <20060108193755.GH3782@tachyon.int.mcmartin.ca>
	<20060109141355.GA22296@lst.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@osdl.org,
 willy@parisc-linux.org,
 parisc-linux@lists.parisc-linux.org,
 linux-kernel@vger.kernel.org,
 carlos@parisc-linux.org
To: Christoph Hellwig <hch@lst.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060109141355.GA22296@lst.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 09, 2006 at 03:13:55PM +0100, Christoph Hellwig wrote:
> -mm already has a much better implementation for compat_sys_timer_create
> that doesn't require all the sigevent churn in this patch (which btw
> doesn't seem to be mentioned in the changelog at all).  

Ok, I see it in -mm now, and it does seem to be nicer code, I'll
try it out on parisc64.

> But even with
> that remove there seems to be a lot of useless ifdef and indirection
> in this patch.  

I agree, I'm really just trying to shepard this home so we don't have
to maintain it out of tree. I'm not overly attached to the code, if
I can make parisc64 work with your compat signal bits, I'll be
just as happy.

The one thing from this patchset I'd like to keep is the is_compat_task()
as it does provide nice cleanups 

Cheers, Kyle

> Over the next days I'll send out my generic compat
> singal bits which don't require all this, but otoh require every
> architecture to supply helpers.  If you can make those generic without
> all the ifdef an additional header bits all power to you!
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
