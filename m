From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Random crashes when calling git
Date: Tue, 08 Jan 2013 15:30:39 +0100
Message-ID: <c1bad8b168dc885f7fe9aafa5712ece5@sf-mail.de>
References: <4882058.deuBGYmI4J@donald.sf-tec.de>
 <BLU0-SMTP552A5EEA5FEF5F4C363ADC97380@phx.gbl>
 <3563905.2dklDXemHT@donald.sf-tec.de>
 <BLU0-SMTP22C3BF8F11ED2FBDDA8BE6973C0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
To: <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP22C3BF8F11ED2FBDDA8BE6973C0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
> On 31-Dec-12, at 6:03 AM, Rolf Eike Beer wrote:
>
>> I've put together the used git executable as well as 4 core dumps at
>> http://opensource.sf-tec.de/git-crash.tar.bz2
>>
>> It would be nice if you could take a look and tell me if this gives  
>> you
>> anything.

> I think this is the infamous thread stack corruption bug.  There are
> numerous discussions about it on the list.
>
> It's just a guess but I believe my kernel patch may help.  Attaching  
> latest
> version for 3.7.1.
>
> If the patch doesn't help, then I think we need to review the glibc
> patch sets for debian and gentoo.  I have installed an unmodified
> version of 2.13-37.

I have now applied this patch and while at it added another 1GB of RAM, 
but I don't think the latter will make any difference.

I was now able to run the CMake git test for more than a dozen times in 
a row without a single failure and also the git testsuite is now in the 
range of the 6000 with it's tests, which is far beyond anything it was 
able to reach until now. So I think that your patch indeed makes things 
better.

Time to split it up and submit it upstream ;)

Eike
