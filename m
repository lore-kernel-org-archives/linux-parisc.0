From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PARISC][PATCH] Change cpu_data[] and cpu_devices[] to per_cpu
	variables
Date: Thu, 15 May 2008 09:58:57 -0400
Message-ID: <20080515135857.GH12850@phobos.i.cabal.ca>
References: <200805030002.11151.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200805030002.11151.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 03, 2008 at 12:02:10AM +0200, Helge Deller wrote:
>  config NR_CPUS
> -	int "Maximum number of CPUs (2-32)"
> -	range 2 32
> +	int "Maximum number of CPUs (2-255)"
> +	range 2 255
>  	depends on SMP
>  	default "32"
> +	help
> +	  This allows you to specify the maximum number of CPUs which this
> +	  kernel will support.  The maximum supported value is 255 and the
> +	  minimum value which makes sense is 2.
>  

Er. Why?
