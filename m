Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA15512
	for <parisc-linux@puffin.external.hp.com>; Thu, 23 Dec 1999 09:12:59 -0700
Date: Thu, 23 Dec 1999 11:15:27 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: bkatz@agilent.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] How to set serial console on 712 (fwd)
Message-ID: <19991223111527.L12629@thepuffingroup.com>
References: <199912231545.HAA07557@meow.sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199912231545.HAA07557@meow.sr.hp.com>; from Bill Katz William" on Thu, Dec 23, 1999 at 07:45:00AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 23, 1999 at 07:45:00AM -0800, Bill Katz William" wrote:
> |How do I set the console on my 712 to be the serial port, not the graphics
> |display?
> |
> |Thanks
> |
> 
> Boot to ISL and use the conspath
> command to change the console back to rs232.  The command to use is:
> 
> serial
>         conspath 2/0/4.643
> graphics
>         conspath 1/0/0.0

This contradicts the PA-RISC Booting HOWTO:

-----

3.1.2.3.3. How can I change the boot console to serial on a 712?

Unfortunately, you can't. Although 712s are configured for in-house HP
development to use serial console, this configuration isn't supported
in the field. You have to use a graphics console for 712s.

-----

I'd like to know if this needs to be corrected.
