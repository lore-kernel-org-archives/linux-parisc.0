Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 5CC2B488E
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  8 Apr 2004 13:20:51 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EISA-Card in 715 /100
Date: Thu, 8 Apr 2004 21:20:45 +0200
References: <40739896.7010600@bluehash.de>
	<1152.192.168.1.54.1081318817.squirrel@www.puszczka.com>
	<20040408170817.GG18329@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20040408170817.GG18329@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200404082120.45305.deller@gmx.de>
Cc: Matthew Wilcox <willy@debian.org>,
	=?iso-8859-1?q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>,
	Andy Walker <ajwalker@broadpark.no>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thursday 08 April 2004 19:08, Matthew Wilcox wrote:
> There are two families of 715; 715/33, /50 and /75 (Scorpio) and 715/64,
> /80, /100 and /100XC (Mirage or Turnip).
> .....
> There is an EISA adapter as a component of Wax, but I believe it's 
> disabled in Mirage boxes.  It's used in GSC-based C and J class boxes
> though.

Just for the record:
My 715/64 is called "Mirage 64" and has a EISA slot.
Until now I only tested successfully an ISA NE2xxx compatible network card 
in it though...

Helge
