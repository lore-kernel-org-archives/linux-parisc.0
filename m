Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA06144
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 08:16:08 -0700
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Christoph Plattner <christoph.plattner@alcatel.at>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Server E55 (9000/856) - PDC console
Date: Tue, 30 Jan 2001 16:20:53 +0100
Cc: christoph.plattner@dot.at
References: <3A76C938.E2E13D2B@alcatel.at>
In-Reply-To: <3A76C938.E2E13D2B@alcatel.at>
MIME-Version: 1.0
Message-Id: <01013016205400.01014@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

On Tuesday 30 January 2001 15:01, Christoph Plattner wrote:
> Hello PA-RISC GURUS !
>
> * Is it possible to use the PDC console as system console ?

The PDC-interface misses a function to get interrupts when a key was pressed. 
To get around that problem you would need to poll the whole time, which would 
result in a *very* bad performance.
Instead of using the PDC-console it is much better to get the STI console 
working. I've already begun to rewrite the current STI code from prumpf, 
which you can find under /drivers/video/sti/*.
Currently both - the new and the old STI code - is broken and unfunctional, 
but I will continue to work on it as far as time permits.

Greetings,

	Helge.
