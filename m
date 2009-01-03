From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] export length of os_hpmc vector
Date: Sat, 3 Jan 2009 10:56:42 -0500
Message-ID: <20090103155642.GH5181@bombadil.infradead.org>
References: <20090103013540.GG5181@bombadil.infradead.org> <495F2ED1.2000406@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@infradead.org>, linux-parisc@vger.kernel.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	gmsoft@tuxicoman.be
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <495F2ED1.2000406@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jan 03, 2009 at 10:24:33AM +0100, Helge Deller wrote:
> Kyle McMartin wrote:
> > diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
> > index 2cbf13b..5595a2f 100644
> > --- a/arch/parisc/kernel/hpmc.S
> > +++ b/arch/parisc/kernel/hpmc.S
> > @@ -80,6 +80,7 @@ END(hpmc_pim_data)
> >  
> >  	.import intr_save, code
> >  ENTRY(os_hpmc)
> > +.os_hpmc:
> 
> ENTRY(os_hpmc) already expands to
> os_hpmc:
> 
> so you could
> 
> > +	.word .os_hpmc_end-.os_hpmc
> 
> change this to 
> 	.word .os_hpmc_end-os_hpmc
> and drop the local label ".os_hpmc"
> 

In his previous mail JDA said to use local labels for safety...
