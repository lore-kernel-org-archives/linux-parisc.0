From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [PATCH] HPPA : Define all the hppa specific _CLOEXEC and
 _NONBLOCK values
Date: Fri, 6 Aug 2010 17:25:48 +0200
Message-ID: <20100806172548.213ac500@borg.bxl.tuxicoman.be>
References: <1281096124-27484-1-git-send-email-gmsoft@tuxicoman.be>
	<AANLkTi=3cdO86eCfXxoF3fPi2RjjTWHxFEoOLLLinXuq@mail.gmail.com>
	<20100806164400.385f383e@borg.bxl.tuxicoman.be>
	<AANLkTikquiwu1WjQ_b3KHkRzAmWMQxyMd0dViLJ_ZT94@mail.gmail.com>
	<AANLkTimjv3VHVVty_0fA3A1hCNVL-of3Oujj0cf8kwwu@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "Carlos O'Donell" <carlos@systemhalted.org>,
	libc-ports@sourceware.org, linux-parisc@vger.kernel.org
To: Matt Turner <mattst88@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTimjv3VHVVty_0fA3A1hCNVL-of3Oujj0cf8kwwu@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 6 Aug 2010 11:20:32 -0400
Matt Turner <mattst88@gmail.com> wrote:

> On Fri, Aug 6, 2010 at 10:52 AM, Carlos O'Donell
> <carlos@systemhalted.org> wrote:
> > On Fri, Aug 6, 2010 at 10:44 AM, Guy Martin <gmsoft@tuxicoman.be>
> > wrote:
> >> On Fri, 6 Aug 2010 10:34:12 -0400
> >> "Carlos O'Donell" <carlos@systemhalted.org> wrote:
> >>>
> >>> Is this because hppa doesn't use the same values as x86 and the
> >>> only way to get your own values is to modify your own copies of
> >>> said files?
> >>
> >> As far as I can see, yes. Alpha is doing exactly the same thing.
> >>
> >> Maybe a better fix would be to have glibc derive the value of all
> >> the _CLOEXEC and _NONBLOCK from O_CLOEXEC and O_NONBLOCK instead
> >> of each having its own copy. This is how they are defined in the
> >> kernel anyway.
> >
> > Yes, it would be a better fix. However, I understand that this would
> > be more work and you may not have much time as a volunteer. Are you
> > interested in fixing this problem in a more general way? I would be
> > willing to help champion such a patch on libc-alpha.
> >
> > It's getting a bit out of hand that each machine has to carry
> > complete copies of all of these headers.
> >
> > Cheers,
> > Carlos.
> 
> I think we'd be interested in doing something like this for alpha as
> well.
> 
> Matt


It seems that sparc is doing the same as well.
I'll produce a patch for glibc and glibc-ports that cleans this up.

Cheers,
  Guy
