Received: from main.suntel-lems.ro (root@main.suntel-lems.ro [194.102.106.1])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id AAA18063
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 00:34:42 -0700
Message-ID: <006001c05456$febb1cd0$6811620a@sigxcpu>
From: "Alexandru Pirvulescu" <Pirvulescu_Alexandru@telemobil.ro>
To: "Alex deVries" <adevries@linuxcare.com>,
        "Grant Grundler" <grundler@cup.hp.com>
Cc: <parisc-linux@puffin.external.hp.com>
References: <200011211855.KAA20167@milano.cup.hp.com> <3A1B2F27.D08EC2AF@linuxcare.com>
Subject: Re: [parisc-linux] case LEDs
Date: Wed, 22 Nov 2000 09:36:58 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

I think that the heartbeat LED is software because it starts with the kernel
boot and if the kernel stops the LED stops
blinking too. Is better to implement a software monitoring tool because you
have to watch the software for hanging.

Alex

PS. There is a function in the kernel source in
linux/arch/parisc/kernel/process.c named machine_heartbeat(). Any connection
with the heartbeat from the chassis?


----- Original Message -----
From: "Alex deVries" <adevries@linuxcare.com>
To: "Grant Grundler" <grundler@cup.hp.com>
Cc: "Alexandru Pirvulescu" <Pirvulescu_Alexandru@telemobil.ro>;
<parisc-linux@puffin.external.hp.com>
Sent: Wednesday, November 22, 2000 4:27 AM
Subject: Re: [parisc-linux] case LEDs


> Grant Grundler wrote:
> > Yes.
> > I was already asked this weekend to dig up technical info on LED
> > and soft power control. I guess this is my reminder to do that. :^)
>
> Isn't there a PDC call (pdc_chassis?) to do this?  Or is the heartbeat
> LED done by hardware?
>
> - Alex
>
> --
> Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
> 613.562.2759 tel
> alex@linuxcare.com, http://www.linuxcare.com/
> Linuxcare, Support for the revolution.
>
>
