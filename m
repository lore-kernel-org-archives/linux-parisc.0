From: Chen Gang F T <chen.gang.flying.transformer@gmail.com>
Subject: Re: [PATCH] parisc: Kconfig: use 'PA8X00' as the default choise instead
 of 'PA7000'
Date: Thu, 25 Jul 2013 08:37:06 +0800
Message-ID: <51F07332.6030908@gmail.com>
References: <51EF8C52.50403@asianux.com> <1374674443.4634.3.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1374674443.4634.3.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 07/24/2013 10:00 PM, James Bottomley wrote:
>=20
> On Wed, 2013-07-24 at 16:12 +0800, Chen Gang wrote:
>> For server, 64-bit kernel is widely used and '64BIT' have been alrea=
dy
>> as the default option of a server.
>>
>> So better to use 64-bit kernel as default choise instead of 32-bit
>> kernel.
>=20
> I think this is irrelevant since we have defconfig for this.  You
> apparent request doesn't match the code below.
>=20

Hmm... but I still suggest when use 'allmodconfig' let 64-bit as the
default choice (normally 64-bit is the default choice for servers).

>> Or when use cross-compiler 'hppa64-linux-gnu-gcc' with allmodconfig,=
 it
>> will report BUILD_BUG_ON:
>>
>>   arch/parisc/mm/init.c: In function =E2=80=98mem_init=E2=80=99:
>>   arch/parisc/mm/init.c:581:2: error: call to =E2=80=98__compiletime=
_assert_581=E2=80=99 declared with attribute error: BUILD_BUG_ON failed=
: PTE_ENTRY_SIZE !=3D sizeof(pte_t)
>=20
> This shows you're using a buggy compiler.  PTE_OFFSET_SIZE is generat=
ed
> as part of the build process, so you need a correct compiler.
>=20

Hmm... It means the compiler assumes to build 64-bit code (hppa64), but
our configuration is for 32-bit, they are mismatch.

Maybe we can say hppa64-linux-gnu-gcc can not build the 32-bit parisc
code (although it is not precise), but at least, it is not a real bug.

This contents wants to say: when use 'allmodconfig' for a server, we do
not build a 64-bit server.


>> Signed-off-by: Chen Gang <gang.chen@asianux.com>
>> ---
>>  arch/parisc/Kconfig |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
>> index aa399a5..37bdecf 100644
>> --- a/arch/parisc/Kconfig
>> +++ b/arch/parisc/Kconfig
>> @@ -111,7 +111,7 @@ menu "Processor type and features"
>> =20
>>  choice
>>  	prompt "Processor type"
>> -	default PA7000
>> +	default PA8X00
>=20
> This doesn't require 64 bit: PA8xxx processors can operate happily in=
 32
> bit mode it does make the question appear, since PA7xxx are 32 bit on=
ly.
>=20

Yeah, 'PA8X00' can compitable with 32-bit, but it likes 64-bit, the
following config files are for 'PA8X00':

  a500_defconfig: for 64-bit
  c3000_defconfig: for 32-bit
  c8000_defconfig: for 64-bit
  generic-64bit_defconfig: for 64-bit

At least, we can say PA8xxx is a 64-bit processor for parisc, is it
correct ?

And for 'allmodconfig', if let 'PA8X00' as default choice, it will buil=
d
64-bit kernel.


Thanks.
--=20
Chen Gang

--=20
Chen Gang
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
