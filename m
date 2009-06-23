From: Randolph Chung <randolph@tausq.org>
Subject: Re: [PATCH] misplaced parenthesis?
Date: Tue, 23 Jun 2009 22:53:26 +0800
Message-ID: <1e3eba760906230753l4e14a025y6bc07a753999483e@mail.gmail.com>
References: <4A0DC131.8020606@gmail.com> <4A0E3D95.5090404@tausq.org>
	 <b4198de60905152248t63514a4fmfa71f3a72d80770e@mail.gmail.com>
	 <4A10BD1A.3060208@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Roel Kluin <roel.kluin@gmail.com>, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A10BD1A.3060208@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Here's an updated patch:

Reported-by: Roel Kluin <roel.kluin@gmail.com>
Signed-off-by: Randolph Chung <tausq@parisc-linux.org>

diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index 2d68431..827e535 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -405,7 +405,7 @@ byte_copy:

 unaligned_copy:
        /* possibly we are aligned on a word, but not on a double... */
-       if (likely(t1 & (sizeof(unsigned int)-1)) =3D=3D 0) {
+       if (likely((t1 & (sizeof(unsigned int)-1)) =3D=3D 0)) {
                t2 =3D src & (sizeof(unsigned int) - 1);

                if (unlikely(t2 !=3D 0)) {


On Mon, May 18, 2009 at 9:42 AM, Randolph Chung<randolph@tausq.org> wro=
te:
> The wrong version of course produces different code....
>
> the original and the corrected one may produce different code dependi=
ng on
> how the compiler schedules things.
>
> randolph
>
> Matt Turner wrote:
>>
>> Does gcc produce different code for the three variations?
>>
>> Matt
>>
>> On Sat, May 16, 2009 at 12:14 AM, Randolph Chung <randolph@tausq.org=
>
>> wrote:
>>
>>>
>>> This is a bit confusingly written, but your patch does not appear t=
o be
>>> correct.
>>>
>>> =3D=3D has higher precedence than &, so you are basically changing =
it to:
>>> if (likely(t1 & 1))
>>>
>>> it really should be
>>>
>>> - =A0 =A0 =A0 if (likely(t1 & (sizeof(unsigned int)-1)) =3D=3D 0) {
>>> + =A0 =A0 =A0 if (likely((t1 & (sizeof(unsigned int)-1)) =3D=3D 0))=
 {
>>>
>>> randolph
>>>
>>>
>>> Roel Kluin wrote:
>>>
>>>>
>>>> Fix misplaced parenthesis.
>>>>
>>>> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
>>>> ---
>>>> I think this is what was intended? Note that this patch may affect
>>>> profiling.
>>>>
>>>> diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
>>>> index bbda909..30207b0 100644
>>>> --- a/arch/parisc/lib/memcpy.c
>>>> +++ b/arch/parisc/lib/memcpy.c
>>>> @@ -405,7 +405,7 @@ byte_copy:
>>>> =A0unaligned_copy:
>>>> =A0 =A0 =A0 /* possibly we are aligned on a word, but not on a dou=
ble... */
>>>> - =A0 =A0 =A0 if (likely(t1 & (sizeof(unsigned int)-1)) =3D=3D 0) =
{
>>>> + =A0 =A0 =A0 if (likely(t1 & (sizeof(unsigned int)-1) =3D=3D 0)) =
{
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 t2 =3D src & (sizeof(unsigned int) - 1=
);
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(t2 !=3D 0)) {
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe linux-pa=
risc"
>>>> in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
>>>>
>>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-par=
isc"
>>> in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>>
>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-pari=
sc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
