Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA14862
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Jan 2001 13:28:23 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 18 Jan 2001 20:32:08 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14JLJX-0001f9-00; Thu, 18 Jan 2001 20:05:43 +0000
Date: Thu, 18 Jan 2001 20:05:43 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] The Art Of Locking
Message-ID: <20010118200543.G29531@parcelfarce.linux.theplanet.co.uk>
References: <20010118192452.E29531@parcelfarce.linux.theplanet.co.uk> <200101181959.LAA14539@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101181959.LAA14539@milano.cup.hp.com>; from grundler@cup.hp.com on Thu, Jan 18, 2001 at 11:59:14AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 18, 2001 at 11:59:14AM -0800, Grant Grundler wrote:
> > Finally, it's not declared `static', yet it's only used within this file.
> 
> It's used in:
>     fs/proc/proc_misc.c:extern int get_irq_list(char *);
>     fs/proc/proc_misc.c:  int len = get_irq_list(page);

I'm sorry for being ambiguous.  I meant that the spin_lock should be
static, not the function.

-- 
Revolutions do not require corporate support.
