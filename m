From: Kyle McMartin <kyle-pfcGkIkfWfAsA/PxXw9srA@public.gmane.org>
Subject: Re: 2.6.30-rc1: parisc: system hangs on boot at __schedule()
Date: Wed, 8 Apr 2009 18:09:21 -0400
Message-ID: <20090408220921.GF7372@bombadil.infradead.org>
References: <a4423d670904080603w50face2fl87cd16bd7967cb5d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
To: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a4423d670904080603w50face2fl87cd16bd7967cb5d-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Apr 08, 2009 at 05:03:04PM +0400, Alexander Beregalov wrote:
> Hi
> 
> Machine is HP j6000.
> CPU(s): 2 x PA8700 (PCX-W2) at 750.000000 MHz
> 
> gcc version 4.3.3 (Gentoo 4.3.3-r2 p1.1, pie-10.1.5)
> 
> 
> Machine hangs before starting rc scripts, but SysRq and C-A-Del work.
> 
> All tasks are at __schedule+0x268/0x7bc:
> 

.config?
