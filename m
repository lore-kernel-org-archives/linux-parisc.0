From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] PARISC: includecheck fix: signal.c
Date: Wed, 23 Sep 2009 15:54:25 -0400
Message-ID: <20090923195424.GH11961@bombadil.infradead.org>
References: <1253626532.3784.17.camel@ht.satnam>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
To: Jaswinder Singh Rajput <jaswinder@kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1253626532.3784.17.camel@ht.satnam>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 22, 2009 at 07:05:32PM +0530, Jaswinder Singh Rajput wrote:
> 
> fix the following 'make includecheck' warning:
> 
>   arch/parisc/kernel/signal.c: linux/compat.h is included more than once.
> 
> Signed-off-by: Jaswinder Singh Rajput <jaswinderrajput@gmail.com>

Applied, thanks.
