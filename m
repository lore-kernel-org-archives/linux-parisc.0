From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: switch to gzip-compressed vmlinuz kernel
Date: Sat, 29 Jun 2013 16:00:24 -0400
Message-ID: <BLU0-SMTP67AC6F18E8093CF6C8C2E797770@phx.gbl>
References: <20130629113124.GA1320@p100.box> <BLU0-SMTP510D290B15E6925904E11C97770@phx.gbl> <51CF3B81.8010807@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51CF3B81.8010807@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 29-Jun-13, at 3:54 PM, Helge Deller wrote:

> Hi Dave,
>
> On 06/29/2013 09:38 PM, John David Anglin wrote:
>> On 29-Jun-13, at 7:31 AM, Helge Deller wrote:
>>
>>> PALO version 1.9 (or higher) is required for this which is  
>>> available in
>>> the dev_gzip branch of
>>> git://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git
>>
>> Helge, as the resident palo guru, could you update the debian/ 
>> changelog and
>> build a new package when you make changes?  We have gone through  
>> about
>> three versions without any documentation as to what was changed.
>
> Sure, that's what I had in mind. And add a spec file for RH :-)
> But I just sent the patch to patchwork so that it's not being missed  
> at some point.
> I did not yet wanted to apply it....
>
>> I have built a palo-1.19 package which should be uploaded to the  
>> archive soon.
>> Made up something for changelog.
>
> Please don't upload it yet.
> It still needs more testing.


Holding.

I have been using 1.18 up to now.

Dave
--
John David Anglin	dave.anglin@bell.net



