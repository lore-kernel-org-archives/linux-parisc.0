Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA17745
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 May 2000 01:53:23 -0600
Received: from ppp-1-157.cvx3.telinco.net (HELO rhirst.linuxcare.com) (@212.1.144.157)
  by mailserv2.iuinc.com with SMTP; 30 May 2000 07:53:48 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1204BB006; Tue, 30 May 2000 08:53:01 +0100 (BST)
Date: Tue, 30 May 2000 08:53:01 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CONFIG_SYSCTL is not set
Message-ID: <20000530085301.H7853@linuxcare.com>
References: <200005300201.TAA11206@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200005300201.TAA11206@milano.cup.hp.com>; from grundler@cup.hp.com on Mon, May 29, 2000 at 07:01:07PM -0700
List-ID: <linux-parisc.vger.kernel.org>

Hi Grant,

You probably already worked this out, but mine builds fine with

CONFIG_SYSCTL=y
# CONFIG_MAGIC_SYSRQ is not set

Richard

On Mon, May 29, 2000 at 07:01:07PM -0700, Grant Grundler wrote:
> With CONFIG_SYSCTL=y, I get a different linker error
> kernel/kernel.o(.data+0x3b4c): undefined reference to `sysrq_enabled'
> 
> (which willy already pointed out...See
> http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/05-May/0103.html)
> 
> This is very reproducible (going back and forth) in my build tree.
> I don't see how willy got around it.
