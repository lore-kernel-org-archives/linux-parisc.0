From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: parisc: fix io accessors for generic byteorder.h
Date: Sun, 07 Dec 2008 20:55:59 -0800
Message-ID: <1228712159.5998.2.camel@brick>
References: <20081208044317.GB9092@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081208044317.GB9092@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2008-12-07 at 23:43 -0500, Kyle McMartin wrote:
> These were using __fswabX which is marooned in <linux/byteorder/swab.h>
> instead we'll just use the __arch_swabX defines from <asm/byteorder.h>
> 

Sorry I missed this usage :-/

Any reason not to just use __swab16 __swab32 __swab64?  I'd like to keep
the __arch helpers confined to swab.h only.

Cheers,

Harvey

