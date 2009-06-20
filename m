From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH][linux-2.6] Fix gcc 4.4 warning in lba_pci.c
Date: Sat, 20 Jun 2009 19:39:28 -0400 (EDT)
Message-ID: <20090620233929.6C5A04EF8@hiauly1.hia.nrc.ca>
References: <20090620233421.GB21560@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, grundler@parisc-linux.org,
	kyle@mcmartin.ca, deller@gmx.de, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090620233421.GB21560@lackof.org> from "Grant Grundler" at Jun 20, 2009 05:34:21 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> +	pa_pdc_cell = kzalloc(sizeof(pdc_pat_cell_mod_maddr_block_t));
> +	if (!pa_pdc_cell)
> +		return;
> +
> +	io_pdc_cell = kzalloc(sizeof(pdc_pat_cell_mod_maddr_block_t));

The kzalloc calls are missing an argument...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
