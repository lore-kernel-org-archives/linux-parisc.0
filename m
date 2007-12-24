From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: dma_addr_t: which comment is correct?
Date: Mon, 24 Dec 2007 01:51:59 -0700
Message-ID: <20071224085159.GC15161@colo.lackof.org>
References: <476CFFE3.3040102@scarlet.be> <20071223093903.GA30259@colo.lackof.org> <476EE63A.9080807@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <476EE63A.9080807@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Dec 23, 2007 at 10:50:34PM +0000, rubisher wrote:
...
> btw do you notice how much way are there (in so few lines) to use a 
> unsigned 32bits integer: u32, __u32 but also uint32_t, u_int32_t, ...
>
> Is there some advise om the best pratice?

IIRC, Preferred is "u32". But use whatever is consistent with the
file you are editing.

>
> Ah also related to ccio-dma patch test on my c110, it seems that removing 
> DELAYED_RESOURCE_CNT code help a bit this system with few ram (64Mb only) 
> to survive a bit longer (enough to debootstrap and download 800Mb to be 
> installed) but that didn't make the drill: there are still fs corruption 
> from time to time and some reset on the lasi disk ;-(.
> This test just seems to confirm an issue of i/o coherency somewhere but 
> where those rules could be broken???

ISTR Joel Soete reporting problems for CCIO machines as well.
Offhand, I don't know what's wrong and we depend on Ryan Bradetich
and other volunteers to track that down. 

cheers,
grant

>
> Merry Xmas,
> 	r.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
