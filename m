From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: dma_addr_t: which comment is correct?
Date: Wed, 26 Dec 2007 11:01:26 +0100
Message-ID: <7d01f9f00712260201m55730a62w4d7c5ff2f6937fcd@mail.gmail.com>
References: <476CFFE3.3040102@scarlet.be>
	 <20071223093903.GA30259@colo.lackof.org> <476EE63A.9080807@scarlet.be>
	 <20071224085159.GC15161@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: rubisher <rubisher@scarlet.be>, linux-parisc@vger.kernel.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071224085159.GC15161@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Dec 24, 2007 9:51 AM, Grant Grundler <grundler@parisc-linux.org> wrote:
> On Sun, Dec 23, 2007 at 10:50:34PM +0000, rubisher wrote:
> ...
> > btw do you notice how much way are there (in so few lines) to use a
> > unsigned 32bits integer: u32, __u32 but also uint32_t, u_int32_t, ...
> >
> > Is there some advise om the best pratice?
>
> IIRC, Preferred is "u32". But use whatever is consistent with the
> file you are editing.

IIRC, the __xx variants are to be used for userspace exported headers.
See the comment in include/asm-parisc/types.h

HTH and merry Xmas

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
