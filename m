Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA20142
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Dec 2000 08:11:19 -0700
Received: from user-221-137.jakinternet.co.uk (HELO rhirst.linuxcare.com) (212.187.221.137)
  by mailserv2.iuinc.com with SMTP; 1 Dec 2000 15:13:48 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 70D9CB007; Fri,  1 Dec 2000 15:09:43 +0000 (GMT)
Date: Fri, 1 Dec 2000 15:09:43 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Kai Walter <KaiW@intec-ag.com>
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] 715/33 hangs after request_irq(259,c01ecbec, 0x0, asp, c0fee080)
Message-ID: <20001201150943.C7166@linuxcare.com>
References: <D0F134B21994D111A2320800097DCB2C9E0B28@hermes.intec-is.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <D0F134B21994D111A2320800097DCB2C9E0B28@hermes.intec-is.com>; from KaiW@intec-ag.com on Fri, Dec 01, 2000 at 03:02:51PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Dec 01, 2000 at 03:02:51PM +0100, Kai Walter wrote:
> Hi
>  
> got our 715/33 up with rbootd and Image-20000803. After the
> "request_irq(259,c01ecbec, 0x0, asp, c0fee080)" it stops booting/responding.
> Should I have a special Image for this machine ?

You probably need a new kernel.  There was a problem with the ASP
parallel port driver on older machines.  I believe it is fixed now.

Richard
