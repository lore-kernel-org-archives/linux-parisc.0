From: Anders <dizzey@ing.umu.se>
Subject: Re: [parisc-linux] k-class drivers/parisc/ccio-dma.c
Date: Mon, 28 Mar 2005 14:18:47 +0200
Message-ID: <20050328121847.GA12853@ing.umu.se>
References: <20050327161520.GA15500@ing.umu.se>
	<20050328070527.GK30963@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050328070527.GK30963@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Mar 28, 2005 at 12:05:27AM -0700, Grant Grundler wrote:
> On Sun, Mar 27, 2005 at 06:15:20PM +0200, Anders wrote:
> > im having trouble with booting the 2.6 kernels on a k460.
> > 
> > --------------------------------------------------------
> > CPU(s): 4 x PA8000 (PCX-U) at 180.000000 MHz
> > Setting cache flush threshold to 40 (4 CPUs online)
> > Found U2 at 0xfff8a000
> > kernel BUG at drivers/parisc/ccio-dma.c:1317!
> 
> Can you try this change to line 1317?
> 
> -       BUG_ON(ioc->pdir_size >= 4 * 1024 * 1024);   /* max pdir size < 4MB */
> +       BUG_ON(ioc->pdir_size > (8 * 1024 * 1024));   /* max pdir size <= 8MB */
> 
> 
> Sorry - I didn't redo the math in the previous commit.
> More than 2GB of RAM should hit that maximum IOVA/DMA space size
> and result in an 8MB IO Pdir.
> 
> thanks,
> grant
thanks 
that line you gave solved that problem :)

well im of to write a new report about smp-badness
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
