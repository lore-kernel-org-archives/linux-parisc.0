Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA28744
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 08:49:51 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 23 Jan 2001 15:53:43 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6578BB005; Tue, 23 Jan 2001 15:43:58 +0000 (GMT)
Date: Tue, 23 Jan 2001 15:43:58 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] parisc64 kernel and ret1 (gr29) setup
Message-ID: <20010123154358.Y3571@linuxcare.com>
References: <20010123134545.W3571@linuxcare.com> <Pine.LNX.4.21.0101240116440.29059-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0101240116440.29059-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Wed, Jan 24, 2001 at 01:20:34AM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 24, 2001 at 01:20:34AM +1100, Alan Modra wrote:
> Is there any code elsewhere that "knows" the stack frame is 64 bytes
> (except for gdb and signal handler frames)?

I don't know of any; the kernel still boots ok with my changes, so
it looks promising.  I'll play a bit more before I commit anything.

Thanks,
  Richard
