Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D9F74831
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 25 Mar 2004 00:51:56 -0700 (MST)
Date: Thu, 25 Mar 2004 08:11:35 +0100
Message-ID: <40561E7100006BEF@ocpmta2.freegates.net>
In-Reply-To: <20040324210631.GN25059@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20Cast=20of=20lvalue=20warning=20in=20the=20last=20k=202=2E6=2E5=2Drc2=20with=09last=20gcc=2D3=2E3=20=28next=29?=
To: "Matthew Wilcox" <willy@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


>>  	}
>>  	while (count > 3) {
>>  		__raw_writel(*(u32 *)src, dest);
>> -		src += 4;
>> -		dest += 4;
>> -		count -= 4;
>> +		src += sizeof(u32);
>> +		dest += sizeof(u32);
>> +		count -= sizeof(u32);
>
>No, don't change these.

Just to explain that it was inspired by a Andreas Jaeger's patch (http://sources.redhat.com/ml/libc-hacker/2004-03/msg00007.html)
 and wasn't originaly requested by the warning.
But I find it nice to add it to show the relationship between __raw_writel()
and increment, decrement actions.

That said, there are no urgency to fix it: it is still a warning with gcc-3.3
:)

Thanks for feedback,
    Joel


T

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
