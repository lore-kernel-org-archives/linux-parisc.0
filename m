From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <T-Bone@parisc-linux.org>
Subject: Re: Longstanding bug in our IRQ code (irqbalance HPMCs parisc SMP machines)
Date: Sat, 24 Apr 2010 16:44:27 +0200
Message-ID: <3E26349A-5670-4643-926D-24C04E75084C@parisc-linux.org>
References: <0D9994D5-4794-401B-8DE9-9DEA73D62B05@parisc-linux.org> <20100424143617.GD24562@lackof.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Cc: linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100424143617.GD24562@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Le 24 avr. 10 =E0 16:36, Grant Grundler a =E9crit :

> On Sat, Apr 24, 2010 at 03:29:01PM +0200, Thibaut VAR=C8NE wrote:
>>

>> Anyway, turned out disabling irqbalance "fixed" the crash (and by =20
>> crash I
>> mean HPMC). IIRC, the general idea is that when irqbalance reroutes =
=20
>> IRQ
>> under heavy interrupt load, a race occurs by which one interrupt =20
>> request
>> might end up delivered to the wrong CPU, HPMC'ing the machine.
>
> I'm not seeing how an IRQ message getting delivered to the "wrong" CP=
U
> would cause an HPMC. Sounds more like MSI or other mask is getting =20
> built
> wrong and sending the IRQ transaction to an invalid physical address.

I'm not sure, it's been a very long time since I last tracked down =20
this bug. Maybe I'm remembering it wrong.
=46WIW, no MSI on this machine (L1000) and PCI card (sym53c896).

>> Now, I'm quite convinced that irqbalance could be one of the (major?=
)
>> cause of instability of the parisc autobuilders. AFAIU, they've =20
>> decided
>> to disable it on their setup, maybe the situation will improve there=
=2E
>> Still, irqbalance is only the messenger, and I'm wondering whether =20
>> that
>> apparent bug in our IRQ code could also be responsible for other =20
>> issues
>> we're still having.
>
> Sounds like it. Though the HPMCs are clearly different than the PTE =20
> issues
> that jda/carlos are seeing.

True, but I remember Debian staff complaining about random unexplained =
=20
hangs, I wouldn't be too surprised if this came into play...

>> It's been a very long time since I last touched that code, and tbh I
>> never fully mastered it anyway, but I thought it'd be a good thing t=
o
>> have a trace that this bug is still there, and maybe it will ring a =
=20
>> bell
>> to others...
>
> No matter what crap irqbalanced is doing, the box shouldn't crash.
> I can take a look at the code path and see if something looks broken.
>
> thanks,


You're welcome ;)

--=20
Thibaut VAR=C8NE
http://www.parisc-linux.org/~varenet/

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
