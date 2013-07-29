From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH] parisc: Kconfig: use 'PA8X00' as the default choise instead
 of 'PA7000'
Date: Mon, 29 Jul 2013 09:11:52 +0800
Message-ID: <51F5C158.3030303@asianux.com>
References: <51EF8C52.50403@asianux.com> <1374674443.4634.3.camel@dabdike> <51F07332.6030908@gmail.com> <51F2D756.7040300@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51F2D756.7040300@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 07/27/2013 04:08 AM, Helge Deller wrote:
> Hi Chen,
>=20
> On 07/25/2013 02:37 AM, Chen Gang F T wrote:
>> On 07/24/2013 10:00 PM, James Bottomley wrote:
>>>
>>> On Wed, 2013-07-24 at 16:12 +0800, Chen Gang wrote:
>>>> For server, 64-bit kernel is widely used and '64BIT' have been alr=
eady
>>>> as the default option of a server.
>>>>
>>>> So better to use 64-bit kernel as default choise instead of 32-bit
>>>> kernel.
>>>
>>> I think this is irrelevant since we have defconfig for this.
>=20
> I do have the same opinion.
> It's not necessary.
>=20
> Furthermore, for a real 64 bit kernel you need to enable
> CONFIG_64BIT not CONFIG_PA8X00.
>=20

But for "allmodconfig", it can not enable 'CONFIG_64BIT' automatically.

>> Hmm... but I still suggest when use 'allmodconfig' let 64-bit as the
>> default choice (normally 64-bit is the default choice for servers).
>=20
> Yeah, but we do support workstations as well.
>=20

OH, thanks, I really don't know about it (today I know :-) ), in my
original memory, parisc is mainly for server and well known by many mem=
bers.

As far as I know, we often set mainly used item as default choice, if
have several mainly used item, need set general or compatible item as
default choice.

If 'PA8X00' is our mainly used item (only 'PA8X00' support 64-bit), I
still suggest to set it as default choice. Or when 'allmodconfig' works
for a server, finds 'CONFIG_64BIT' unset, it really wonders "Why ?"

>>>> Or when use cross-compiler 'hppa64-linux-gnu-gcc' with allmodconfi=
g, it
>>>> will report BUILD_BUG_ON:
>>>>
>>>>   arch/parisc/mm/init.c: In function =A1=AEmem_init=A1=AF:
>>>>   arch/parisc/mm/init.c:581:2: error: call to =A1=AE__compiletime_=
assert_581=A1=AF declared with attribute error: BUILD_BUG_ON failed: PT=
E_ENTRY_SIZE !=3D sizeof(pte_t)
>>>
>>> This shows you're using a buggy compiler.  PTE_OFFSET_SIZE is gener=
ated
>>> as part of the build process, so you need a correct compiler.
>>>
>>
>> Hmm... It means the compiler assumes to build 64-bit code (hppa64), =
but
>> our configuration is for 32-bit, they are mismatch.
>>
>> Maybe we can say hppa64-linux-gnu-gcc can not build the 32-bit paris=
c
>> code (although it is not precise), but at least, it is not a real bu=
g.
>=20
> It's a fact:
> hppa64-linux-gnu-gcc can *not* build the 32-bit parisc.
> Only hppa-linux-gnu-gcc can build 32bit code.=20
>=20
>=20

Thank you for your confirmation.

I should build hppa-linux-gnu-gcc cross-compiler firstly.

Hmm... I try to finish it within this week (but not quite sure), but at
least I should finish it within next month (2013-08-31).

Welcome any additional suggestions or completions (especially the
related information for parisc cross-compiler).

>> This contents wants to say: when use 'allmodconfig' for a server, we=
 do
>> not build a 64-bit server.
>>
>>
>>>> Signed-off-by: Chen Gang <gang.chen@asianux.com>
>=20
> Thanks for your patch, but:
> NAK.
>=20

OK, I can understand.

Thank you too.

> Helge
>=20
>>>> ---
>>>>  arch/parisc/Kconfig |    2 +-
>>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
>>>> index aa399a5..37bdecf 100644
>>>> --- a/arch/parisc/Kconfig
>>>> +++ b/arch/parisc/Kconfig
>>>> @@ -111,7 +111,7 @@ menu "Processor type and features"
>>>> =20
>>>>  choice
>>>>  	prompt "Processor type"
>>>> -	default PA7000
>>>> +	default PA8X00
>>>
>>> This doesn't require 64 bit: PA8xxx processors can operate happily =
in 32
>>> bit mode it does make the question appear, since PA7xxx are 32 bit =
only.
>>>
>>
>> Yeah, 'PA8X00' can compitable with 32-bit, but it likes 64-bit, the
>> following config files are for 'PA8X00':
>>
>>   a500_defconfig: for 64-bit
>>   c3000_defconfig: for 32-bit
>>   c8000_defconfig: for 64-bit
>>   generic-64bit_defconfig: for 64-bit
>>
>> At least, we can say PA8xxx is a 64-bit processor for parisc, is it
>> correct ?
>>
>> And for 'allmodconfig', if let 'PA8X00' as default choice, it will b=
uild
>> 64-bit kernel.
>>
>>
>> Thanks.
>>
>=20


--=20
Chen Gang

--=20
Chen Gang
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
