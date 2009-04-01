From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH next] parisc: asm/pdc.h should include asm/page.h
Date: Wed, 1 Apr 2009 11:01:15 -0400
Message-ID: <20090401150115.GA1443@bombadil.infradead.org>
References: <a4423d670904010244q1cfbce88qaa635d8e4070db07@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	linux-parisc@vger.kernel.org, kyle@mcmartin.ca
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <a4423d670904010244q1cfbce88qaa635d8e4070db07@mail.gmail.com>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Apr 01, 2009 at 01:44:08PM +0400, Alexander Beregalov wrote:
> Fixes this build error:
> arch/parisc/kernel/pdc_cons.c:117: error: '__PAGE_OFFSET' undeclared
> (first use in this function)
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

Huh. Nice. More patches to arch/parisc that didn't go through me that
break things.

Applied, thanks again Alexander.

cheers, Kyle
