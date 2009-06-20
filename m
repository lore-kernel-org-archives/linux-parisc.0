From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH][linux-2.6] Fix gcc 4.4 warning in lba_pci.c
Date: Sat, 20 Jun 2009 17:51:30 -0600
Message-ID: <20090620235130.GC21560@lackof.org>
References: <20090620233421.GB21560@lackof.org> <20090620233929.6C5A04EF8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	James.Bottomley@HansenPartnership.com, kyle@mcmartin.ca,
	deller@gmx.de, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090620233929.6C5A04EF8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jun 20, 2009 at 07:39:28PM -0400, John David Anglin wrote:
> > +	pa_pdc_cell = kzalloc(sizeof(pdc_pat_cell_mod_maddr_block_t));
> > +	if (!pa_pdc_cell)
> > +		return;
> > +
> > +	io_pdc_cell = kzalloc(sizeof(pdc_pat_cell_mod_maddr_block_t));
> 
> The kzalloc calls are missing an argument...

Doh #2....thank you, Dave. Time for a nap. 5h is clearly not enough.
I'll risk posting another version even though I still can't build.

BTW, here is the offending error:
fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section type conflict

and the offending line 400 after preprocessing:
static const char __setup_str_nfs_root_setup[] __attribute__ ((__section__(".init.rodata"))) __attribute__((aligned(1))) = "nfsroot="; static struct obs_kernel_param __setup_nfs_root_setup __attribute__((__used__)) __attribute__ ((__section__(".init.setup"))) __attribute__((aligned((sizeof(long))))) = { __setup_str_nfs_root_setup, nfs_root_setup, 0 };

thanks,
grant
