Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id BCEC14829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 00:30:06 -0700 (MST)
Date: Fri, 10 Jan 2003 08:29:47 +0100
Message-ID: <3E1AA8D500000856@ocpmta8.freegates.net>
In-Reply-To: <20030109082902.GF23535@tausq.org>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] unaligned accesses
To: "Randolph Chung" <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
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

>-- Original Message --
>From: Randolph Chung <randolph@tausq.org>
>To: parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] unaligned accesses
>Reply-To: Randolph Chung <randolph@tausq.org>
>Date: Thu, 9 Jan 2003 00:29:02 -0800
>
>
>> The other question. I am using emacs, and I regularly see these messag=
es:
>> 
>> Jan  8 23:52:33 hp kernel: emacs(17795): unaligned access to 0x001cdaf=
2
>at ip=3D0x0008937f
>> Jan  8 23:52:33 hp kernel: emacs(17795): unaligned access to 0x001cdaf=
2
>at ip=3D0x0008930b
>> 
>> What are they?
>
>Blame LaMont!
>(yes, I'm just kidding, I've just been waiting for my chance to say
>this... :-)
>
Do you think that this tcpdump pb is also related to Lamont job (to be ho=
nest
I do not remember what was it?):
...
Jan  9 09:59:58 fw01 kernel: tcpdump(4638): unaligned access to 0x0011e78=
a
at ip=3D0x0002ab83
Jan  9 09:59:34 fw01 kernel: tcpdump(4638): unaligned access to 0x0011e78=
e
at ip=3D0x0002ab83
...

>On a more serious note, on parisc load/stores to half-words, words,
>doublewords have specific address alignment requirements. the message
>usually means the program in question is buggy and is making unaligned

hmmm buggy: not always, the triky case is when you have to access to thos=
e
kind of data encapsulated into a structure. I do not yet find any workaro=
und
or how to fix this kind of pb. Any idea (gcc-3.3?)?

>accesses. The unaligned access is trapped and emulated by the kernel, 
>so normally the message itself is simply informational.
>
>This is definitely a FAQ.... maybe we should add it to the list :)
>
Yes, works fine but this consume a lot of CPU resources.

Joel


********************************************
Promo Tiscali ADSL: 35 Euros/mois, 1er mois et activation =3D 0 Euro http=
://adsl.tiscali.be
