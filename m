From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Have my PA8800 back online...
Date: Mon, 11 Dec 2017 10:25:24 -0500
Message-ID: <546d261a-f8de-f764-e6dc-8723fa95e46f@bell.net>
References: <2ADB5C8A-DFEB-4CA5-92BA-96E459A3575E@bell.net>
 <8314a5d6-7df7-3282-0d91-a9b414a122e0@web.de>
 <526274E4-88D8-4DF8-8F74-5B775186BBEC@bell.net>
 <cc22ee64-e9f3-aeb4-a9a0-a503f20f9634@web.de>
 <48320506-f7fa-822b-fb45-40eab1dbda02@bell.net>
 <17707adb-4f71-1d66-2a19-3cdfaff047f3@gmx.de>
 <53815372-58e8-70e2-bab4-1777e848cf5e@web.de>
 <79c110ec-2975-a827-4b9d-1351ab77779b@gmx.de>
 <d3c1e035-6486-c0b5-e87a-22d26c0c95f5@bell.net>
 <ccca0165-6c4a-97f3-2e0b-00657948c775@gmx.de>
 <897B27DE-04A1-4906-8DF2-C037393139C3@bell.net>
 <c7d0ee9d-0926-09a7-3a6d-22daf0c05a32@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: Frank Scheiner <frank.scheiner@web.de>,
        debian-hppa@lists.debian.org,
        linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <c7d0ee9d-0926-09a7-3a6d-22daf0c05a32@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-12-11 9:46 AM, Helge Deller wrote:
> On 10.12.2017 00:49, John David Anglin wrote:
>> On 2017-12-09, at 4:03 PM, Helge Deller wrote:
>>
>>> Can you please try attached patch which disables the serial MUX and ATI card?
>>> If it works for you and if we backport it to all kernels and if we revert palo to use ttyS0 for all machines we might be good.
>> I hacked on the change but I couldn't get it to work.  As far as I can tell, the quirks aren't being called.
>> Tried EARLY, HEADER and FINAL.  I think the ids are correct.
> Strange. The attached patch does work for me on panama up until boot.
> Haven't tested what lspci reports afterwards...
>
> [    1.832294] LBA 0:7: PCI host bridge to bus 0000:e0
> [    1.832497] pci_bus 0000:e0: root bus resource [io  0x60000-0x6ffff] (bus address [0x0000-0xffff])
> [    1.833005] pci_bus 0000:e0: root bus resource [mem 0xfffffffff0000000-0xfffffffffe77ffff] (bus address [0xf0000000-0xfe77ffff])
> [    1.840028] pci_bus 0000:e0: root bus resource [bus e0-e7]
>       1.844276] subsystem_vendor = 0x103c, subsystem_device =0x1291
> [    1.848022] pci 0000:e0:01.0: Hiding Diva built-in AUX serial device
>       1.849136] subsystem_vendor = 0x103c, subsystem_device =0x1292
> [    1.852023] pci 0000:e0:02.0: Hiding Diva built-in ATI card.
> ....

Maybe I messed up build in some way.  I didn't clean things between 
builds.  I never got the output shown above.
We have period at end of the second message.

Dave

-- 
John David Anglin  dave.anglin@bell.net

