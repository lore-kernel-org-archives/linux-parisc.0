Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA09510
	for <parisc-linux@puffin.external.hp.com>; Wed, 25 Oct 2000 16:00:43 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 25 Oct 2000 22:02:12 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13oYPY-0005fb-00; Wed, 25 Oct 2000 22:48:40 +0100
Date: Wed, 25 Oct 2000 22:48:40 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Kailashnath V Rampure <kailasr@webcash.com>
Cc: grundler@cup.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux]
Message-ID: <20001025224840.B21190@parcelfarce.linux.theplanet.co.uk>
References: <5.0.0.25.0.20001025135117.00a4beb0@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.0.0.25.0.20001025135117.00a4beb0@mail.webcash.com>; from kailasr@webcash.com on Wed, Oct 25, 2000 at 02:00:42PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 25, 2000 at 02:00:42PM -0700, Kailashnath V Rampure wrote:
> Hi,
> 
> I am building Linux for HP PA-RISC on Redhat linux. When I give " make 
> LANGUAGES=c" for gcc I get the following error can any one help me. I need 
> to install Linux on HP A class server. The server does not have a cdrom device.
> make[2]: hppa-linux-ar: Command not found

you either haven't built and installed binutils, or it isn't in your PATH.
Are you trying to follow the recipe?

-- 
Revolutions do not require corporate support.
