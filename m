Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 16 Dec 2002 16:47:01 -0700
To: Joel Soete <joel.soete@freebel.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Is this system_irqsave diff is correct?
Message-ID: <20021216234701.GE854@dsl2.external.hp.com>
References: <3DFC7EFA.9040708@freebel.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DFC7EFA.9040708@freebel.net>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Sun, Dec 15, 2002 at 01:09:14PM +0000, Joel Soete wrote:
> is this  diff is right:
> -#define local_irq_restore(x) \
> -       __asm__ __volatile__("mtsm %0" : : "r" (x) : "memory" )
> +#define local_irq_restore(x) __restore_flags(x)

Yes - those seem the be the same.

grant
