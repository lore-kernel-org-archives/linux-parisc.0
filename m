From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [Suggestion] parisc: kernel: about section mismatch warning.
Date: Mon, 29 Jul 2013 16:49:18 +0800
Message-ID: <51F62C8E.6080003@asianux.com>
References: <51EF8C52.50403@asianux.com> <51EF8FED.9090903@asianux.com> <1374675095.4634.6.camel@dabdike> <51F06A31.9090408@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51F06A31.9090408@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


After use own built cross compiler (gcc-4.9.0, binutils-2.23.2 with
'hppa64-gchen-linux'), no the related warnings any more.

The original compiler which I used ('hppa64-linux-gnu') is incorrect.

:-)

Thanks.

On 07/25/2013 07:58 AM, Chen Gang F T wrote:
> On 07/24/2013 10:11 PM, James Bottomley wrote:
>> On Wed, 2013-07-24 at 16:27 +0800, Chen Gang wrote:
>>> Hello Maintainers:
>>>
>>> When building parisc with allmodconfig by 'hppa64-linux-gnu-', I find section mismatch warnings.
>>>
>>> I am not quite sure whether they will cause real issue or not, please
>>> help check, thanks.
>>
>> I think you need to try a new compiler before we start looking at issues
>> that don't show up in our build.  However, since it doesn't show up in
>> the parisc build, I don't actually think it's real, since it's a
>> temporary label in core code.
>>
> 
> OK, thanks, I should use a new compiler for it, I will continue.
> 
> And welcome any additional suggestions or completions (especially the
> information about parisc compiler).
> 
> 
> Thanks.
> 


-- 
Chen Gang
