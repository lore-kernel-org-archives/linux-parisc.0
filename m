From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Link error in CMake for HPPA1.1, wrong result for HPPA 2.0
Date: Wed, 7 Sep 2011 19:35:42 -0400
Message-ID: <BLU0-SMTP85AE9387481754DD11D7CE971F0@phx.gbl>
References: <99a9e4b224dc9020d16d0a33fea6096f.squirrel@webmail.sf-mail.de> <da1221fe3aa512ba4b0a139a89dd2e69.squirrel@webmail.sf-mail.de> <4E5BA449.5050606@bell.net> <7292253.L43gRO36Hq@donald.sf-tec.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7292253.L43gRO36Hq@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 29-Aug-11, at 2:31 PM, Rolf Eike Beer wrote:

> You wrote:
>> On 8/29/2011 4:12 AM, Rolf Eike Beer wrote:
>
>>> Confirmed, it is a regression in gcc 4.5. If I build using 4.4.6
>>> everything works fine. I'll file a bug report tonight.
>>
>> Interesting, there's not much difference in the PA backend for  
>> these two
>> versions.
>>
>> Add me (danglin at gcc.gnu.org) to the CC list on the GCC bug  
>> report and
>> I'll try to
>> duplicate the problem.
>
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50230
>
> Eike


The problem appears to be that comdat groups and stubs don't get along
with each other.  Comdat groups seem to get merged and this can result
in out of range branches.

Linking with the --unique='.text.*' option avoids the error, but this  
probably
breaks comdat and discard support.

For now, I think the best solution (untested) is to configure GCC with  
the
--disable-comdat option.

I'm going to file a binutils PR.

Dave
--
John David Anglin	dave.anglin@bell.net



