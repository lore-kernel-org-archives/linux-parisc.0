From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Reproducible kernel panic using gdb
Date: Mon, 28 Oct 2013 22:06:03 -0700
Message-ID: <1383023163.19537.3.camel@dabdike.int.hansenpartnership.com>
References: <b6f8076c32d0859e4ddb328bb7aca076@tuxicoman.be>
	 <trinity-f177b623-5ca9-4417-a689-b0f8676e3fb5-1382711499524@3capp-gmx-bs08>
	 <650fc503e24cdb24b5cc286aec329df6@tuxicoman.be>
	 <1382970655.2161.2.camel@dabdike.int.hansenpartnership.com>
	 <2125d8be63f7f5801abba4e67182d2e7@sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2125d8be63f7f5801abba4e67182d2e7@sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On Mon, 2013-10-28 at 16:08 +0100, Rolf Eike Beer wrote:
> James Bottomley: wrote
> > On Mon, 2013-10-28 at 10:00 +0100, Guy Martin wrote:
> >> Hi Helge,
> >> 
> >> >
> >> > Works without crash for me on 3.12-rc6 ?
> >> > Linux ls3011 3.12.0-rc6-64bit+
> >> >
> >> > Since you run 3.10.6, maybe updating the kernel might help.
> >> > Esp. this patch, which has been backported to kernel 3.10 (and is in
> >> > 3.10.17):
> >> > http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?h=linux-3.10.y&id=77587e89405f5d8225a0e750df254bcc2dcb73e1
> >> 
> >> Still the same problem with 3.12-rc6 here :
> > 
> > What system and CPU?
> 
> C8000

I tried this on a rp3440  (pa8800) and I can't reproduce.  I think it
might be something about the way the kernel is compiled.  The (null)
values for rp2 and IOAQ[0] look suspicious.

James



