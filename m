Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: willy@debian.org
Cc: parisc-linux@lists.parisc-linux.org, jes@wildopensource.com
Subject: Re: [parisc-linux] 2.4.18-pa62 acenic-0.91 
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Sat, 03 Aug 2002 20:58:04 MDT." <20020804025804.3FE6C483E@dsl2.external.hp.com>
References: <20020804011707.2B9164860@dsl2.external.hp.com> <20020804020348.23C414860@dsl2.external.hp.com>  <20020804025804.3FE6C483E@dsl2.external.hp.com> 
Date: Sun, 04 Aug 2002 01:14:06 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020804071406.8D26F4831@dsl2.external.hp.com>
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

Grant Grundler wrote:
> Privately, Mathew Wilcox observed cli() is an obsolete interface
> and doesn't scale well on SMP boxes.

Matthew,
*sigh*. I looked at the code and it uses __cli() (not cli()).
On parisc thats equivalent to local_irq_disable().
Should Jes be using local_irq_disable() directly?

thanks,
grant
