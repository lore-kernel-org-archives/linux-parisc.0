Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA10153
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 08:06:20 -0700
Received: from ottawa.linuxcare.com (HELO localhost.linuxcare.com) (@216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 25 Jan 2001 15:10:09 -0000
Received: by localhost.linuxcare.com (Postfix, from userid 501)
	id 2B8162B1; Thu, 25 Jan 2001 11:11:19 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by localhost.linuxcare.com (Postfix) with ESMTP
	id C56B3AB70; Thu, 25 Jan 2001 11:11:19 -0800 (PST)
Date: Thu, 25 Jan 2001 11:11:19 -0800 (PST)
From: dkennedy <dkennedy@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CPU detection wrong
In-Reply-To: <20010125145244.C25242@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0101251110190.3746-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 25 Jan 2001, Matthew Wilcox wrote:

> 
> we have the following entry in hardware.c:
> 
>         { 0x05c0, 0x0fc0, pcxw   },  /* 0x05c0 - 0x05ff */
> 
> however, 5d5 is a pcxw+ (pa8600).  I don't know enough to change this
> because i don't have a list of which ids are assigned.  I know this
> information is available within linuxcare because i remember going over
> this with dave kennedy at one point.  i don't have that information any
> more though, so i can't fix this myself.

I will modify hardware.c and the hardware database to accomodate this 
change.  I will be doing that next week sometime.

Thank you.

If anyone else has any other changes to the CPU detection code please let me
know.

-- 
David Kennedy, Technical Account Manager, Linuxcare, Inc.
613.562.9594 tel, 613.562.9304 fax
dkennedy@linuxcare.com, http://www.linuxcare.com/
Linuxcare.  Support for the revolution.
