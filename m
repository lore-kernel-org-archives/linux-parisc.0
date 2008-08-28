From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: linux-next: parisc tree build failure
Date: Thu, 28 Aug 2008 10:33:19 -0400
Message-ID: <20080828143319.GD6298@phobos.i.cabal.ca>
References: <20080828115820.d2e4f55b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org,
	linux-next@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080828115820.d2e4f55b.sfr@canb.auug.org.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Aug 28, 2008 at 11:58:20AM +1000, Stephen Rothwell wrote:
> Hi Kyle,
> 
> A parisc defconfig build of linux-next (next-20080827) fails like this:
> 
> sound/parisc/harmony.c:872: error: 'reutrn' undeclared (first use in this function)
> 

You're looking the wrong way... we didn't touch this code...

r, Kyle
