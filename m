From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: fs/compat_ioctl.c:1651:2: error: bit-field '<anonymous>' width
	not an integer constant
Date: Mon, 18 Jan 2010 10:09:47 -0500
Message-ID: <20100118150947.GU19179@bombadil.infradead.org>
References: <20100118073148.GE28448@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100118073148.GE28448@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jan 18, 2010 at 12:31:48AM -0700, Grant Grundler wrote:
> fs/compat_ioctl.c:1651:2: error: bit-field '<anonymous>' width not an integer constant
><...>
>  ((void)(sizeof(struct { int:-!!(max >= (1 << 16)); })));
><...> 
> I can't make sense of this since I have no clue what "int:-!!" means.
> 

It basically means what the error above says. :) If the expr evaluates
to non-zero, bound it to 1 (ie: !!x = 1, where x > 0) and the negative
sign is to give an invalid field width, so we ftbfs.

Anyway, it's basically checking to see how many elements there are in
the table, and failing if there are more than expected. It looks kind of
failure that these are magic numbers.

regards, Kyle
