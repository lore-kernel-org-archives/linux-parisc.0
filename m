Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92B0B482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 13:01:37 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18FJzY-0003Og-00; Fri, 22 Nov 2002 20:01:32 +0000
Date: Fri, 22 Nov 2002 20:01:32 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20021122200132.A29028@parcelfarce.linux.theplanet.co.uk>
References: <20021122055423.B892D482B@dsl2.external.hp.com> <20021122182325.52708482B@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021122182325.52708482B@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Fri, Nov 22, 2002 at 11:23:25AM -0700
Subject: [parisc-linux] Re: [parisc-linux-cvs] DIFF 2.4.20-rc1-pa7
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Nov 22, 2002 at 11:23:25AM -0700, Grant Grundler wrote:
> Index: drivers/net/ppp_generic.c
> ===================================================================
> RCS file: /var/cvs/linux/drivers/net/ppp_generic.c,v
> retrieving revision 1.14
> diff -u -p -r1.14 ppp_generic.c
> --- drivers/net/ppp_generic.c	13 Nov 2002 16:57:46 -0000	1.14
> +++ drivers/net/ppp_generic.c	22 Nov 2002 05:53:55 -0000
> @@ -387,9 +387,9 @@ static ssize_t ppp_read(struct file *fil
>  	for (;;) {
>  		set_current_state(TASK_INTERRUPTIBLE);
>  		skb = skb_dequeue(&pf->rq);
> +		ret = 0;
>  		if (skb)
>  			break;
> -		ret = 0;
>  		if (pf->dead)
>  			break;
>  		ret = -EAGAIN;

Uhh.. why have you made this change?  It's clearly wrong and diverges
from upstream.

-- 
Revolutions do not require corporate support.
