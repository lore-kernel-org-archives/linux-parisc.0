Return-Path: <akpm@osdl.org>
Received: from mail.osdl.org (fw.osdl.org [65.172.181.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE8E14840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 30 Dec 2003 14:41:57 -0700 (MST)
Date: Tue, 30 Dec 2003 13:42:16 -0800
From: Andrew Morton <akpm@osdl.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Message-Id: <20031230134216.2011c0c1.akpm@osdl.org>
In-Reply-To: <1072815300.2839.30.camel@mulgrave>
References: <1072815300.2839.30.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org, corbet@lwn.net
Subject: [parisc-linux] Re: Fix for uninitialised variable in new seq_file
 code for arch/parisc/ikernel/rq.c
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

James Bottomley <James.Bottomley@SteelEye.com> wrote:
>
> --- 1.20/arch/parisc/kernel/irq.c	Mon Dec 29 15:37:39 2003
> +++ edited/irq.c	Tue Dec 30 14:12:43 2003
> @@ -215,7 +215,7 @@
>  int show_interrupts(struct seq_file *p, void *v)
>  {
>  #ifdef CONFIG_PROC_FS
> -	unsigned int regnr = *(loff_t *) v, i;
> +	unsigned int regnr = *(loff_t *) v, i = 0;
>  
>  	if (regnr == 0) {
>  		seq_puts(p, "     ");

Thanks, I'll add that to today's batch.
