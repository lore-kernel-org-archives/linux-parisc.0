From: Thibaut VARENE <varenet@parisc-linux.org>
Subject: Re: [PATCH] kobject: Read buffer overflow
Date: Sun, 2 Aug 2009 12:24:34 +0200
Message-ID: <7d01f9f00908020324r227382aal1d63512ded018b17@mail.gmail.com>
References: <4A754814.50506@gmail.com>
	 <7d01f9f00908020306s273eec60u8e50692c0f839828@mail.gmail.com>
	 <20090802101635.GA3711@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Roel Kluin <roel.kluin@gmail.com>, kyle@mcmartin.ca, deller@gmx.de,
	linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090802101635.GA3711@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Aug 2, 2009 at 12:16 PM, Matthew Wilcox<matthew@wil.cx> wrote:
> On Sun, Aug 02, 2009 at 12:06:59PM +0200, Thibaut VARENE wrote:
>> On Sun, Aug 2, 2009 at 10:02 AM, Roel Kluin<roel.kluin@gmail.com> wr=
ote:
>> > Check whether index is within bounds before testing the element.
>>
>> The change is correct but:
>> - There are other places in the code with that construct. Even thoug=
h
>> they wouldn't trigger an overflow, why not fixing them too?
>> - Keep the likely: we are more likely to run out of data in the laye=
rs
>> than to exhaust the counter (which is why no overflow was ever
>> triggered, I believe ;-)
>
> No, lose the likely. =C2=A0It's a for-loop; gcc will do the right thi=
ng.

I stand corrected then. ;-)
Thanks willy.

T-Bone

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
