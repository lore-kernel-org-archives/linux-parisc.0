Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA11237
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 09:24:24 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 25 Jan 2001 16:28:19 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (@216.208.98.2)
  by smtp.linuxcare.com with SMTP; 25 Jan 2001 16:28:20 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A705578.E0FDC04C@linuxcare.com>
Date: Thu, 25 Jan 2001 11:34:00 -0500
From: Alex deVries <alex@linuxcare.com>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CPU detection wrong
References: <20010125145244.C25242@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> we have the following entry in hardware.c:
>         { 0x05c0, 0x0fc0, pcxw   },  /* 0x05c0 - 0x05ff */
> however, 5d5 is a pcxw+ (pa8600).  

I remember when we were writing this that it was very difficult to
figure some of these things out, because of missing or conflicting
information.  I don't actually think that there's any information in
here that isn't available publically, like ver_nums.pdf.

I know I've never seen a concise and complete list of CPUs and IDs.

I seem to recall some of the lists not covering some of the newer
CPUs...

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
