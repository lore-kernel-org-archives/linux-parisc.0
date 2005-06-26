From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] AD1889 Support (yes it's there!)
Date: Sun, 26 Jun 2005 14:46:33 +0200
Message-ID: <20050626144633.56c99909@Tatooine.r3z0>
References: <20050626022615.15d0ccbb@Tatooine.r3z0>
	<200506261029.07942.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <T-Bone@parisc-linux.org>
In-Reply-To: <200506261029.07942.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 26 Jun 2005 10:29:07 +0200
Helge Deller <deller@gmx.de> wrote:

> Hello Thibaut.
> 
> Congratulations for this big sucess !
> 
> I just tried the driver and I think I found a small bug:
> - Using xmms (with OSS output driver)
> - Headphones connected to the Headphone connector (PhoneOut)
> - start playing -> sound starts
> 
> Now:
> - start on a console "aumix"
> - play around with the "Pcm" slider
> - when moving this slider from 0-100% it seems to be doubled. 
>   You will get the same loadness in the 0-50% range as in the 51-100%
>   range, which means maximum loadness is at 49% and 99%.

Good catch, that's indeed another known "feature", all sliders (aside the
Master ones) wrap around at 50%. It's actually quite strange because these
sliders control the AC97 codec which is well documented (it's an AD1819),
and which is out of the scope of this driver (we don't implement our own
mixer). Actually, this is handled directly by the ALSA layer. So maybe the
hardware is not compliant with the specs, or maybe there's some knob
missing, yet, it didn't seem to me like a big deal :)

For the curious people, the difference between the "Master" knobs and the
others, according the the AD1819 codec doc, is that Masters range from 0
to -46.5dB as the value written to register goes from 0x0000h to 0x1F1F
(left is bits 13-8, right is 5-0), and any bigger value doesn't change the
attenuation.

For the other knobs, otoh, the range is +12dB to -34.5dB for left/right,
with the following scheme: 0x0000 is +12dB, 0x0808 is 0dB and 0x1F1F is
-34.5dB. What seems to happen in our case, is that the hardware doesn't
implement the "gain" range, contrary to what the doc says.

Again, this is a well known AC97 codec (AD1819), well documented,
and supported by the ALSA layer, so if you can make sense of what happens,
maybe we could see what's wrong. :)

I'll add that to the wiki.

One last hint (which is on the wiki):

There's no such thing as separate volume control for Phones and Line Out.
Phones is just an amplified wiring of Line Out, and both are
simultaneously controlled by "Master". The internal speaker volume is
controlled by Master Mono.

HTH

Thibaut VARENE
The PA/Linux Team
http://www.pateam.org/
