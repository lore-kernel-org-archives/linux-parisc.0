Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA04763
	for <parisc-linux@puffin.external.hp.com>; Mon, 25 Sep 2000 03:01:59 -0600
Received: from user32-185.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.32.185)
  by mailserv2.iuinc.com with SMTP; 25 Sep 2000 09:02:43 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 8F479B007; Mon, 25 Sep 2000 10:01:45 +0100 (BST)
Date: Mon, 25 Sep 2000 10:01:45 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: David Huggins-Daines <dhd@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Big bad SCSI errors building GCC with / on SCSI
Message-ID: <20000925100145.G32318@linuxcare.com>
References: <87og1gm0ln.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87og1gm0ln.fsf@linuxcare.com>; from dhd@linuxcare.com on Fri, Sep 22, 2000 at 08:08:20PM -0400
List-ID: <linux-parisc.vger.kernel.org>

Hi Dave,

On Fri, Sep 22, 2000 at 08:08:20PM -0400, David Huggins-Daines wrote:
> Hi,
> 
> When trying to build GCC on a SCSI disk (with a root filesystem on
> SCSI) I get a lot of horrible looking errors and the build fails.

I'm currently testing a new version of sim700.c which might help you.
I hope to commit it later today.

Richard
