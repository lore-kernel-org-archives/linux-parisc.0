From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: GCC 4.5 regression
Date: Fri, 18 Feb 2011 16:17:02 +0100
Message-ID: <20110218161702.225fc031@borg.bxl.tuxicoman.be>
References: <20110217201523.2da3b41a@zombie>
	<AANLkTinte7Msj3ZJBGH8bQ2_PYud76vOh0ojQb9etwT7@mail.gmail.com>
	<AANLkTimxw1_eK7v_tdKQa5nMw=d02jBdKnNOdUVe8oV_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Matt Turner <mattst88@gmail.com>, linux-parisc@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTimxw1_eK7v_tdKQa5nMw=d02jBdKnNOdUVe8oV_@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > http://bugs.gentoo.org/show_bug.cgi?id=340923
> >
> > It's known and fixed. It's not a gcc regression, nor is it
> > HPPA-specific (didn't you try to confirm that it was
> > HPPA-specific? :)

My mistake. I hardly come accross non-hppa specific bugs :)

> >
> > The reason you're hitting it is that you've keyworded gcc-4.5.2, but
> > aren't running a full ~hppa system. vapier doesn't seem to
> > acknowledge that this is a reasonable, sensible, or even common
> > configuration.
>
> that's because it is not.  there's a difference between running brand
> new bleeding edge versions of the toolchain on a stable system all the
> time and running them for the stabilization process.  inevitably every
> gcc/glibc/kernel header upgrade in ~arch breaks a shit ton of stable
> packages (and even unstable packages), the vast majority of which will
> be fixed by those packages stabilizing a new version as natural
> progression by the time the toolchain versions have settled for
> stabilization.
> -mike

Kinda makes sens but it's probably not the right list to
discuss.

In any case, thanks everybody for the feedback. I'm quite happy this is
not a gcc issue !

  Guy

