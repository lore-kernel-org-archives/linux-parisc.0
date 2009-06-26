From: Randolph Chung <randolph@tausq.org>
Subject: Re: [PATCH] misplaced parenthesis?
Date: Fri, 26 Jun 2009 09:38:35 +0800
Message-ID: <4A44269B.4010302@tausq.org>
References: <4A0DC131.8020606@gmail.com>	<4A0E3D95.5090404@tausq.org>	<b4198de60905152248t63514a4fmfa71f3a72d80770e@mail.gmail.com>	<4A10BD1A.3060208@tausq.org>	<1e3eba760906230753l4e14a025y6bc07a753999483e@mail.gmail.com> <20090625132925.982bc72d.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: roel.kluin@gmail.com, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090625132925.982bc72d.akpm@linux-foundation.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle has merged this into the parisc tree.

thanks
randolph

Andrew Morton wrote:
> On Tue, 23 Jun 2009 22:53:26 +0800
> Randolph Chung <randolph@tausq.org> wrote:
>
>   
>> Here's an updated patch:
>>
>> Reported-by: Roel Kluin <roel.kluin@gmail.com>
>> Signed-off-by: Randolph Chung <tausq@parisc-linux.org>
>>
>> diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
>> index 2d68431..827e535 100644
>> --- a/arch/parisc/lib/memcpy.c
>> +++ b/arch/parisc/lib/memcpy.c
>> @@ -405,7 +405,7 @@ byte_copy:
>>
>>  unaligned_copy:
>>         /* possibly we are aligned on a word, but not on a double... */
>> -       if (likely(t1 & (sizeof(unsigned int)-1)) == 0) {
>> +       if (likely((t1 & (sizeof(unsigned int)-1)) == 0)) {
>>                 t2 = src & (sizeof(unsigned int) - 1);
>>
>>                 if (unlikely(t2 != 0)) {
>>
>>     
>
> I think I'll delete this email.  If someone has a patch which they
> think should be applied, please resend it with a changelog.
>
>   

