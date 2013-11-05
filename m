From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Short notice: =?UTF-8?Q?ipmi=5Fsi=20kills=20C=38=30=30=30?=
Date: Tue, 05 Nov 2013 13:23:20 +0100
Message-ID: <c40252aefa03db1431bdb9ed6dcf179e@sf-mail.de>
References: <2698496.oieJ4Vatqf@caliban.sf-tec.de>
 <15371438.W2EHpOsA1I@caliban.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <15371438.W2EHpOsA1I@caliban.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

>> I did "modprobe ipmi_si" on my C8000 (kernel 3.11.6), which=20
>> immediately
>> broke the machine. I have no backtrace yet, but I'll try to get one=20
>> next
>> week. In case someone has such a machine and the mood to debug this
>> already=E2=80=A6 ;)
>=20
> Ok, I now have IPMI monitoring on the C8000 working smoothly. Thanks=20
> for the
> work on this.
>=20
> While testing I installed by mistake the nagios IPMI check module and=
=20
> freeipmi
> on the C3600 (running 3.11.2 at that time). Calling "check_ipmi_senso=
r=20
> -T
> Temperature -H localhost" reproducible caused a HPMC. There was no IP=
MI=20
> module
> loaded or even compiled on the machine so I think it has nothing to d=
o=20
> with
> the crash reported above. I'll try if I can get some additional=20
> information on
> monday.

I can reproduce this on the C8000, using both 3.11.6 and 3.12: if=20
ipmi_devintf is not loaded the machine will die when nagios does the=20
first IPMI check. Loading this module makes the machine survive. Sadly=20
it seems that I have screwed up my serial setup so I don't have a=20
backtrace of this.

Eike
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
