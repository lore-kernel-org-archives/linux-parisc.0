From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] LBA PCI : avoid crash when pluging a pcmcia bridge
Date: Wed, 15 Nov 2006 08:54:15 -0600
Message-ID: <1163602455.3524.8.camel@mulgrave.il.steeleye.com>
References: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
	<20061115080022.GB30664@colo.lackof.org>
	<20061115122506.523bdd01.gmsoft@tuxicoman.be>
	<20061115122352.GH19143@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Guy Martin <gmsoft@tuxicoman.be>,
 parisc-linux@lists.parisc-linux.org
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

On Wed, 2006-11-15 at 05:23 -0700, Matthew Wilcox wrote:
> I bet a plain lspci will show a bus 2 elsewhere (probably one of the
> root busses).  ie: we need to renumber all our busses, just like we do
> for Dino.  Either that, or start using PCI domains, but I'd rather not
> go there just yet.

The dino code will probably be pretty much transportable over to LBA.
Dino was redone like this specifically to get PCMCIA bridges working,
and for the same reason (Firmware doesn't scan them, so they ended up
with conflicting or unassigned bus numbers).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
