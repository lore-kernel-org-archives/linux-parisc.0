Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA05049
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 11:43:21 -0700
Received: from user-78-203.jakinternet.co.uk (HELO rhirst.linuxcare.com) (194.88.78.203)
  by mailserv2.iuinc.com with SMTP; 4 Dec 2000 18:45:54 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C9F82B005; Mon,  4 Dec 2000 18:41:25 +0000 (GMT)
Date: Mon, 4 Dec 2000 18:41:25 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: pa reload problem
Message-ID: <20001204184125.L7166@linuxcare.com>
References: <Pine.LNX.4.21.0012021932030.21742-100000@front.linuxcare.com.au> <Pine.LNX.4.21.0012041223530.13095-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0012041223530.13095-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Mon, Dec 04, 2000 at 12:41:29PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Dec 04, 2000 at 12:41:29PM +1100, Alan Modra wrote:
> I've applied this patch to pehc CVS to fix an hppa64 gcc problem that
> Richard found when compiling modules for the 64-bit kernel.  It's not
> specific to modules, but rather can affect anything requiring stubs to
> call functions, eg. 64-bit userland linked to shared libs.

And it works :-)  I can now insmod sym53c8xx.o on the A500 successfully.

Many thanks,
  Richard
