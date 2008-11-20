From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Thu, 20 Nov 2008 13:57:53 +0100
Message-ID: <7d01f9f00811200457v7589d731l787765553574276a@mail.gmail.com>
References: <49231FD0.9040409@gmx.de>
	 <1227061902.10371.11.camel@localhost.localdomain>
	 <20081119091327.GB3270@tilt.dandreoli.com> <49243DF1.2010206@gmx.de>
	 <492517F2.9060703@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "James Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "Helge Deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <492517F2.9060703@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Nov 20, 2008 at 8:55 AM, Helge Deller <deller@gmx.de> wrote:

> 2) To avoid possible cross-compiler bugs I built James's ion-config (with no
> modifications at all!) on the c3k natively. It booted yesterday nicely
> without any problems from local disk. Today, I booted the same kernel, again
> with no modifications or changes at all, just the same kernel which already
> was on the disk, and it brought up a Slab corruption:
[snip]
> My conclusion is:
> There is some problem somewhere.
> It does not show up always. Changing some kernel configuration may bring the
> bug up or it may not.
> James, I think if you reboot your ion machine a few times or modify some
> kernel configs, you probably will hit the bug as well.

Well on that topic, I've seen for a while (at least with 2.6.22.*) a
similar case where the same unmodified kernel binary would, from time
to time, fail to boot the machine (stuck with the timer_interrupt
delayed message). ISTR that happened most frequently on my A500-5X.
That may be something else, but the point is the symptom that "a given
kernel behaves differently across reboots" is not something new, if
that helps...

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
