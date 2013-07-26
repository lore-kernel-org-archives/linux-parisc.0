From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Kconfig: use 'PA8X00' as the default choise instead
 of 'PA7000'
Date: Fri, 26 Jul 2013 22:08:54 +0200
Message-ID: <51F2D756.7040300@gmx.de>
References: <51EF8C52.50403@asianux.com> <1374674443.4634.3.camel@dabdike> <51F07332.6030908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Chen Gang F T <chen.gang.flying.transformer@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51F07332.6030908@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Chen,

On 07/25/2013 02:37 AM, Chen Gang F T wrote:
> On 07/24/2013 10:00 PM, James Bottomley wrote:
>>
>> On Wed, 2013-07-24 at 16:12 +0800, Chen Gang wrote:
>>> For server, 64-bit kernel is widely used and '64BIT' have been alre=
ady
>>> as the default option of a server.
>>>
>>> So better to use 64-bit kernel as default choise instead of 32-bit
>>> kernel.
>>
>> I think this is irrelevant since we have defconfig for this.

I do have the same opinion.
It's not necessary.

=46urthermore, for a real 64 bit kernel you need to enable
CONFIG_64BIT not CONFIG_PA8X00.

> Hmm... but I still suggest when use 'allmodconfig' let 64-bit as the
> default choice (normally 64-bit is the default choice for servers).

Yeah, but we do support workstations as well.

>>> Or when use cross-compiler 'hppa64-linux-gnu-gcc' with allmodconfig=
, it
>>> will report BUILD_BUG_ON:
>>>
>>>   arch/parisc/mm/init.c: In function =E2=80=98mem_init=E2=80=99:
>>>   arch/parisc/mm/init.c:581:2: error: call to =E2=80=98__compiletim=
e_assert_581=E2=80=99 declared with attribute error: BUILD_BUG_ON faile=
d: PTE_ENTRY_SIZE !=3D sizeof(pte_t)
>>
>> This shows you're using a buggy compiler.  PTE_OFFSET_SIZE is genera=
ted
>> as part of the build process, so you need a correct compiler.
>>
>=20
> Hmm... It means the compiler assumes to build 64-bit code (hppa64), b=
ut
> our configuration is for 32-bit, they are mismatch.
>=20
> Maybe we can say hppa64-linux-gnu-gcc can not build the 32-bit parisc
> code (although it is not precise), but at least, it is not a real bug=
=2E

It's a fact:
hppa64-linux-gnu-gcc can *not* build the 32-bit parisc.
Only hppa-linux-gnu-gcc can build 32bit code.=20


> This contents wants to say: when use 'allmodconfig' for a server, we =
do
> not build a 64-bit server.
>=20
>=20
>>> Signed-off-by: Chen Gang <gang.chen@asianux.com>

Thanks for your patch, but:
NAK.

Helge

>>> ---
>>>  arch/parisc/Kconfig |    2 +-
>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
>>> index aa399a5..37bdecf 100644
>>> --- a/arch/parisc/Kconfig
>>> +++ b/arch/parisc/Kconfig
>>> @@ -111,7 +111,7 @@ menu "Processor type and features"
>>> =20
>>>  choice
>>>  	prompt "Processor type"
>>> -	default PA7000
>>> +	default PA8X00
>>
>> This doesn't require 64 bit: PA8xxx processors can operate happily i=
n 32
>> bit mode it does make the question appear, since PA7xxx are 32 bit o=
nly.
>>
>=20
> Yeah, 'PA8X00' can compitable with 32-bit, but it likes 64-bit, the
> following config files are for 'PA8X00':
>=20
>   a500_defconfig: for 64-bit
>   c3000_defconfig: for 32-bit
>   c8000_defconfig: for 64-bit
>   generic-64bit_defconfig: for 64-bit
>=20
> At least, we can say PA8xxx is a 64-bit processor for parisc, is it
> correct ?
>=20
> And for 'allmodconfig', if let 'PA8X00' as default choice, it will bu=
ild
> 64-bit kernel.
>=20
>=20
> Thanks.
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
