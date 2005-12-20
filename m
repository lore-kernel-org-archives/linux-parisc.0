From: Fabio Bizzi <fbizzi@bizzi.org>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Tue, 20 Dec 2005 08:49:40 +0100
Message-ID: <43A7B794.1060409__17788.4300509051$1416624579$gmane$org@bizzi.org>
References: <43971676.1010009@gmail.com> <200512191639.44027.deller@gmx.de> <43A6F709.3080008@bizzi.org> <200512192104.48593.deller@gmx.de> <20051219202705.GR2361@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20051219202705.GR2361@parisc-linux.org>
Resent-Message-ID: <Op9Xp.A.QwH.Ye7pDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Matthew Wilcox wrote:
>>(I assume a B180 might be close to your c200 ?).
> 
> Unfortunately not.  The B180 build has CCIO disabled, so it's much less
> useful than it might otherwise be.  I keep threatening to rename the
> b180_defconfig to c110_defconfig and enable CCIO, HPPB, ZALON, LASI_82596,
> HIL, MUX and HARMONY.

Thank you, but I'm a bit cunfused, what is the kernel image that best 
suit my C200? (I've understand that 64Bit kernel is only useful if I 
have more than 3GB of RAM, so 32Bit kernel with working front-led is 
wonderfull for me! :) )

Thank You again.

Ciao.

	Fabio.


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
