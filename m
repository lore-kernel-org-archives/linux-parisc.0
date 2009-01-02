From: Kyle McMartin <kyle@infradead.org>
Subject: Re: HPMC bus timeout on C3600
Date: Fri, 2 Jan 2009 16:01:15 -0500
Message-ID: <20090102210115.GB17486@bombadil.infradead.org>
References: <20081220221653.GA12880@bombadil.infradead.org> <20081220222100.GB12880@bombadil.infradead.org> <20081221081206.GC2047@colo.lackof.org> <20081222224023.2488f2ef@tuxicoman.be> <20081222214743.GC30144@bombadil.infradead.org> <20081222234948.776edb1b@tuxicoman.be> <20081225080606.GA11032@colo.lackof.org> <20081225165750.29c5974c@bleh.bxl.tuxicoman.be> <20081225213625.GA7716@colo.lackof.org> <20090102214644.1d3a7364@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Kyle McMartin <kyle@infradead.org>,
	linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090102214644.1d3a7364@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 02, 2009 at 09:46:44PM +0100, Guy Martin wrote:
> OS HPMC handler length needs to be in bytes, not in words.
> Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>
> 
> -	length = os_hpmc_end - os_hpmc;
> +	length = (os_hpmc_end - os_hpmc) * sizeof(u32);
>  	ivap[7] = length;

Ick. I wonder if I screwed that up when I fixed the function descriptor
breakage...

Will apply this fix, thanks Guy.

cheers, Kyle
