From: John David Anglin <dave.anglin@bell.net>
Subject: Re: PCI video card hangs during system boot
Date: Thu, 14 Apr 2016 12:19:28 -0400
Message-ID: <570FC310.2050000@bell.net>
References: <CACrbsaAVBQw5zSiuS9xYo+vuP8sFk1a94FSXVz_sRGkMP+60Jg@mail.gmail.com>
 <1587186.CtnrnCsSzp@caliban.sf-tec.de> <570D38BF.7040307@bell.net>
 <CACrbsaBBT20+_GtJD3XMxob7Pz+mhdw7BE0h3uQSpKq-VSOHYA@mail.gmail.com>
 <570E5F69.4010203@bell.net>
 <CAFk90B_oAkq=JD0msjm2ZM2oZWAUd6yqh-XnC1Kk4HKHGOBt0w@mail.gmail.com>
 <4E86DE96-4108-41F1-872C-F7E04075466A@bell.net>
 <CACrbsaBOV3vqbwRp1i2aXA0FqgMGbuw_-9KnudnVjSwo-SW2Xg@mail.gmail.com>
 <570FB039.8040109@bell.net>
 <CACrbsaDJ2PCAh3KBV=T1Cwi4JxtV31bPJw-PireiZW6W51qCmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Graham Gower <graham.gower@gmail.com>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>
To: Simone Mannori <simone.mannori@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CACrbsaDJ2PCAh3KBV=T1Cwi4JxtV31bPJw-PireiZW6W51qCmg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-04-14 11:54 AM, Simone Mannori wrote:
> Very interesting and useful info, but they don't help us to fix the basic issue.
>
> We have several AGP cards able to work correctly BUT in passive frame
> buffer only mode, therefore the c8000, a quite fast quad core
> workstation , with X11, looks like a bradypus instead that a
> velociraptor.
>
> This is the moment to recompile a custom kernel with some printk.
>
I tried this a year or so ago.  I pretty much convinced myself that the 
firmware loaded
correctly, and that read and write operations seemed to work. However, I 
wasn't able
to find why the the ring buffer test failed.  I also checked that the 
firmware was identical
to that used on hpux.

There is an ATI document somewhere on the register interface.

I understand your frustration.

Dave

-- 
John David Anglin  dave.anglin@bell.net

