From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] AD1889 Support (yes it's there!)
Date: Sun, 26 Jun 2005 10:29:07 +0200
Message-ID: <200506261029.07942.deller@gmx.de>
References: <20050626022615.15d0ccbb@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050626022615.15d0ccbb@Tatooine.r3z0>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Thibaut.

Congratulations for this big sucess !

I just tried the driver and I think I found a small bug:
- Using xmms (with OSS output driver)
- Headphones connected to the Headphone connector (PhoneOut)
- start playing -> sound starts

Now:
- start on a console "aumix"
- play around with the "Pcm" slider
- when moving this slider from 0-100% it seems to be doubled. 
  You will get the same loadness in the 0-50% range as in the 51-100% range, which means maximum loadness is at 49% and 99%.

Best regards,
Helge

On Sunday 26 June 2005 02:26, Thibaut VARENE wrote:
> Some of you have been wondering whether they'll be able to enjoy quality
> music playback on their AD1889-enabled PA-RISC machines one of these days
> (BCJ-X000 class machines, basically).
> 
> Well, be happy, dance around, that day has come! ;)
> 
> The recent commits to the CVS have brought in a now really decent AD1889
> driver, supporting full duplex playback and capture.
> 
> It works absolutely fine in OSS emulation mode. So far we have a bug with
> the ALSA native mode, which produces unintelligible sound.[1]
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
