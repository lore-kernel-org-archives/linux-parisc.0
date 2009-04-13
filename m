From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc: decode_exc.c should include kernel.h
Date: Mon, 13 Apr 2009 10:44:16 -0400
Message-ID: <20090413144416.GB6072@bombadil.infradead.org>
References: <a4423d670904060229l650519e8we17578f4b439a1cb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670904060229l650519e8we17578f4b439a1cb@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Apr 06, 2009 at 01:29:58PM +0400, Alexander Beregalov wrote:
> Fix this build error:
> arch/parisc/math-emu/decode_exc.c:351: undefined reference to `printk'
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
>

Thanks, applied.
