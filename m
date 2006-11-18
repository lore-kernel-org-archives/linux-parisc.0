From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] LBA PCI : avoid crash when pluging a pcmcia bridge
Date: Sat, 18 Nov 2006 08:22:24 -0600
Message-ID: <1163859744.2806.1.camel@mulgrave.il.steeleye.com>
References: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
	<20061115080022.GB30664@colo.lackof.org>
	<20061115122506.523bdd01.gmsoft@tuxicoman.be>
	<20061115122352.GH19143@parisc-linux.org>
	<20061115190830.f8e99725.gmsoft@tuxicoman.be>
	<20061117203041.GD18567@parisc-linux.org>
	<20061118122103.0771c93e.gmsoft@tuxicoman.be>
	<20061118135610.GE18567@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Guy Martin <gmsoft@tuxicoman.be>,
 parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061118135610.GE18567@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2006-11-18 at 06:56 -0700, Matthew Wilcox wrote:
> I suspect the next problem is getting IRQs working:
> 
> iosapic: 0xfed32800 : no IRT entry for slot 6, pin 1
> iosapic: no IRTE for 0000:01:06.0 (IRQ not connected?)

Yes ... that was exactly the same as for dino.  There's a piece of
fiddle code in the dino to guess where the interrupt actually is and
wire it up ...

In this case, it just looks like you need to fill in the IRT entry.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
