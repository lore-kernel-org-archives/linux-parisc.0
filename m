Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA10838
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 06:49:38 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 24 Jan 2001 13:53:32 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14LQMU-0001Qy-00; Wed, 24 Jan 2001 13:53:22 +0000
Date: Wed, 24 Jan 2001 13:53:22 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Christoph Plattner <christoph.plattner@alcatel.at>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] parisc vs. parisc64
Message-ID: <20010124135322.A4836@parcelfarce.linux.theplanet.co.uk>
References: <3A6E9471.BB5A67EF@alcatel.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A6E9471.BB5A67EF@alcatel.at>; from christoph.plattner@alcatel.at on Wed, Jan 24, 2001 at 09:38:09AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 24, 2001 at 09:38:09AM +0100, Christoph Plattner wrote:
> Hello !
> 
> I have to problem to decide between parisc and parisc64.
> How can I find out, what I have to take on a
> Series 700 or 800 machine.

parisc64 is for the 64-bit processors _only_.  Note that most 64-bit
processors will also run a 32-bit kernel.  The only machines which need to
run a 64-bit kernel are those which have PAT PDC -- ie L class and A500.

-- 
Revolutions do not require corporate support.
