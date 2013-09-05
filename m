From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: parisc debian kernel - missing  modules for C8000 - linux-image-3.10-2-parisc64-smp
Date: Fri, 6 Sep 2013 01:15:40 +0400
Message-ID: <413F00CF-396F-472B-8476-DF1C4084FA81@p0n4ik.tk>
References: <521A7589.5000503@gmx.de> <BLU0-SMTP41F72FA4035273DC12703897360@phx.gbl> <BLU0-SMTP99E4F2E24E1A3F5BA18E7A97360@phx.gbl> <108451378018002@web28j.yandex.ru> <BLU0-SMTP1273DDE4A968FD3A43C55D97370@phx.gbl> <3B9F0B38-597D-439E-B57E-0F7E9E11BE9D@p0n4ik.tk> <BLU0-SMTP6283FFA9572E9BF7725A1E97300@phx.gbl> <F9C1BAB5-56D3-40E2-B0B2-184C92CD51AB@p0n4ik.tk> <52278FBD.2010304@bell.net> <90151378373008@web24h.yandex.ru> <BLU0-SMTP629706DAEF1E3714BE163097330@phx.gbl>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
Content-Type: text/plain; charset=koi8-r
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP629706DAEF1E3714BE163097330@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

05.09.2013, =D7 16:49, John David Anglin <dave.anglin@bell.net> =CE=C1=D0=
=C9=D3=C1=CC(=C1):

> On 5-Sep-13, at 5:23 AM, Alex Ivanov wrote:
>=20
>=20
>> Good find! I though that it would be worth to check the load somehow=
,
>> as well. I've added the following piece after the load:
>>=20
>>               WREG32(RADEON_CP_ME_RAM_RADDR, 0);
>>               for (i =3D 0; i < size; i +=3D 2)
>>                       if (RREG32(RADEON_CP_ME_RAM_DATAH)
>>                               !=3D be32_to_cpup(&fw_data[i]) ||
>>                               RREG32(RADEON_CP_ME_RAM_DATAL)
>>                               !=3D be32_to_cpup(&fw_data[i+1])) {
>>                               printk(KERN_WARNING "RADEON_CP_ME_RAM_=
DATAH "
>>                                       "MISMATCH!\n");
>>                               break;
>>                       }
>>=20
>> I've recompiled with this and booted to the new kernel, but seeing n=
o warning,
>> so it looks like it passes.
>=20
> Could you add a line of code just to be sure the check is executed?
>=20
> From the boot log, it looks like register accesses generally seem to =
work, so it's
> starting to look like the card doesn't like the firmware.

Looks like.

>=20
> About all that I can see in the above that might be a problem is be32=
_to_cpup.
> Maybe you could just print in hex what you read back?  The R100 file =
is quite
> small.
>=20
>>=20
>> What's strange though is why they write zero instead of concrete mem=
ory address
>> to the CP_ME_RAM_ADDR register...
>=20
> Do you think the initial value should be different?  The documentatio=
n states the register
> is auto incremented on reads and writes.

My bad. I didn't take the written in manual correctly during first read=
ing.

>=20
> Dave
> --
> John David Anglin	dave.anglin@bell.net

I've added hex printing in a check and at brief view the output seems t=
o match cp firmware.
In my case, it's a r420_cp.bin


--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
