From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPMC bus timeout on C3600
Date: Thu, 25 Dec 2008 01:06:06 -0700
Message-ID: <20081225080606.GA11032@colo.lackof.org>
References: <20081220133915.4c167e09@bleh.bxl.tuxicoman.be> <20081220221653.GA12880@bombadil.infradead.org> <20081220222100.GB12880@bombadil.infradead.org> <20081221081206.GC2047@colo.lackof.org> <20081222224023.2488f2ef@tuxicoman.be> <20081222214743.GC30144@bombadil.infradead.org> <20081222234948.776edb1b@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@infradead.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081222234948.776edb1b@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 22, 2008 at 11:49:48PM +0100, Guy Martin wrote:
> The command "dd if=/dev/zero of=/dev/sdc bs=1M" didn't trigger HPMC
> anymore after a reasonable amount of time.
> 
> I then tried a NFS copy from a NFS share to the disk. The kernel did
> panic with the attached output.

[ 1589.466507] Badness at fs/buffer.c:1186

Technically, this isn't a panic. This is a "WARN_ON".
I didn't see any panic's after that either.

The file system warning us that the sata disk it was
talking failed an IO. 

However, this is likely to be some other issue with the SATA controller.
Can you post more details about the config?
o "lspci -v"
o hdparm -i /dev/sd<X>

I don't expect I'll know what's wrong, but just want to document the bug.

thanks,
grant


> Hopefully this will be more useful.
> 
>   Guy
> 


