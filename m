Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA03260
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Dec 2000 08:46:49 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 23 Dec 2000 15:49:53 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 149qvf-0005ke-00; Sat, 23 Dec 2000 15:49:51 +0000
Date: Sat, 23 Dec 2000 15:49:51 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Jens Trzaska <j_trzaska@gmx.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] trouble booting from palinux-0.5.iso on 712/80
Message-ID: <20001223154951.B20418@parcelfarce.linux.theplanet.co.uk>
References: <3A44C147.B56F25CA@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A44C147.B56F25CA@gmx.net>; from j_trzaska@gmx.net on Sat, Dec 23, 2000 at 04:14:15PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Dec 23, 2000 at 04:14:15PM +0100, Jens Trzaska wrote:
> Hello!
> Since yesterday i'm the owner of a HP 712/80 and i've searched along 
> the net to find an OS which is able to run on this box. When i found
> palinux i downloaded the palinux-0.5.iso. But the booting process
> doesn't seem to be successful. In the readme it says that i should
> get a login prompt...but i don't get the prompt. The system stops
> when saying:
> "Switching from PDC console"

This ought to be, but isn't, in the FAQ.  Could someone who knows more about
the 0.5 CD-ROM than I do write up the answer for the FAQ?

Basically, your kernel is using the wrong console device.  try editing the
command line to specify `console=tty0'.

-- 
Revolutions do not require corporate support.
