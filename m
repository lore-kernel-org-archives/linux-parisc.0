From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [PATCH] HPPA : Define all the hppa specific _CLOEXEC and
 _NONBLOCK values
Date: Fri, 6 Aug 2010 16:44:00 +0200
Message-ID: <20100806164400.385f383e@borg.bxl.tuxicoman.be>
References: <1281096124-27484-1-git-send-email-gmsoft@tuxicoman.be>
	<AANLkTi=3cdO86eCfXxoF3fPi2RjjTWHxFEoOLLLinXuq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: libc-ports@sourceware.org, linux-parisc@vger.kernel.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=3cdO86eCfXxoF3fPi2RjjTWHxFEoOLLLinXuq@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 6 Aug 2010 10:34:12 -0400
"Carlos O'Donell" <carlos@systemhalted.org> wrote:
> 
> Is this because hppa doesn't use the same values as x86 and the only
> way to get your own values is to modify your own copies of said files?

As far as I can see, yes. Alpha is doing exactly the same thing.

Maybe a better fix would be to have glibc derive the value of all the
_CLOEXEC and _NONBLOCK from O_CLOEXEC and O_NONBLOCK instead of each
having its own copy. This is how they are defined in the kernel anyway.


Cheers,
  Guy
