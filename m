Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA15127
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 10:26:39 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 24 Jan 2001 17:30:29 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14LTMv-0004hE-00; Wed, 24 Jan 2001 17:06:01 +0000
Date: Wed, 24 Jan 2001 17:06:01 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Christoph Plattner <christoph.plattner@alcatel.at>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] One more step: Interruption (trap) 18 on 9000/720
Message-ID: <20010124170601.C4836@parcelfarce.linux.theplanet.co.uk>
References: <3A6EA64B.5875D07A@alcatel.at> <200101241650.IAA20897@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101241650.IAA20897@milano.cup.hp.com>; from grundler@cup.hp.com on Wed, Jan 24, 2001 at 08:50:12AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 24, 2001 at 08:50:12AM -0800, Grant Grundler wrote:
> There is no kernel debugger (yet). I started working on one last year
> based on "KWDB" from HPUX. I've added the kernel hooks (CONFIG_KWDB).
> But I (a) didn't get it working and (b) didn't get permission to publish
> the KWDB base. My advice is for someone to take the SGI KDB and make it
> work for parisc-linux and changing CONFIG_KWDB to CONFIG_KDB.

FYI, after my PA-RISC talk at linux.conf.au, Keith Owens expressed
interest in porting KDB to Linux/PARISC.  He's on holiday just now but
he'll investigate further after he gets back.

Grant, do you think it'd be worth removing the KWDB bits?

-- 
Revolutions do not require corporate support.
