From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Longstanding bug in our IRQ code (irqbalance HPMCs parisc SMP
	machines)
Date: Sat, 24 Apr 2010 08:36:17 -0600
Message-ID: <20100424143617.GD24562@lackof.org>
References: <0D9994D5-4794-401B-8DE9-9DEA73D62B05@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-parisc@vger.kernel.org
To: Thibaut =?iso-8859-1?Q?VAR=C8NE?= <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <0D9994D5-4794-401B-8DE9-9DEA73D62B05@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Apr 24, 2010 at 03:29:01PM +0200, Thibaut VAR=C8NE wrote:
> Pa-ckers,
>
> Just for the records, I'd like to raise some attention to what seems =
=20
> like a pretty old bug in our IRQ code that is apparently still affect=
ing=20
> us.
>
> Long story short: while trying to figure out why the recently attache=
d =20
> 10-disk bay was killing the Debian "lafayette" autobuilder during rai=
d =20
> resync, I noticed that irqbalance was part of the default Debian =20
> autobuilder setup.
>
> The nastiness of irqbalance has been discussed before, and I remember=
ed=20
> having had issues in the past (5+ years ago) on my parisc machines wi=
th=20
> that daemon. I couldn't find a pointer to a m-l thread, I don't remem=
ber=20
> if I discussed that on IRC or elsewhere.
>
> Anyway, turned out disabling irqbalance "fixed" the crash (and by cra=
sh I=20
> mean HPMC). IIRC, the general idea is that when irqbalance reroutes I=
RQ=20
> under heavy interrupt load, a race occurs by which one interrupt requ=
est=20
> might end up delivered to the wrong CPU, HPMC'ing the machine.

I'm not seeing how an IRQ message getting delivered to the "wrong" CPU
would cause an HPMC. Sounds more like MSI or other mask is getting buil=
t
wrong and sending the IRQ transaction to an invalid physical address.

> I have no particular opinion on whether it should be expected that =20
> something as stupid as irqbalance could crash a system, but others se=
em=20
> to believe it shouldn't (claiming "it works on *real* [read: x86] =20
> hardware").

It definitely should not.

> Now, I'm quite convinced that irqbalance could be one of the (major?)=
 =20
> cause of instability of the parisc autobuilders. AFAIU, they've decid=
ed=20
> to disable it on their setup, maybe the situation will improve there.=
=20
> Still, irqbalance is only the messenger, and I'm wondering whether th=
at=20
> apparent bug in our IRQ code could also be responsible for other issu=
es=20
> we're still having.

Sounds like it. Though the HPMCs are clearly different than the PTE iss=
ues
that jda/carlos are seeing.

> It's been a very long time since I last touched that code, and tbh I =
=20
> never fully mastered it anyway, but I thought it'd be a good thing to=
 =20
> have a trace that this bug is still there, and maybe it will ring a b=
ell=20
> to others...

No matter what crap irqbalanced is doing, the box shouldn't crash.
I can take a look at the code path and see if something looks broken.

thanks,
grant
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
