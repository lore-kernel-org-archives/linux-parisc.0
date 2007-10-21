From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] [PATCH] VSC_GSC_HSC bus debugging
Date: Sun, 21 Oct 2007 13:06:09 -0600
Message-ID: <20071021190609.GA8421__10149.6737720028$1416624647$gmane$org@parisc-linux.org>
References: <471B926D.10009@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: kernel-janitors@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: Roel Kluin <12o3l@tiscali.nl>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <471B926D.10009@tiscali.nl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Oct 21, 2007 at 07:54:53PM +0200, Roel Kluin wrote:
> +config GSC_DEBUG
> +	bool "VSC_GSC_HSC bus debugging"

What an ugly prompt string ...

> +	depends on GSC
> +	default n

default is 'n', by default.  No need to specify it.

> +#ifdef GSC_DEBUG
> +	#define DEBUG 1
> +#endif

Why the indent?

> -	DEBPRINTK("%s intr, mask=0x%x\n", gsc_asic->name, irr);
> +	printk("%s intr, mask=0x%x\n", gsc_asic->name, irr);

Presumably you meant pr_debug?

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
