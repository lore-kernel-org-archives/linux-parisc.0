From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: can't find a register in class 'R1_REGS' while reloading 'asm'
Date: Sat, 6 Feb 2010 19:23:35 -0500
Message-ID: <20100207002335.GP24051@bombadil.infradead.org>
References: <20091207223548.GA4515@raptus.dandreoli.com> <20091208012627.1D22C4FE3@hiauly1.hia.nrc.ca> <20091208030114.GA12872@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Domenico Andreoli <cavokz@gmail.com>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091208030114.GA12872@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 07, 2009 at 10:01:14PM -0500, John David Anglin wrote:
> -	volatile unsigned int *a;
> +	volatile register unsigned int *a asm ("r20") = __ldcw_align(x);
>  

I'm reticent about moving the assignment around the mb(), should I edit
this to return the assignment and apply, or apply as is?

regards, Kyle
