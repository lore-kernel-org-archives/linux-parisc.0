Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA16431
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 13:39:53 -0700
Content-Type: text/plain;
  charset="us-ascii"
From: Helge Deller <deller@gmx.de>
To: Thomas Marteau <marteaut@esiee.fr>
Subject: Re: [parisc-linux] Mouse driver for PS/2
Date: Tue, 28 Nov 2000 21:41:53 +0100
Cc: Puffin Group <parisc-linux@thepuffingroup.com>
References: <3A22C48D.F5F85405@esiee.fr> <00112818213403.13860@P100> <3A2407D6.49E5701@esiee.fr>
In-Reply-To: <3A2407D6.49E5701@esiee.fr>
MIME-Version: 1.0
Message-Id: <00112821415306.13860@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Tuesday 28 November 2000 20:30, Thomas Marteau wrote:
> Hi all,

Hi Thomas,

>
> 	We have a sample of code for the mouse driver. But, we would like to
> know how the Puffin would like the implementation of the driver. Because
> of drag & drop..., do you want two different interrupt functions or a
> single that does a redirection. Also , we have seen that busmouse.c is
> quite interesting for our driver. Do we make a copy and call it
> hp_mouse.c?

I would propose, that you check in hp_mouse.c and use different interrupt 
functions for now. Changing it later shouldn't be too difficult.

Greetings,
	Helge.  

>
> Thanks for your answer,
> ESIEE Team
> For a better future with a mouse!
