Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA27358
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 07:16:49 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 23 Jan 2001 14:20:40 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id BAA24152;
	Wed, 24 Jan 2001 01:20:34 +1100
Date: Wed, 24 Jan 2001 01:20:34 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] parisc64 kernel and ret1 (gr29) setup
In-Reply-To: <20010123134545.W3571@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0101240116440.29059-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 23 Jan 2001, Richard Hirst wrote:
> 64 bit functions expect r29 to point to a parameter save area.  I've
> made changes in my tree to increase FRAME_SIZE from 64 to 128 bytes on
> 64 bit, and initialise r29 on syscall entry.  I havn't committed it yet.
> I was just going to increase to 80 bytes - 64 bytes save area plus
> 16 for rp and sp - but Willy thought there was a requirement for the
> stack to be 64 byte aligned.

Yup.

> Presumably r29 needs initialising on every call from entry.S and syscall.S
> to C code

Yes, that too.

Is there any code elsewhere that "knows" the stack frame is 64 bytes
(except for gdb and signal handler frames)?

Alan
-- 
Linuxcare.  Support for the Revolution.
