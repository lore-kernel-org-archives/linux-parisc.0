Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Voodoo3 PCI on C200 experiment pending! 
In-Reply-To: Message from "M. Grabert" <xam@cs.ucc.ie>
   of "Sun, 18 Aug 2002 04:38:50 BST." <Pine.LNX.4.44.0208180419120.1348-100000@sal.ucc.ie>
References: <Pine.LNX.4.44.0208180419120.1348-100000@sal.ucc.ie> 
Date: Sat, 17 Aug 2002 22:59:52 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020818045952.102E84829@dsl2.external.hp.com>
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

"M. Grabert" wrote:
> I recently found a message on the debian-alpha mailing list (this month)
> were some tried to get a Voodoo3 running on a AlphaStation. He succeeded
> by adding 'Option "NoINT10"' to XF86Config, but this didn't work for me.
> This would have been very surprising, since Alpha and HPPA are totally
> different architectures anyway, but who knows ...

The biggest difference between Alpha and parisc is Alpha has weakly ordered
memory. Reminds me of the saying: "My enemy's enemy is my friend"

BTW, ia64 on HP ZX1 doesn't like int10 either.

grant
