Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA31707
	for <parisc-linux@puffin.external.hp.com>; Fri, 29 Oct 1999 11:37:08 -0600
Sender: frowand@cup.hp.com
Message-ID: <3819DB18.AC3F55CC@hp.com>
Date: Fri, 29 Oct 1999 10:36:24 -0700
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Alex deVries <adevries@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting on PA2.0 machines
References: <Pine.LNX.4.10.9910290054070.3734-100000@vodka.thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> So I think we've determined that PA2.0 booting problems are related to the
> PDC_BTLB call which isn't implemented in 2.0 processors.
> 
> My thought would be to try such a call, and if it fails, then configure
> cache lines in a way specific to 2.0 processors.  Am I right?

If the system is a PA 1.1 system then PDC_BLOCK_TLB() should be used.
(PDC_MODEL(Return info), arch_rev reports 1.0, 1.1, or 2.0.)  If the
system is a PA 2.0 system then large pages should be specified in the
TLB entries.

> How should we be configuring this?

Just wait for a TLB miss and insert an entry for a very large number of pages
(architected sizes include 4, 16, 64, 256 Kbyte, 1, 4, 16, 64 Mbyte).  See
the PA-RISC 2.0 Architecture book by Kane, pp. 3-9 thru 3-14, F-1 thru F-5.

Just as a side note, you can't just insert a block TLB entry and expect it to
exist forever; you have to be able to handle a TLB fault for the address
range and re-insert the entry (or switch to normal entries).  See the last
page of the PDC_BLOCK_TLB() description for the explanation of this.

> We've now got some puffins and HP people with 2.0 boxes, so it'd be really
> nice to get these boxes booting.
> 
> - Alex

You've just hit the first layer of the onion.

-Frank
