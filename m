Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from methlab.23.org (23.org [209.25.5.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85F20482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Jun 2001 12:25:33 -0600 (MDT)
Date: Wed, 13 Jun 2001 11:27:37 -0700 (PDT)
From: CHS <chs@23.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] New list member..
In-Reply-To: <20010613143442.K16532@linuxcare.com>
Message-ID: <Pine.LNX.4.30.0106131112140.26483-100000@methlab.23.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 13 Jun 2001, Richard Hirst wrote:

> You don't say if you are serial or graphical (sti) console based.
> I certainly wouldn't expect kernel panics "fairly often" with a
> serial console.  For sti console, there are some known issues, for
> example, hitting <escape> in vi tends to crash the kernel.  sti console
> is much less tested than serial also.  The vi problem is fixed in our
> latest kernel source, and you can work round it by changing your terminal
> type (from TERM=linux to TERM=vt100, iirc).

my mistake, I meant to be thorough, honest :)

I'm using the graphical/sti install..

> If you are sti console based then it is painful, but if you could copy
> down the register dump (not the stack dump, most of which will have
> scrolled off the screen), then I might be able to tell you more.
> If you are serial based, you should be able to capture the output
> easily enough.

register dump, ok, I'll try and do that tonight..

I'd try and work with the machine in serial mode, but I don't have the
null modem adapters and gender changers at home neccessary to work with
it. I'll see what I can dig up though..

thanks for the help.

--
AIM: bdsmchs  ---  http://www.23.org/~chs/
------------------------------------------------------------------------
"And the rifle? Wouldn't go out naked of a rifle. When shoes and
clothes and food, when even hope is gone, we'll have the rifle."
	--John Steinbeck
------------------------------------------------------------------------
