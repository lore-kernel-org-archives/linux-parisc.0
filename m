From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: 64bit kernel not booting with CONFIG_PRINTK_TIME=y
Date: Thu, 17 Jul 2008 14:33:11 -0400
Message-ID: <20080717183311.GA17111@phobos.i.cabal.ca>
References: <20080716204552.56270e7c@tuxicoman.be> <20080716185627.GC22716@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080716185627.GC22716@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jul 16, 2008 at 02:56:27PM -0400, Kyle McMartin wrote:
> On Wed, Jul 16, 2008 at 08:45:52PM +0200, Guy Martin wrote:
> > 
> > This is the output of my L2000 when trying to do so :
> > 
> > Information: No console specified on kernel command line. This is
> > normal. PALO will choose the console currently used by firmware
> > (serial). Command line for kernel: 'root=/dev/md1 console=ttyS0
> > palo_kernel=2/vmlinux' Selected kernel: /vmlinux from partition 2
> > ELF64 executable
> > Entry 00100000 first 00100000 n 2
> > Segment 0 load 00100000 size 4997120 mediaptr 0x1000
> > Segment 1 load 00634000 size 640576 mediaptr 0x4c5000
> > Branching to kernel entry point 0x00100000.  If this is the last
> > message you see, you may need to switch your console.  This is
> > a common symptom -- search the FAQ and mailing list at parisc-linux.org
> > 
> 

How about if you boot with printk_time=0, whilst CONFIG_PRINTK_TIME=y?

r, Kyle
