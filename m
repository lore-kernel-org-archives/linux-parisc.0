From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: flush pages through tmpalias space
Date: Tue, 28 Dec 2010 23:23:47 -0500
Message-ID: <20101229042346.GA973@hiauly1.hia.nrc.ca>
References: <1293034931.3019.8.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1293034931.3019.8.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 22 Dec 2010, James Bottomley wrote:

> +		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
> +			__flush_cache_page(mpnt, addr, page_to_phys(page));
> +			if (old_addr)
> +				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
> +			old_addr = addr;
>  		}

I'm seeing the above kernel error on shutdown:

Dec 26 12:30:56 mx3210 kernel: INEQUIVALENT ALIASES 0x13000 and 0x14000 in file killall5
Dec 26 12:30:56 mx3210 kernel: INEQUIVALENT ALIASES 0x40122000 and 0x40121000 in file ld-2.11.2.so
Dec 26 12:30:57 mx3210 kernel: INEQUIVALENT ALIASES 0x402a7000 and 0x402a6000 in file libc-2.11.2.so

This is with 2.6.36.2 and your two patches on a SMP kernel.  I've also seen
these messages with a similar UP build in the gcc guality tests.  These
check debug info with gdb.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
