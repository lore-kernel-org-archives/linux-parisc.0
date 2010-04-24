From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <T-Bone@parisc-linux.org>
Subject: Longstanding bug in our IRQ code (irqbalance HPMCs parisc SMP machines)
Date: Sat, 24 Apr 2010 15:29:01 +0200
Message-ID: <0D9994D5-4794-401B-8DE9-9DEA73D62B05@parisc-linux.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Pa-ckers,

Just for the records, I'd like to raise some attention to what seems =20
like a pretty old bug in our IRQ code that is apparently still =20
affecting us.

Long story short: while trying to figure out why the recently attached =
=20
10-disk bay was killing the Debian "lafayette" autobuilder during raid =
=20
resync, I noticed that irqbalance was part of the default Debian =20
autobuilder setup.

The nastiness of irqbalance has been discussed before, and I =20
remembered having had issues in the past (5+ years ago) on my parisc =20
machines with that daemon. I couldn't find a pointer to a m-l thread, =20
I don't remember if I discussed that on IRC or elsewhere.

Anyway, turned out disabling irqbalance "fixed" the crash (and by =20
crash I mean HPMC). IIRC, the general idea is that when irqbalance =20
reroutes IRQ under heavy interrupt load, a race occurs by which one =20
interrupt request might end up delivered to the wrong CPU, HPMC'ing =20
the machine.

I have no particular opinion on whether it should be expected that =20
something as stupid as irqbalance could crash a system, but others =20
seem to believe it shouldn't (claiming "it works on *real* [read: x86] =
=20
hardware").

Now, I'm quite convinced that irqbalance could be one of the (major?) =20
cause of instability of the parisc autobuilders. AFAIU, they've =20
decided to disable it on their setup, maybe the situation will improve =
=20
there. Still, irqbalance is only the messenger, and I'm wondering =20
whether that apparent bug in our IRQ code could also be responsible =20
for other issues we're still having.

It's been a very long time since I last touched that code, and tbh I =20
never fully mastered it anyway, but I thought it'd be a good thing to =20
have a trace that this bug is still there, and maybe it will ring a =20
bell to others...

HTH

T-Bone

--=20
Thibaut Var=E8ne
http://www.parisc-linux.org/~varenet/--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
