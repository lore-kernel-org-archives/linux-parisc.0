Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78DD448D1
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 10:22:57 -0700 (MST)
Date: Tue, 27 Jan 2004 10:22:56 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Naresh Kumar <knaresh@india.hp.com>
Subject: Re: [parisc-linux] error?
Message-ID: <20040127172256.GB28476@colo.lackof.org>
References: <40163368.74DACC64@india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40163368.74DACC64@india.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Jan 27, 2004 at 03:16:16PM +0530, Naresh Kumar wrote:
>    r->end    = p->end;
>    r->flags  = IORESOURCE_MEM;
>    r->parent = r->sibling = r->child = NULL;
>    break;
>    lba_dev->gmmio_base = p->start;
>    break;
> 
>   case PAT_NPIOP:
>     printk(KERN_WARNING MODULE_NAME
>     " range[%d] : ignoring NPIOP (0x%lx)\n",
>     i, p->start);
>    break;
> -------------------------------------------------------------------
> 
> Please note the extra lines after the 'break;'. The version of
> 'lba_pci.c' is 1.7. Seems to have happened due to oversight.

Those are "extra"?
The version of code in linux-2.4 CVS has:
                case PAT_GMMIO:
                        printk(KERN_WARNING MODULE_NAME
                                " range[%d] : ignoring GMMIO (0x%lx)\n",
                                i, p->start);
                        lba_dev->gmmio_base = p->start;
                        break;

The code you quoted is missing the "case PAT_GMMIO" and printk.

thanks,
grant
