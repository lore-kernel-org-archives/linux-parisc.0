From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fix cache flushing in kmap/kunmap API implementation for aio
Date: Tue, 3 Dec 2013 19:35:19 -0500
Message-ID: <BLU0-SMTP902C0BE78FF0A1636E894797D40@phx.gbl>
References: <20131201211832.GA15998@p100.box> <1386115682.2166.125.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1386115682.2166.125.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 3-Dec-13, at 7:08 PM, James Bottomley wrote:

> On Sun, 2013-12-01 at 22:18 +0100, Helge Deller wrote:
>> This is now the next try to fix the aio bug in our kmap/kunmap
>> implementation. It's basically stuff from
>
> I thought the implementation required us to move to coherency  
> management
> in the kmap API?, in which case ...

This is what I've been saying to Helge.

We don't fully understand why we need to flush unconditionally to fix  
the aio bug
in kunmap.  I can see it for coherency and when different non coherent  
caches are
involved (e.g., I & D).  Could this be SMP related?

I think if we understand the kunmap case, we will also understand the  
kmap case.
At the moment, the fix is just based on testing.

Dave
--
John David Anglin	dave.anglin@bell.net



