From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: syncdma question (back to ccio drivers)
Date: Mon, 6 Nov 2006 00:11:16 -0700
Message-ID: <20061106071116.GA14243@colo.lackof.org>
References: <454A6CF6.3040309@scarlet.be>
	<20061104223938.GC14141@colo.lackof.org>
	<454DD015.6040304@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <454DD015.6040304@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Nov 05, 2006 at 11:50:45AM +0000, Joel Soete wrote:
..
> > What makes you think this is a problem with IOMMU coherency?
> >
> Remember: 53c700 driver on b180 (don't use any ccio) works fine but the 
> same 53c700 driver on c110/d380 failed sadely:
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/030202.html>
> 
> and according to James' comment:
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/030204.html>
> 
> this should be a pb in sg list management; not in 53c700 (because works 
> fine without ccio) but well in ccio to which this 53c700 driver has to 
> address its io request, right?

Ah ok. It doesn't have to be the SG list handling.
So what is wrong? I have no clue.


This might also be a write-posting problem with MMIO register writes.
The CCIO chip might be introducing enough delay to expose the problem.

My second guess is a coherency problem with "consistent" data.
Ie control data that is allocated with pci_alloc_consistent().
I find this unlikely but it's possible.

> In a first step, I so manage to backport all your sba job since the time 
> those drivers looks like brotherhood:
> around
> <http://cvs.parisc-linux.org/linux-2.4/arch/parisc/kernel/sba_iommu.c?rev=1.26&view=markup>

Those two driver do have alot in common. But the TLB replacement algorithms
are NOT the same. The IO Pdir has different coherency rules as well.
Unfortunately, I don't remember all the details.

> This seems to help to improve ncr53c720 driver (not absolutely sure: run 
> untar/rm loop only 1h while it failed after few min before, but not yet 
> enough for me and more over it seems to break dino on the d380 additional 
> nic, though) but if didn't seem to degrade 53c700 driver, it didn't improve 
> it at all.
> 
> In a second step, I suspected specific stuff to ccio and specialy what 
> doesn't seems to exist here in ccio:
> the sba
>     /* flush purges */
>     READ_REG32(ioc->ioc_hpa+IOC_PCOM);
> 
> but without doc (not yet publicaly available) I couldn't go further in this 
> investigation.

Yes, that's another difference. IIRC, SBA can flush a _range_ of TLB entries
and CCIO (Uturn/U2) can not.

> 
> Let so assume that's ok.
> 
> Anyway something else could show a pb of synchronization: the driver perf 
> which can be a bit improved by disabling CCIO_SEARCH_TIME as this comment 
> said:
> /*
>  * CCIO_SEARCH_TIME can help measure how fast the bitmap search is.
>  * impacts performance though - ditch it if you don't use it.
>  */
> 
> If that make top stat completely false

Sorry -ENOPARSE.

> that mainly made 53c700 behaviour 
> even worse: (with the same driver code and same up config) even only one 
> untar/rm didn't reach to complete (iirc it didn't even finished untar) 
> while it could at least complete 2 or 3 loop before.

Sounds like there is a race condition between asking for a mapping
and it's use. Enableing CCIO_SEARCH_TIME will just make that longer.
Maybe experiement with adding udelay(10) or udelay(100) in the
same code path to see what happens.

> This latest test make me though it could also be a pb of synchronization 
> somewhere between ccio and 53c700 and may be a pb of cache?
 
Maybe.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
