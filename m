Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD2974868
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Jan 2004 18:50:08 -0700 (MST)
Date: Mon, 19 Jan 2004 18:50:07 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] printk cleanup
Message-ID: <20040120015007.GA5088@colo.lackof.org>
References: <3FEDC568.30006@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FEDC568.30006@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Dec 27, 2003 at 05:46:16PM +0000, Joel Soete wrote:
> -		panic(__FILE__ ": pcxl_alloc_range() Too many pages to 
> map.\n");
> +		panic("%s: pcxl_alloc_range() Too many pages to map.\n",
> +		      __FILE__);

thanks - I applied this patch (plus correction in pci.h)

grant
