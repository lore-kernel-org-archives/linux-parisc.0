Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA12629
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 12:25:29 -0700
Sender: marteaut@esiee.fr
Message-ID: <3A2407D6.49E5701@esiee.fr>
Date: Tue, 28 Nov 2000 20:30:30 +0100
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Helge Deller <deller@gmx.de>
Cc: Puffin Group <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Mouse driver for PS/2
References: <3A22C48D.F5F85405@esiee.fr> <3A23CA18.1171E884@esiee.fr> <00112818213403.13860@P100>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

	We have a sample of code for the mouse driver. But, we would like to
know how the Puffin would like the implementation of the driver. Because
of drag & drop..., do you want two different interrupt functions or a
single that does a redirection. Also , we have seen that busmouse.c is
quite interesting for our driver. Do we make a copy and call it
hp_mouse.c?

Thanks for your answer,
ESIEE Team
For a better future with a mouse!
