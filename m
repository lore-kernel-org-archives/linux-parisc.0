Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA12698
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 04:21:15 -0700
Received: from user-140-143.jakinternet.co.uk (HELO rhirst.linuxcare.com) (212.187.140.143)
  by mailserv2.iuinc.com with SMTP; 30 Nov 2000 11:23:38 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6EEDCB007; Thu, 30 Nov 2000 11:19:30 +0000 (GMT)
Date: Thu, 30 Nov 2000 11:19:30 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "Jorge L. deLyra" <delyra@latt.if.usp.br>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com,
        assirati@socrates.if.usp.br
Subject: Re: [parisc-linux] HP 9000/735-125
Message-ID: <20001130111930.E22285@linuxcare.com>
References: <200011292319.PAA28547@milano.cup.hp.com> <Pine.LNX.3.96.1001130085232.14082B-100000@latt.if.usp.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.3.96.1001130085232.14082B-100000@latt.if.usp.br>; from delyra@latt.if.usp.br on Thu, Nov 30, 2000 at 08:58:22AM -0200
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 30, 2000 at 08:58:22AM -0200, Jorge L. deLyra wrote:
> OK, here goes. I want to congratulate you all on this effort. We have five
> of these HP-9000 stations here, quite old by now. They used to be our main
> number crunching force. They are wonderfully built hardware in bad need of
> a wonderful system on them!  |:-)

> Serial driver version 5.01 (2000-05-29) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
> 
> Dumping Stack from c4f9c000 to c4f9cbc0:

This has been reported on 715/50 (Robert Duncan) and 715/75 (me) round
about November 15th.  At the time I tried a current cvs kernel on my
715/75 and it was even worse (IIRC).  I'll have another look at it.

Richard
