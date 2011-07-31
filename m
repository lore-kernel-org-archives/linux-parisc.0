From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] wire up sysmmsg syscall
Date: Sun, 31 Jul 2011 18:20:24 -0400
Message-ID: <BLU0-SMTP82CE39A50555BFA8FBF61997390@phx.gbl>
References: <1311950222.8190.43.camel@mulgrave> <CA+DQjFgbOy=VV0omtN6QKmzkEbP6kxwYtCFZ4MFwybTXDEav-g@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CA+DQjFgbOy=VV0omtN6QKmzkEbP6kxwYtCFZ4MFwybTXDEav-g@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 31-Jul-11, at 5:46 PM, Thibaut VARENE wrote:

> Hi James,
>
> On Fri, Jul 29, 2011 at 4:37 PM, James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
>> Signed-off-by: James Bottomley <JBottomley@Parallels.com>
>>
>> ---
>>
>> diff --git a/arch/parisc/include/asm/unistd.h b/arch/parisc/include/ 
>> asm/unistd.h
>> index 3392de3..276df1c 100644
>> --- a/arch/parisc/include/asm/unistd.h
>> +++ b/arch/parisc/include/asm/unistd.h
>> @@ -821,8 +821,10 @@
>>  #define __NR_open_by_handle_at (__NR_Linux + 326)
>>  #define __NR_syncfs            (__NR_Linux + 327)
>>  #define __NR_setns             (__NR_Linux + 328)
>> +#define __NR_setns             (__NR_Linux + 328)
>
> ^ I may be wrong but this looks like a spurious "+", just reading  
> this patch...

Yes.  Also, there is a typo in the mail Subject...

Dave
--
John David Anglin	dave.anglin@bell.net



