From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: Aw: Re: Re: Re: HP c8000 linux install issues, troubles and questions
Date: Sun, 3 Apr 2016 08:39:15 +0200
Message-ID: <CACrbsaAaTdMvm=SP1+SSSuCk_2M3qUGeJ9z2SWa39XLjRnS3Sw@mail.gmail.com>
References: <CACrbsaC7KnupAXvon-PRWTXnAZ13Hb5Xmc3364aVivY4HGCC6Q@mail.gmail.com>
	<4207644.uZSTasQYhb@caliban.sf-tec.de>
	<trinity-a1bc4683-085f-4f5b-870e-03082f9b89ba-1459237701367@3capp-gmx-bs02>
	<CACrbsaC_gOAmUixFoE+rXf-TFT0P6VEEDT-2txig09QgzC6iOQ@mail.gmail.com>
	<trinity-d7ee1960-e99b-416c-bd06-9a3e7bf998bc-1459245685774@3capp-gmx-bs62>
	<56FA7786.6070100@gmx.de>
	<56FA77FB.6090406@gmx.de>
	<CACrbsaD5qP5e99=47j4E+-vq0V1DKDytqzHVakHeH7DJ_-K+5w@mail.gmail.com>
	<trinity-13a381d1-e1fb-42af-8cd9-4197fe95fdfd-1459331985395@3capp-gmx-bs41>
	<E1592B17-FA77-42CC-A08F-331C63DE3408@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Helge Deller <deller@gmx.de>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <E1592B17-FA77-42CC-A08F-331C63DE3408@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

In my - very limited, just one c8000 - experience, the CPU upgrade is
a successfull move: I have upgraded from one to two PA-8800:

-----------------------------------------------------------------------=
-------
   (c) Copyright 1995-2004, Hewlett-Packard Company, All rights reserve=
d
-----------------------------------------------------------------------=
-------

  Processor   Speed            State           CoProcessor        Cache=
 Size
  Number                                       State              Inst =
   Data
  ---------  --------   ---------------------  -----------------  -----=
-------
      0      1000 MHz   Active                 Functional         32 MB=
/32 MB
      1      1000 MHz   Idle                   Functional         32 MB=
/32 MB
      2      1000 MHz   Idle                   Functional         32 MB=
/32 MB
      3      1000 MHz   Idle                   Functional         32 MB=
/32 MB

The two CPUs MUST be of the same model, have the same clock frequency
AND have the same revision number. I strongly suspect that HP has
produced "equal" CPUs but with different revision number.

I had the very same issue restoring and upgrading a DELL 690, a dual
Xeon "Gro=C3=9Frechner " with 1100Watt power supply. The two Xeon must =
be
"matched" otherwise the BIOS refuse to start the booting process.

I have recently bough two PA-8800 on ebay and the supplier has sent to
me two different CPUs! Looking the integrated heat sink, there are two
models: the plain "clear alluminium" and the "satinated copper". My
c8000 was equipped with a single "satinated copper" CPU, so I chose
the identical one and, with the help of a very skilled technician
equiped with the right screwdrivers, I have successfully completed the
upgrade: everythings works perfectly with HP-UX v11 and Linux Debian
8.0 kernel :

Linux version 4.4.0-1-parisc64-smp (debian-kernel@lists.debian.org)
(gcc version 4.9.3 (GCC) ) #1 SMP Debian 4.4.6-1 (2016-03-17)

If you need, I can dump the CPUs revision numbers. With the help of
Helge, I'm putting the results of my jurney in the c8000 territory on
a dedicated wikipage: searching in the maling list messages can be
very frustrating, expecially for a newbie like me.

Now, I'm fighting with the video cards initializiation failure: I
strongly suspect that the problem is not inside the (kernel) video
driver module because both "nouveau" (NVIDIA) and "radeon" (ATI)
produce exactly the very same error message and switch back to
"passive" frame buffer mode.

 Simone Mannori - Italy


On 2 April 2016 at 23:48, John David Anglin <dave.anglin@bell.net> wrot=
e:
> On 2016-03-30, at 5:59 AM, Helge Deller wrote:
>
>>> Now, I'm fighting with a very hardware issue: the screws of the PA
>>> CPUs are non standard hex with a center pin. I hate this things.
>>> Yesterday evening I was ready to upgrade from a single PA-8800/900 =
MHz
>>> to a dual PA-8900/1GHz
>>
>> I'm not sure if this will simply work. I was looking at the idea mys=
elf
>> once, and googling for that it seems that some firmware update needs=
 to
>> be done in order for the machine to accept the additional CPU.
>> If you do it, please let us know...
>
> I had to replace cpu in my rp3440.  I asked vendor if it would be pos=
sible to increase speed
> from 800 MHz and they said no.  I think it's possible to add a second=
 cpu but don't have any
> personal experience.  The machine did run with one cpu module.
>
> The screws are a pain...
>
> Dave
> --
> John David Anglin       dave.anglin@bell.net
>
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
