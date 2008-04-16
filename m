From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: gcc 4.3 and kernel compiling
Date: Wed, 16 Apr 2008 16:27:01 -0400
Message-ID: <20080416202701.GB7475@phobos.i.cabal.ca>
References: <200804162222.30737.b.gunreben@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Berthold Gunreben <b.gunreben@web.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200804162222.30737.b.gunreben@web.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Apr 16, 2008 at 10:22:30PM +0200, Berthold Gunreben wrote:
>  IAOQ[0]: cmpxchg_futex_value_locked+0x28/0x7c^M
>  IAOQ[1]: cmpxchg_futex_value_locked+0x2c/0x7c^M
>  RP(r2): init+0x20/0x104^M
> Backtrace:^M
> ^M
> Kernel panic - not syncing: Kernel Fault^M
> 
> Is there a  known issue maybe with barrier() that I should be aware of?
> 

update your kernel. this issue is independent of gcc version.
