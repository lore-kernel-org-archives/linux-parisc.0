From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [parisc-linux] LBA PCI : avoid crash when pluging a pcmcia bridge
Date: Sat, 18 Nov 2006 12:21:03 +0100
Message-ID: <20061118122103.0771c93e.gmsoft@tuxicoman.be>
References: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
	<20061115080022.GB30664@colo.lackof.org>
	<20061115122506.523bdd01.gmsoft@tuxicoman.be>
	<20061115122352.GH19143@parisc-linux.org>
	<20061115190830.f8e99725.gmsoft@tuxicoman.be>
	<20061117203041.GD18567@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061117203041.GD18567@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Hello Matthew,

I tried the patch and it fixes the issue. lba_bus is never NULL.

However, the pcmcia bridge is not useable yet but I guess some more work needs to be done to have it working.

Full dmesg and lspci with the new bus id :
https://www.tuxicoman.be/temp/c3600-pci-debug.logs2

  Guy


On Fri, 17 Nov 2006 13:30:42 -0700
Matthew Wilcox <matthew@wil.cx> wrote:

> On Wed, Nov 15, 2006 at 07:08:30PM +0100, Guy Martin wrote:
> > I've put the complete dmesg and lspci output (both numerical and not) here :
> > https://www.tuxicoman.be/temp/c3600-pci-debug.logs
> 
> Thanks.  Please try this patch (cribbed somewhat from jejb's patch for
> Dino back in December 2003 ;-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
