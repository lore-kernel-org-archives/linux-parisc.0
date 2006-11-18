From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] LBA PCI : avoid crash when pluging a pcmcia bridge
Date: Sat, 18 Nov 2006 06:56:11 -0700
Message-ID: <20061118135610.GE18567@parisc-linux.org>
References: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
	<20061115080022.GB30664@colo.lackof.org>
	<20061115122506.523bdd01.gmsoft@tuxicoman.be>
	<20061115122352.GH19143@parisc-linux.org>
	<20061115190830.f8e99725.gmsoft@tuxicoman.be>
	<20061117203041.GD18567@parisc-linux.org>
	<20061118122103.0771c93e.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061118122103.0771c93e.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Nov 18, 2006 at 12:21:03PM +0100, Guy Martin wrote:
> I tried the patch and it fixes the issue. lba_bus is never NULL.

Excellent.  I'll check it in, without the debug printk (there's already
enough information to determine what's going on)

> However, the pcmcia bridge is not useable yet but I guess some more work needs to be done to have it working.
> 
> Full dmesg and lspci with the new bus id :
> https://www.tuxicoman.be/temp/c3600-pci-debug.logs2

I suspect the next problem is getting IRQs working:

iosapic: 0xfed32800 : no IRT entry for slot 6, pin 1
iosapic: no IRTE for 0000:01:06.0 (IRQ not connected?)

Grant, any thoughts?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
