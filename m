From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the parisc-hd tree
Date: Tue, 29 Aug 2017 08:58:10 +0200
Message-ID: <20170829065810.GB13428@kroah.com>
References: <20170829163513.4b119a91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arvind Yadav <arvind.yadav.cs@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170829163513.4b119a91@canb.auug.org.au>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Aug 29, 2017 at 04:35:13PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   drivers/tty/serial/8250/8250_gsc.c
> 
> between commit:
> 
>   9e466f101e19 ("parisc/8250_gsc: Fix section mismatches")
> 
> from the parisc-hd tree and commit:
> 
>   0d474f7fad3b ("tty: 8250: constify parisc_device_id")
> 
> from the tty tree.
> 
> I fixed it up (the former is a superset of the latter) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Thanks for letting me know about this, and the other conflict here.

greg k-h
