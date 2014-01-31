From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] Make EWOULDBLOCK be equal to EAGAIN on parisc.
Date: Fri, 31 Jan 2014 12:24:10 -0500
Message-ID: <CAE2sS1jkGKLYFG_Wv560POhd9nvY4yA0o3M9KRi4HFz5DCd9-A@mail.gmail.com>
References: <7b86ec9f26dd9a18e7fae7a39e6a3382@tuxicoman.be>
	<52EBD4F1.3020704@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Guy Martin <gmsoft@tuxicoman.be>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52EBD4F1.3020704@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 31, 2014 at 11:53 AM, Helge Deller <deller@gmx.de> wrote:
> On 01/16/2014 05:17 PM, Guy Martin wrote:
>> On Linux, only parisc uses a different value for EWOULDBLOCK which
>> causes a lot of troubles for applications not checking for both values.
>> Since the hpux compat is long dead, make EWOULDBLOCK behave the same as
>> all other architectures.
>>
>> Signed-off-by: Guy Martin  <gmsoft@tuxicoman.be>
>
> What's our final decision regarding this patch now?
> Shall we target it for inclusion into 3.14 ?
> If yes, I can include it with my next push request...
>
> Please speak up now...!
>
> Helge
>
>> ---
>>  arch/parisc/include/uapi/asm/errno.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/parisc/include/uapi/asm/errno.h b/arch/parisc/include/uapi/asm/errno.h
>> index f3a8aa5..c0ae625 100644
>> --- a/arch/parisc/include/uapi/asm/errno.h
>> +++ b/arch/parisc/include/uapi/asm/errno.h
>> @@ -106,7 +106,7 @@
>>
>>  #define    EALREADY    244    /* Operation already in progress */
>>  #define    EINPROGRESS    245    /* Operation now in progress */
>> -#define    EWOULDBLOCK    246    /* Operation would block (Linux returns EAGAIN) */
>> +#define    EWOULDBLOCK    EAGAIN    /* Operation would block (Not HPUX compliant) */
>>  #define    ENOTEMPTY    247    /* Directory not empty */
>>  #define    ENAMETOOLONG    248    /* File name too long */
>>  #define    ELOOP        249    /* Too many symbolic links encountered */

I think we should do it and fix the userspace fallout by rebuilding.

This is just like non-zero locks were in linuxthreads, a pain and
constant source of bugs.

I'll fixup glibc.

Cheers,
Carlos.
