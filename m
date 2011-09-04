From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Boot failure with 3.0.3: swapper (pid 0): Protection id trap (code 7)
Date: Sat, 3 Sep 2011 21:46:51 -0400
Message-ID: <BLU0-SMTP59F0DC2CD7C525D1524BA7971A0@phx.gbl>
References: <201108191958.35802.eike-kernel@sf-tec.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: "linux-parisc" <linux-parisc@vger.kernel.org>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201108191958.35802.eike-kernel@sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 19-Aug-11, at 1:58 PM, Rolf Eike Beer wrote:

> unwind_init: start = 0x10503000, end = 0x1053a640, entries = 14180
> WARNING: Out of order unwind entry! 105041f0 and 10504200
> WARNING: Out of order unwind entry! 10504200 and 10504210
> WARNING: Out of order unwind entry! 10504cf0 and 10504d00
> WARNING: Out of order unwind entry! 10504d00 and 10504d10

This is fixed in current binutils.  Current binutils also fixes non  
equivalent aliasing
bug that affects PA8800/PA8900 systems.

> IASQ: 00000000 00000000 IAOQ: 1010047c 10100480


IAOQ head provides the location of interruption.  It was a instruction  
memory
protection fault.  Since this is a kernel address, this likely  
indicates the page
tables weren't setup correctly, or the instruction cache wasn't  
flushed correctly.

I'm thinking it would help to localize the change that introduced the
interruption.

Dave
--
John David Anglin	dave.anglin@bell.net



