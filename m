Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 27D234840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Nov 2003 00:36:12 -0700 (MST)
Date: Mon, 17 Nov 2003 08:36:06 +0100
Message-ID: <3FB265EC00002387@ocpmta3.freegates.net>
In-Reply-To: <20031117003416.GA18066@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Linux on HP
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: "Damian Muchli?ski" <mudamian@poczta.onet.pl>,
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

Hi Grant,

>>-- Original Message --
>>Date: Sun, 16 Nov 2003 17:34:16 -0700
>>From: Grant Grundler <grundler@parisc-linux.org>
>>To: Joel Soete <soete.joel@tiscali.be>
>>Cc: Damian Muchli?ski <mudamian@poczta.onet.pl>,
>>	parisc-linux@lists.parisc-linux.org
>>Subject: Re: [parisc-linux] Linux on HP
>>
>>
>>On Sun, Nov 16, 2003 at 05:13:22PM +0000, Joel Soete wrote:
>> Not me, it is the same pb on my b2k:
>> (see logs in the src thread)
>> "[...]
>> NS87415: IDE controller on PCI bus 00 dev 70
>> NS87415: chipset revision 3
>> NS87415: 100% native mode on irq 103
>>     ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:pio
>>     ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio
>> hda: HL-DT-ST GCE-8481B, ATAPI CD/DVD-ROM drive
>> ide0 at 0xf00-0xf07,0xe02 on
>> hda: ATAPI 40X CD-ROM CD-R/RW drive, 2048kB Cache
>> [...]"
>> 
>> The question is: is it enough to unplug the ide cable of this ide cdrom

>> to make it works?
>
>It might if the IDE is causing problems.
>is NS87415 code causing problems?
>
>> btw can you have a look in
>>your dmesg to see if you also encounter 
>> NS87415's messages?
>
>NS87415 is the IDE controller on the c3xxx motherboard.
>Disconnecting the cable will only make the CD-ROM drive inaccessible.
>Suckyio provides NS87415-like functionality and is quite buggy.

So according to your test, it is well the access to ide cd-rom which cause
the hang of the boot.

Thanks,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
