From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [parisc-linux] LBA PCI : avoid crash when pluging a pcmcia bridge
Date: Wed, 15 Nov 2006 19:08:30 +0100
Message-ID: <20061115190830.f8e99725.gmsoft@tuxicoman.be>
References: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
	<20061115080022.GB30664@colo.lackof.org>
	<20061115122506.523bdd01.gmsoft@tuxicoman.be>
	<20061115122352.GH19143@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061115122352.GH19143@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, 15 Nov 2006 05:23:52 -0700
Matthew Wilcox <matthew@wil.cx> wrote:

> I bet a plain lspci will show a bus 2 elsewhere (probably one of the
> root busses).  ie: we need to renumber all our busses, just like we do
> for Dino.  Either that, or start using PCI domains, but I'd rather not
> go there just yet.

Hi Matthew,

I've put the complete dmesg and lspci output (both numerical and not) here :
https://www.tuxicoman.be/temp/c3600-pci-debug.logs

Cheers,
  Guy
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
