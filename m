Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA18224
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Oct 2000 09:10:48 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 24 Oct 2000 15:12:17 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13o5kI-0005Pc-00; Tue, 24 Oct 2000 16:12:10 +0100
Date: Tue, 24 Oct 2000 16:12:10 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Jim Buttafuoco <jim@buttafuoco.org>
Cc: PARISC-LINUX Mailing List <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Boot problems with CD image
Message-ID: <20001024161210.A20237@parcelfarce.linux.theplanet.co.uk>
References: <39F4D2D9.3646D1@buttafuoco.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <39F4D2D9.3646D1@buttafuoco.org>; from jim@buttafuoco.org on Mon, Oct 23, 2000 at 08:07:53PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 23, 2000 at 08:07:53PM -0400, Jim Buttafuoco wrote:
> Hi,
> 
>     I downloaded the CD image from the FTP site in order to boot my 710
> system.  It failed, attached is the output from the serial port.

iirc, this is a known bug in the version of the parallel port code
which was built for the image.  there's certainly something about it in
the archives.  you'll need to build a new kernel for this machine.

-- 
Revolutions do not require corporate support.
