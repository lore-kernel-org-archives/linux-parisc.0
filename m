Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA08491
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 17:06:24 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 3 Nov 2000 00:08:07 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13rUOs-0003xh-00; Fri, 03 Nov 2000 00:08:06 +0000
Date: Fri, 3 Nov 2000 00:08:06 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: =?iso-8859-1?Q?Alexander_Sch=F6ck?= <headcrusher@web.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Help!?
Message-ID: <20001103000806.A15106@parcelfarce.linux.theplanet.co.uk>
References: <200011021858.TAA28230@mailgate3.cinetic.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <200011021858.TAA28230@mailgate3.cinetic.de>; from headcrusher@web.de on Thu, Nov 02, 2000 at 07:58:51PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 02, 2000 at 07:58:51PM +0100,  Alexander Schöck  wrote:
> How can I go on with the installation?

question added to the FAQ:

7. I'm using the Alpha 0.1 release CD and the machine stops after printing 
     request_irq(259, c01ec76c, 0x0, asp, c3rcd080)
   what's going on? 

This is a bug in the kernel shipped on the CD. It only affects certain
machines and has been fixed in the current CVS tree. We recommend you
acquire a newer kernel from the FTP site.

-- 
Revolutions do not require corporate support.
