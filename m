From: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] Re: 2.6.4-rc1-pa3 siimage/NS87415 IDE progess (and
	another mystery)!
Date: Mon, 12 Jul 2004 19:39:44 +0100
Message-ID: <20040712183943.GA11805@sal.ucc.ie>
References: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
	<20040309063629.GM1113@tausq.org>
	<Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
	<20040309072917.GN1113@tausq.org>
	<Pine.LNX.4.58.0403091401480.16082@sal.ucc.ie>
	<20040711221829.GA27835@colo.lackof.org>
	<20040711231401.GW546@tausq.org> <20040711233439.GX546@tausq.org>
	<20040712033752.GA10163@sal.ucc.ie>
	<20040712160534.GA12046@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040712160534.GA12046@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jul 12, 2004 at 10:05:34AM -0600, Grant Grundler wrote:

> On Mon, Jul 12, 2004 at 04:37:52AM +0100, M. Grabert wrote:
> > Tested above patch, but unfortunately it didn't work for me,
> 
> The rest of your post in fact suggests it did.
> Ie you should no longer need to "sea" at the boot prompt.

OOOooOOoooopps!
This isse was resolved by Randolph, back in March, 9th:

|>  ...just add in this bit in the fixup routine:"
|>  
|>   +  pci_read_config_byte(pdev, PCI_CLASS_PROG, &prog);                                                                               
|>   +  printk("PCI: Enabled native mode for NS87415 (pif=0x%x)\n", prog); 

The next day (March, 10th) I sent you and Randolph a success report
after you both sent me patches:

|>  So far the only bugs remaining are the "lost interrupt" problems                
|>  for the promise/siimage drivers and getting DMA really working                  
|>  for the NS87415.

Those patches obviously made it into the CVS a couple the same day:
http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2004-March/033894.html
NS87415 onboard IDE + hard drivers worked since then, starting with the
(stock) 2.6.4-rc3-pa6 kernel.

Since everybody (Randolph, you, me) always replied privately in this
thread and we all didn't CC: the p-l, there was no record that
the 'mystery bug' had been fixed already.

> > the NS87415 still doesn't use DMA (or so it seems, at least it's
> > still the 3MB/s instead of the expected 30-40MB/s).
> > 
> > hdparm -c /dev/hda showed DMA was turned on, and I even set it on
> > again (hdparm -c 1), just to be sure, but it didn't make any
> > difference in performance :(
> 
> This patch makes no attempt at changing existing DMA behaviors.
> It's likely the NS87415 code needs to twiddle the "Prefetch Mode"
> bits for something other than ATAPI (no prefetch) to get
> better performance.

That's where I misunderstood you: I thought you patch was trying
to fix DMA.

BTW, I should have CC'ed my success report to p-l (back in March), maybe
this way you would have noticed/discovered more easily that this
particular bug has been fixed.

I hope my bug report was not the only reason what inspired you
to make this patch, otherwise it would have been an awful waste of
time :-/


Greetings,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
