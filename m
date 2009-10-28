From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc: fix unwind
Date: Wed, 28 Oct 2009 11:37:25 -0400
Message-ID: <20091028153725.GU11702@bombadil.infradead.org>
References: <20091025214248.GA15028@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <tausq@debian.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091025214248.GA15028@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Oct 25, 2009 at 10:42:48PM +0100, Helge Deller wrote:
> kernel unwinding is broken with gcc >= 4.x. Part of the problem is, that
> binutils seems sensible where the unwind information is stored.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 

This looks good to me, I checked the resulting vmlinux and things seem
sensible...

I'll apply it to my next branch when I get home tonight.

r, Kyle
