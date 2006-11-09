From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] LBA PCI : avoid crash when pluging a pcmcia bridge
Date: Wed, 8 Nov 2006 23:40:37 -0700
Message-ID: <20061109064037.GC22063@colo.lackof.org>
References: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Nov 08, 2006 at 03:07:06PM +0100, Guy Martin wrote:
> Hi All,
> 
> Referencing this thread about a crash when there is a pcmcia bridge plugged in a C3600 :
> http://lists.parisc-linux.org/pipermail/parisc-linux/2006-October/030312.html
> 
> This small patch avoid a crash at boot time.
> 
> It's certainly not perfect as it would be better to fix
> pci_scan_bus_parented() which returns NULL but at least
> it makes the box booting.

Guy,
This is exactly why I won't apply this patch.
Not many people are plugging PCMCIA bridges into parisc boxen.
Those that do can tweak this by hand if they really insist on
installing something that causes the kernel to crash.

> Thanks for applying or fixing this in a better way :)

I should have a bit of time next week to look at this
and one other parisc problem...but I first need to test the recipe
that willy posted last week for updating existing git source trees.

thanks for your patience and gentle reminder,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
