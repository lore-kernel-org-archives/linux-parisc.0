From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Re: [PATCH] parisc: remove copat_ioctl entires for pp
Date: Sat, 12 Nov 2005 06:33:08 -0700
Message-ID: <20051112133308.GI1658@parisc-linux.org>
References: <20051112095213.GA15918@lst.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@osdl.org,
 netdev@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: Christoph Hellwig <hch@lst.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051112095213.GA15918@lst.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Nov 12, 2005 at 10:52:13AM +0100, Christoph Hellwig wrote:
> ppp ioctls handlers in parisc are wrong:
> 
>  - they would need to do a copat_ptr on  ifr->ifr_ifru.ifru_data
>  - SIOCGPPP* ioctls are defines as SIOCDEVPRIVATE + n, so they'd
>    kick in for all private ioctls which is defintely wrong.
> 
> to implement proper ppp compat_ioctl handlig we'd need a compat_ioctl
> method in struct net_device, which we don't have yet.

While I agree that this is theoretically wrong, the problem is that if
we remove them, people using ppp on 64-bit PA machines will no longer be
able to do so.  And yes, there are some, that's why these got added in
the first place.

Perhaps I'll look into the compat_ioctl route later.  In any case, I
would prefer this patch not be added for the moment.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
