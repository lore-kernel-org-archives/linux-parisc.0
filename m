From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: Tue, 31 Aug 2004 18:43:57 +0100
Message-ID: <20040831174357.GQ16196@parcelfarce.linux.theplanet.co.uk>
References: <1093923097.3870.18.camel@mulgrave>
	<20040831171421.GC20353@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040831171421.GC20353@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 31, 2004 at 11:14:21AM -0600, Grant Grundler wrote:
> > There is, however, a bus based complication: not all parisc busses allow
> > an arbitrary device to send and interrupt to a CPU directly.  In
> > general, the older bus controllers: dino, cujo, etc cannot do this,
> 
> AFAIK, this is only true for HP V-class.
> And only because of some deficiency in the EPAC (CPU to X-bar chip?).
> It's not true for every other parisc platform I'm aware of.

But it's true for several of the subdevices of Lasi/Dino/Wax.

> PCI and GSC devices can master their own Transaction Based Interrupt (TBI).
> GSC device's EIM register are programmed directly with the target address
> and vector. PCI devices can master their own TBI if they can be told
> which address/data pair to use. E.g. clever scripting for NCR/SYM
> scsi chips would allow this and in fact HPUX 10.x c720 SCSI driver does.
> Otherwise PCI 2.2 (and later) devices can use MSI or MSI-X to
> the same effect. We just need to write the support glue
> to make it work for parisc.

That's all true, but doesn't help for Apricot lan, PS/2, serial, Harmony
audio, etc.

> > An older bus would allocate a single one, but would then register a
> > separate vector of interrupts (also a vector of struct
> > hw_interrupt_type) along with a callback to select the correct vector
> > for subsequent execution. 
> 
> I'd rather see one global array (at least 256 entries) with the CPU
> (and similar devices) getting a fixed number of consecutive entries.
> We should probably reserve the first 16 entries for EISA/ISA support
> like we did before.

I'm not sure that's a good idea.  It would give the impression that all
Lasi interrupts could be independently retargetted, which isn't true.
Note that Dino is a little more advanced and has two IRR registers,
so we could theoretically do some cool stuff with that ... but it's not
important enough, IMO.

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
