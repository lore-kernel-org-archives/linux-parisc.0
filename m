From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] k-class drivers/parisc/ccio-dma.c
Date: Sun, 27 Mar 2005 20:24:10 +0100
Message-ID: <20050327192410.GT21986@parcelfarce.linux.theplanet.co.uk>
References: <20050327161520.GA15500@ing.umu.se>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Anders <dizzey@ing.umu.se>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050327161520.GA15500@ing.umu.se>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Mar 27, 2005 at 06:15:20PM +0200, Anders wrote:
> im having trouble with booting the 2.6 kernels on a k460.
> 
> --------------------------------------------------------
> CPU(s): 4 x PA8000 (PCX-U) at 180.000000 MHz
> Setting cache flush threshold to 40 (4 CPUs online)
> Found U2 at 0xfff8a000
> kernel BUG at drivers/parisc/ccio-dma.c:1317!

Grant, Joel, this is your faults:

        ioc->pdir_size = (iova_space_size / IOVP_SIZE) * sizeof(u64);

        BUG_ON(ioc->pdir_size >= 4 * 1024 * 1024);   /* max pdir size < 4MB */

I don't really want to dig into this right now, could one of you
investigate?

Anders, how much memory do you have?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
