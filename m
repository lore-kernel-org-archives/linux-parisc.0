From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: parisc: flush pages through tmpalias space
Date: Wed, 29 Dec 2010 08:51:21 -0600
Message-ID: <1293634281.2803.4.camel@fuzzy>
References: <1293034931.3019.8.camel@mulgrave.site>
	 <20101229042346.GA973@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101229042346.GA973@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2010-12-28 at 23:23 -0500, John David Anglin wrote:
> On Wed, 22 Dec 2010, James Bottomley wrote:
> 
> > +		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
> > +			__flush_cache_page(mpnt, addr, page_to_phys(page));
> > +			if (old_addr)
> > +				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
> > +			old_addr = addr;
> >  		}
> 
> I'm seeing the above kernel error on shutdown:
> 
> Dec 26 12:30:56 mx3210 kernel: INEQUIVALENT ALIASES 0x13000 and 0x14000 in file killall5
> Dec 26 12:30:56 mx3210 kernel: INEQUIVALENT ALIASES 0x40122000 and 0x40121000 in file ld-2.11.2.so
> Dec 26 12:30:57 mx3210 kernel: INEQUIVALENT ALIASES 0x402a7000 and 0x402a6000 in file libc-2.11.2.so
> 
> This is with 2.6.36.2 and your two patches on a SMP kernel.  I've also seen
> these messages with a similar UP build in the gcc guality tests.  These
> check debug info with gdb.

Yes, I still don't know why, but fortunately the one above is the same
one I see, which only occurs when the system goes down.  I suspect
something is specifying a fixed offset for the library mappings which
violates our 4MB equivalency rule.

James


