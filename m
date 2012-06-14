From: John David Anglin <dave.anglin@bell.net>
Subject: Re: 3.4.1 fails to boot on Apollo 705 in paging_init
Date: Wed, 13 Jun 2012 21:58:42 -0400
Message-ID: <BLU0-SMTP6A0A2E2D8F8915621C6E297F40@phx.gbl>
References: <e69c1188b0a31ea587fa1faaeb72c712.squirrel@webmail.sf-mail.de> <4FD90286.5040301@gmx.de> <e97c79d800b0513ab9a624af328407a7.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc@vger.kernel.org
To: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <e97c79d800b0513ab9a624af328407a7.squirrel@webmail.sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 13-Jun-12, at 5:27 PM, Rolf Eike Beer wrote:

> I've reported the breakage in 2.6.39 in the cache code here a while  
> ago
> (that's the stuff that recently got some work), afterwards I found no
> kernel that was working.


Can you make sure that the latest set of cache fixes are present?  I'm
fairly certain they are all in 3.4.2.

If that doesn't resolve the crash, could you disassemble the code around
the failing instruction and submit to list?  Also, Helge might be able  
to test
your config.

I'm a bit skeptical that this is caused by unsupported assembly  
introduced
after 2.6.39.  If James' original tmpalias patch plus the recent fixes  
works
on top of 2.6.39, then a regression hunt may be in order.

Dave
--
John David Anglin	dave.anglin@bell.net



