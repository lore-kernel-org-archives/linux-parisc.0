From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] Re: [PATCH][2.5.53] Memory leak in drivers/video/console/sticore.c
Date: Sun, 5 Jan 2003 15:06:46 +0000
Message-ID: <20030105150646.H19239__11837.2365403504$1416622073$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.33.0212282311540.268-100000@pablo.menichini.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kernel-janitor-discuss@lists.sourceforge.net,
	Trivial Patch Monkey <trivial@rustcorp.com.au>,
	parisc-linux@parisc-linux.org
To: Pablo Menichini <pablo@menichini.com.ar>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <Pine.LNX.4.33.0212282311540.268-100000@pablo.menichini.com.ar>; from pablo@menichini.com.ar on Sat, Dec 28, 2002 at 11:14:52PM -0300
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, Dec 28, 2002 at 11:14:52PM -0300, Pablo Menichini wrote:
> This patch tries to fix the memory leak in function sti_init_glob_cfg.

sticore is somewhat out of date in Linus' tree -- probably better to
ignore drivers/video for cleanup work at the moment as there's some big
reworks in progress.  Even so, this patch is still mostly relevant --
I'll redo it in the PA-RISC tree shortly.  Thanks.

> --- linux-2.5.53/drivers/video/console/sticore.c	Sat Dec 28 18:39:32 2002
> +++ linux-local/drivers/video/console/sticore.c	Sat Dec 28 18:51:04 2002
> @@ -376,8 +376,17 @@
>  	save_addr = kmalloc(1024 /*XXX*/, GFP_KERNEL);
>  	sti_mem_addr = kmalloc(1024, GFP_KERNEL);
> 
> -	if((!glob_cfg) || (!glob_cfg_ext) || (!save_addr) || (!sti_mem_addr))
> +	if((!glob_cfg) || (!glob_cfg_ext) || (!save_addr) || (!sti_mem_addr)){
> +		if(glob_cfg)
> +			kfree(glob_cfg);
> +		if(glob_cfg_ext)
> +			kfree(glob_cfg_ext);
> +		if(save_addr)
> +			kfree(save_addr);
> +		if(sti_mem_addr)
> +			kfree(sti_mem_addr);
>  		return;
> +	}
> 
>  	memset(glob_cfg, 0, sizeof *glob_cfg);
>  	memset(glob_cfg_ext, 0, sizeof *glob_cfg_ext);

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
