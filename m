From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] PARISC: provide __ucmpdi2
Date: Sat, 20 Apr 2013 16:26:01 -0400
Message-ID: <BLU0-SMTP318334D40E569E5E0E46FF97C90@phx.gbl>
References: <BLU0-SMTP16CB97A849149145EF5FC997C90@phx.gbl> <1751609.lhOQIV1TC8@eto> <BLU0-SMTP453E3CCB487F80E412D02A97C90@phx.gbl> <3572037.nRvXk0Bztd@eto>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3572037.nRvXk0Bztd@eto>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 20-Apr-13, at 4:02 PM, Rolf Eike Beer wrote:

> Am Samstag 20 April 2013, 15:52:59 schrieb John David Anglin:
>> On 20-Apr-13, at 3:51 PM, Rolf Eike Beer wrote:
>>> Am Samstag 20 April 2013, 15:41:06 schrieb John David Anglin:
>>>> Provide __ucmpdi2 to resolve undefined references in 32 bit builds.
>>>>
>>>> The Debian experimental linux source package (3.8.5-1) build fails
>>>> with the following errors:
>>>> ...
>>>> MODPOST 2016 modules
>>>> ERROR: "__ucmpdi2" [fs/btrfs/btrfs.ko] undefined!
>>>> ERROR: "__ucmpdi2" [drivers/md/dm-verity.ko] undefined!
>>>>
>>>> The attached patch resolves this problem.  It is based on the s390
>>>> implementation
>>>> of ucmpdi2.c.
>>>>
>>>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>>>> Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
>>>> Cc: Helge Deller <deller@gmx.de>
>>>
>>> If this is in 3.8.5 this should also get a Cc:stable@kernel.org
>>
>> It is not in anything.
>
> The function? Or the error? If the function is missing, i.e. the  
> error will
> happen once enabling e.g. btrfs, in a already released kernel we  
> should get
> this into stable.

The error is probably in all active stable branches given that most  
ports provide the function.
GCC generates a call to __ucmpdi2 if the backend doesn't support  
unsigned 64-bit compares.
Normally, the function is resolved by libgcc.  I have no objection to  
pushing the patch back
but Helge and James usually decide this.

Dave
--
John David Anglin	dave.anglin@bell.net



