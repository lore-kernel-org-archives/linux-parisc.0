From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc: fix unwind
Date: Wed, 28 Oct 2009 12:28:35 -0400
Message-ID: <20091028162835.GV11702@bombadil.infradead.org>
References: <20091025214248.GA15028@p100.box> <20091028153725.GU11702@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Randolph Chung <tausq@debian.org>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091028153725.GU11702@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Oct 28, 2009 at 11:37:25AM -0400, Kyle McMartin wrote:
> On Sun, Oct 25, 2009 at 10:42:48PM +0100, Helge Deller wrote:
> > kernel unwinding is broken with gcc >= 4.x. Part of the problem is, that
> > binutils seems sensible where the unwind information is stored.
> > 
> > Signed-off-by: Helge Deller <deller@gmx.de>
> > 
> 
> This looks good to me, I checked the resulting vmlinux and things seem
> sensible...
> 
> I'll apply it to my next branch when I get home tonight.
> 

I meant fixes.
