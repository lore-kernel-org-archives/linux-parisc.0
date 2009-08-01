From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset Table
Date: Fri, 31 Jul 2009 21:51:17 -0400
Message-ID: <119aab440907311851t502a208bh34b21b3f732e3e09@mail.gmail.com>
References: <4A73821A.4020506@gmx.de>
	 <20090801003740.8BBDE5160@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>, kyle@mcmartin.ca, elendil@planet.nl,
	539378@bugs.debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, randolph@tausq.org,
	submit@bugs.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090801003740.8BBDE5160@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jul 30, 2009 at 8:37 PM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
>> =A0 =A0 =A0 case ELF_STUB_GOT:
>> - =A0 =A0 =A0 =A0 =A0 =A0 stub->insns[0] =3D 0x537b0000; =A0 =A0/* l=
dd 0(%dp),%dp =A0 =A0 =A0 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 stub->insns[0] =3D 0x537b0000; =A0 =A0/* l=
dd 0(%dp),%dp =A0 =A0 =A0 */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 stub->insns[1] =3D 0x53610020; =A0 =A0/*=
 ldd 10(%dp),%r1 =A0 =A0 =A0*/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 stub->insns[2] =3D 0xe820d000; =A0 =A0/*=
 bve (%r1) =A0 =A0 =A0 =A0 =A0 =A0*/
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 stub->insns[3] =3D 0x537b0030; =A0 =A0/*=
 ldd 18(%dp),%dp =A0 =A0 =A0*/
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 stub->insns[0] |=3D reassemble_14(get_got(=
me, value, addend) & 0x3fff);
>> + =A0 =A0 =A0 =A0 =A0 =A0 d =3D get_got(me, value, addend);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (d <=3D 15)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 stub->insns[0] |=3D reasse=
mble_14(d);
>
> reassemble_14 is wrong for ldd format 3. =A0Need format 5 and im5 ins=
ertion.

This is using reassemble_14 for ldd format 5, which is correct.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
