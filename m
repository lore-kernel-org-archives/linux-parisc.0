From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [PATCH] HPPA : Define all the hppa specific _CLOEXEC and
 _NONBLOCK values
Date: Fri, 6 Aug 2010 17:03:14 +0200
Message-ID: <20100806170314.557db5b0@borg.bxl.tuxicoman.be>
References: <1281096124-27484-1-git-send-email-gmsoft@tuxicoman.be>
	<AANLkTi=3cdO86eCfXxoF3fPi2RjjTWHxFEoOLLLinXuq@mail.gmail.com>
	<20100806164400.385f383e@borg.bxl.tuxicoman.be>
	<AANLkTikquiwu1WjQ_b3KHkRzAmWMQxyMd0dViLJ_ZT94@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: libc-ports@sourceware.org, linux-parisc@vger.kernel.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTikquiwu1WjQ_b3KHkRzAmWMQxyMd0dViLJ_ZT94@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 6 Aug 2010 10:52:47 -0400
"Carlos O'Donell" <carlos@systemhalted.org> wrote:

> 
> Yes, it would be a better fix. However, I understand that this would
> be more work and you may not have much time as a volunteer. Are you
> interested in fixing this problem in a more general way? I would be
> willing to help champion such a patch on libc-alpha.

Sure, let me give it a try. I'll resend a patch going that way in a day
or two.

> It's getting a bit out of hand that each machine has to carry complete
> copies of all of these headers.

Yes I wasn't happy with the approach as well :)

Cheers,
  Guy
