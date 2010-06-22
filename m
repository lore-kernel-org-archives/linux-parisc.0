From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: vfork test case.
Date: Tue, 22 Jun 2010 17:13:47 -0400
Message-ID: <AANLkTilxGYoXiuLG0x551FsywsN1Wv0LQKf6ZZHA14AP@mail.gmail.com>
References: <AANLkTinhRqCVK3NlPvqH4XfQiq_jnz3dWfp4k_vK1Eqf@mail.gmail.com>
	<20100622202044.95E7E4E77@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100622202044.95E7E4E77@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 22, 2010 at 4:20 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> At this point if the parent restores rp from the parents frame it will
>> get the rp the child's call to close saved.
>
> You are right.
>
>>
>> The only way to get around this is to *ensure* the kernel
>> saves/restores r2 across the syscall.
>>
>> I see no other way around it.
>
> It looks as if r2 is saved for both parent and child.

Perfect, in that case we have all the bases covered.

I have seen no regressions in my testing, so I will push this patch
into glibc-ports, and notify debian.

I still saw a hang in tst-vfork2, but I haven't investigated this yet.

Cheers,
Carlos.
