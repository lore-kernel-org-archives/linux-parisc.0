Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA24522
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 16:49:34 -0700
Received: from user-78-55.jakinternet.co.uk (HELO rhirst.linuxcare.com) (194.88.78.55)
  by mailserv2.iuinc.com with SMTP; 6 Dec 2000 23:52:10 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 13494B005; Wed,  6 Dec 2000 23:47:27 +0000 (GMT)
Date: Wed, 6 Dec 2000 23:47:26 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Daniel Engstrom <danne@telia.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SCSI on ASP systems
Message-ID: <20001206234726.C7166@linuxcare.com>
References: <Pine.LNX.4.21.0012070011280.8673-100000@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0012070011280.8673-100000@zaphod.halden.lillfab.se>; from danne@telia.com on Thu, Dec 07, 2000 at 12:23:00AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 07, 2000 at 12:23:00AM +0100, Daniel Engstrom wrote:
> As noted earlier SCSI (sim700) don not work on systems with an ASP. Below
> is some of the error messages I get. It seems to fail on the first write
> command (read commands seem to work). I dont have any idea how the 53c700
> is supposed to work and I cant find any docs on the net. Does anyone on
> the list have any idea?
> 
> /Daniel
> 
> 
> # palo -I \
> > -b boot/iplboot \
> > -k boot/vmlinux /dev/sda

Can you try adding

	sim700=noneg:0xff,nodisc:0xff

to your boot comamnd line and let me know what happens.

If that fails after very little disk activity, you could try

	sim700=noneg:0xff,nodisc:0xff,debug:0x2ff

and send me the (large) debug output.

Looks like oyur disk is disconnecting after an odd number of sectors,
which might be unusual.

Richard
