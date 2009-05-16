From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] misplaced parenthesis?
Date: Sat, 16 May 2009 01:48:50 -0400
Message-ID: <b4198de60905152248t63514a4fmfa71f3a72d80770e@mail.gmail.com>
References: <4A0DC131.8020606@gmail.com> <4A0E3D95.5090404@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Roel Kluin <roel.kluin@gmail.com>, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
To: Randolph Chung <randolph@tausq.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A0E3D95.5090404@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Does gcc produce different code for the three variations?

Matt

On Sat, May 16, 2009 at 12:14 AM, Randolph Chung <randolph@tausq.org> w=
rote:
> This is a bit confusingly written, but your patch does not appear to =
be
> correct.
>
> =3D=3D has higher precedence than &, so you are basically changing it=
 to:
> if (likely(t1 & 1))
>
> it really should be
>
> - =A0 =A0 =A0 if (likely(t1 & (sizeof(unsigned int)-1)) =3D=3D 0) {
> + =A0 =A0 =A0 if (likely((t1 & (sizeof(unsigned int)-1)) =3D=3D 0)) {
>
> randolph
>
>
> Roel Kluin wrote:
>>
>> Fix misplaced parenthesis.
>>
>> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
>> ---
>> I think this is what was intended? Note that this patch may affect
>> profiling.
>>
>> diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
>> index bbda909..30207b0 100644
>> --- a/arch/parisc/lib/memcpy.c
>> +++ b/arch/parisc/lib/memcpy.c
>> @@ -405,7 +405,7 @@ byte_copy:
>> =A0=A0unaligned_copy:
>> =A0 =A0 =A0 =A0/* possibly we are aligned on a word, but not on a do=
uble... */
>> - =A0 =A0 =A0 if (likely(t1 & (sizeof(unsigned int)-1)) =3D=3D 0) {
>> + =A0 =A0 =A0 if (likely(t1 & (sizeof(unsigned int)-1) =3D=3D 0)) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0t2 =3D src & (sizeof(unsigned int) - =
1);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (unlikely(t2 !=3D 0)) {
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-pari=
sc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-paris=
c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
