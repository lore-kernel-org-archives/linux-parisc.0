From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] stop the buffer bouncing
Date: Sat, 20 Nov 2004 23:45:18 +0000
Message-ID: <20041120234518.GA25636@parcelfarce.linux.theplanet.co.uk>
References: <20041116063733.GA27633@colo.lackof.org>
	<20041116150748.GI26623@parcelfarce.linux.theplanet.co.uk>
	<20041116160939.GB4176@colo.lackof.org>
	<20041116163403.GJ26623@parcelfarce.linux.theplanet.co.uk>
	<20041116181427.GG4176@colo.lackof.org>
	<419FC7C4.5030606@tiscali.be>
	<20041120234201.GD11503@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041120234201.GD11503@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Nov 20, 2004 at 04:42:01PM -0700, Grant Grundler wrote:
> I'm guessing the problem is the ncr53c8xx driver does NOT call
> dma_set_mask(). PCI devices by default get a 32-bit mask.
> I'll commit a patch so that's true for "parisc" (ie GSC) devices
> as well. EISA device drivers will need to set an appropriate dma mask.
> -pa17 should be ready shortly.

EISA devices already get this set:

drivers/eisa/eisa-bus.c:        edev->dma_mask = root->dma_mask; /* Default DMA mask */
drivers/eisa/virtual_root.c:    .dma_mask      = 0xffffffff,

It's purely a parisc_device setup problem.  Nice spotting, Grant.

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
