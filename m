Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA25743
	for <parisc-linux@puffin.external.hp.com>; Wed, 4 Oct 2000 10:42:55 -0600
Received: from user33-80.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.33.80)
  by mailserv2.iuinc.com with SMTP; 4 Oct 2000 16:43:52 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id F1613B005; Wed,  4 Oct 2000 17:41:55 +0100 (BST)
Date: Wed, 4 Oct 2000 17:41:55 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ret_from_kernel_thread incomplete
Message-ID: <20001004174155.F27981@linuxcare.com>
References: <20001004155438.D27981@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001004155438.D27981@linuxcare.com>; from rhirst@linuxcare.com on Wed, Oct 04, 2000 at 03:54:38PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 04, 2000 at 03:54:38PM +0100, Richard Hirst wrote:
> Hi,
>   Some scsi drivers create a kernel thread for error handling.  If
> such a driver is build as a module, then when the module is unloaded
> you get something like:
> 
> 10:~# rmmod lasi7xx_mod
> break 0,0: pid=100 command='scsi_eh_0'

Fixed, with Willys help.

Richard
