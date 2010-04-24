From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Longstanding bug in our IRQ code (irqbalance HPMCs parisc SMP
	machines)
Date: Sat, 24 Apr 2010 09:13:49 -0600
Message-ID: <20100424151349.GB25138@lackof.org>
References: <0D9994D5-4794-401B-8DE9-9DEA73D62B05@parisc-linux.org> <20100424143617.GD24562@lackof.org> <3E26349A-5670-4643-926D-24C04E75084C@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Thibaut =?iso-8859-1?Q?VAR=C8NE?= <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3E26349A-5670-4643-926D-24C04E75084C@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Apr 24, 2010 at 04:44:27PM +0200, Thibaut VAR=C8NE wrote:
=2E..
> I'm not sure, it's been a very long time since I last tracked down th=
is=20
> bug. Maybe I'm remembering it wrong.
> FWIW, no MSI on this machine (L1000) and PCI card (sym53c896).

Ok - true. We don't support MSI AFAIK.
That means whatever is going wrong, is happening in the IO SAPIC.

>
>>> Now, I'm quite convinced that irqbalance could be one of the (major=
?)
>>> cause of instability of the parisc autobuilders. AFAIU, they've =20
>>> decided
>>> to disable it on their setup, maybe the situation will improve ther=
e.
>>> Still, irqbalance is only the messenger, and I'm wondering whether =
=20
>>> that
>>> apparent bug in our IRQ code could also be responsible for other =20
>>> issues
>>> we're still having.
>>
>> Sounds like it. Though the HPMCs are clearly different than the PTE =
=20
>> issues
>> that jda/carlos are seeing.
>
> True, but I remember Debian staff complaining about random unexplaine=
d =20
> hangs, I wouldn't be too surprised if this came into play...

Yes, especially given the fact the "hangs" generally means
the "machine suddenly stopped responding".

cheers,
grant
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
