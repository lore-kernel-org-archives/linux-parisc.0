Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 371514829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Dec 2002 09:53:02 -0700 (MST)
Date: Fri, 20 Dec 2002 17:52:22 +0100
Message-ID: <3DED9BBD00002B9F@ocpmta7.freegates.net>
In-Reply-To: <20021220152034.GC31792@tausq.org>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] 2.4.21-pre2 : sysctl.h pb
To: "Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Randolph,

>> Merging 2.4.21-pre2 with parisc tree, I notice the following the follo=
wing
>> pb:
>
>just bump the hppa numbers
>>         KERN_HPPA_PWRSW=3D55,     /* int: hppa soft-power enable */
>>         KERN_HPPA_UNALIGNED=3D56, /* int: hppa unaligned-trap enable *=
/
>
>make these 57, 58 or so
>
>it seems a bit odd to me that the sysctl number space is not
>partitioned, but... 
>
Well I choose 57 and obtain a vmlinux.
But eventhought I used my config file I get this time a system which hung=

on my b2k at 'Search Devices...' and the green led stay continiously ligh=
t???
I will try to fix it next year :-))

Thanks for advise,
    Joel



********************************************
Promo Tiscali ADSL: 35 Euros/mois, 1er mois et activation =3D 0 Euro http=
://adsl.tiscali.be
