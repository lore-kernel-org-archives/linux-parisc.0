Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A8D54A18
	for <parisc-linux@lists.parisc-linux.org>; Wed, 31 Jan 2001 11:04:24 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA12270
	for <parisc-linux@puffin.external.hp.com>; Wed, 31 Jan 2001 11:00:17 -0700
Sender: plattner@dns2.dot.at
Message-ID: <3A785392.9BBAB841@dot.at>
Date: Wed, 31 Jan 2001 19:04:02 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Helge Deller <deller@gmx.de>
Cc: Christoph Plattner <christoph.plattner@alcatel.at>,
	parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Server E55 (9000/856) - PDC console
References: <3A76C938.E2E13D2B@alcatel.at> <01013016205400.01014@P100.helgenet.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Thanks for the answer, but ...

... the E55 server has no STI or similar console. Only as serial one !
And this serial console is on the 8-port serial multiplexer board,
and I miss a driver for that (same for SCSI !) on the E55 (9000/856).

So the only chance is the use of PDC console for the first step.
And as my experience shows on a PC with 8-port serial board, it is
not a problem to poll in 20-25ms cycles, which is enough for serial
console operation and is not a performace problem....

With friendly regards

	Christoph


Helge Deller wrote:
> 
> On Tuesday 30 January 2001 15:01, Christoph Plattner wrote:
> > Hello PA-RISC GURUS !
> >
> > * Is it possible to use the PDC console as system console ?
> 
> The PDC-interface misses a function to get interrupts when a key was pressed.
> To get around that problem you would need to poll the whole time, which would
> result in a *very* bad performance.
> Instead of using the PDC-console it is much better to get the STI console
> working. I've already begun to rewrite the current STI code from prumpf,
> which you can find under /drivers/video/sti/*.
> Currently both - the new and the old STI code - is broken and unfunctional,
> but I will continue to work on it as far as time permits.
> 
> Greetings,
> 
>         Helge.
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
