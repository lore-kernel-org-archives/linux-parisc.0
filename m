From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: iommu-helpers.h patch
Date: Tue, 8 Jan 2008 23:45:13 -0700
Message-ID: <20080109064513.GB20727@colo.lackof.org>
References: <476D1509.1070601@scarlet.be> <20071228075610.GD17782@colo.lackof.org> <477515DE.7090403@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <477515DE.7090403@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Dec 28, 2007 at 03:27:26PM +0000, rubisher wrote:
> Anyway cnt variable was gone:
> # grep cnt drivers/parisc/iommu-helpers.h
>                            (unsigned long)sg_dma_address(startsg), cnt,

oh! that's definitely wrong too then...

> the interesting hunk's part was:
> -		int cnt = sg_dma_len(startsg);
> -		sg_dma_len(startsg) = 0;
> +		unsigned long vaddr;
> +		long size;

Yup...

> (and make a kernel with DEBUG_CCIO_RUN_SG failed with an error at this 
> place, so we need to patch ;-)
>
>> "cnt" was the thing I needed/wanted dumped.
> So may be something like:
>
>                 DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
> -                          (unsigned long)sg_dma_address(startsg), cnt,
> +                          (unsigned long)sg_dma_address(startsg), 
> sg_dma_len(startsg),
>                            sg_virt_addr(startsg), startsg->length
>                 );

Yeah, that would be better I think.

grant
