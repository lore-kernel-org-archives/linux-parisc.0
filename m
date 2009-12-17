From: dann frazier <dannf@dannf.org>
Subject: Re: vfork test case.
Date: Thu, 17 Dec 2009 09:45:16 -0700
Message-ID: <20091217164516.GD10487@lackof.org>
References: <4B294F8B.1070700@gmx.de> <20091216213505.DE6EE537C@hiauly1.hia.nrc.ca> <119aab440912170624p58d6f19fk9e6feaab11f6f1a3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Helge Deller <deller@gmx.de>, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org, kyle@mcmartin.ca,
	James.Bottomley@hansenpartnership.com
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912170624p58d6f19fk9e6feaab11f6f1a3@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 17, 2009 at 09:24:05AM -0500, Carlos O'Donell wrote:
> On Wed, Dec 16, 2009 at 4:35 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> >> On 12/15/2009 11:21 PM, John David Anglin wrote:
> >> >> I have constructed a vfork test case which shows some of the problems
> >> >> I have using vfork reliably. This fails every time on my PA8700 system
> >> >> running 2.6.32-rc6. It appears as though r28 (ret0) in the parent is
> >> >> being corrupted.
> >> >
> >> > The test doesn't fail on two of my builds:
> >> > Linux mx3210 2.6.31.7 #5 Wed Dec 9 22:49:53 EST 2009 parisc64
> >> > Linux hiauly6 2.6.31.7 #18 Wed Dec 9 21:34:36 EST 2009 parisc
> >>
> >> I did tested your testcase on my c3000 too but it didn't failed for me either.
> >> This was on some 2.6.32-rc candidate.
> >
> > I think it must be because Carlos is building SMP kernels.
> 
> Yes, I'm trying to shake out some SMP bugs.
> 
> Dan, you said that the emacs32 failure went away when you upgraded to
> 2.6.32 stable on the buildds. Are they running SMP kernels?

Nope. When I initially took over these buildds I tried SMP kernels and
found them to be far less stable, so we're sticking w/ UP.

That means that some emacs23 build attempts may have been on SMP, but
most were not. Kernel versions should be available in the build logs.
smp kernels should all have 'smp' in their uname output.

> Could you try the vfork test case there?

dannf@penalosa:/tmp$ cat /proc/version
Linux version 2.6.32-trunk-parisc64 (Debian 2.6.32-1) (waldi@debian.org) (gcc version 4.3.4 (GCC) ) #1 Tue Dec 8 04:07:32 UTC 2009
dannf@penalosa:/tmp$ gcc -O1 -g -o vfork-01 vfork.c
dannf@penalosa:/tmp$ gcc -O0 -g -o vfork-00 vfork.c
dannf@penalosa:/tmp$ ./vfork-01
child != 0
child is 0x10c8
dannf@penalosa:/tmp$ total 28
-rwxr-xr-x 1 dannf Debian  9333 Dec 17 16:41 vfork-00
-rwxr-xr-x 1 dannf Debian 10383 Dec 17 16:40 vfork-01
-rw-r--r-- 1 dannf Debian   380 Dec 17 16:40 vfork.c

dannf@penalosa:/tmp$ ./vfork-00 
child != 0
child is 0x1101
dannf@penalosa:/tmp$ total 28
-rwxr-xr-x 1 dannf Debian  9333 Dec 17 16:41 vfork-00
-rwxr-xr-x 1 dannf Debian 10383 Dec 17 16:40 vfork-01
-rw-r--r-- 1 dannf Debian   380 Dec 17 16:40 vfork.c

> Test case is here:
> http://article.gmane.org/gmane.linux.ports.parisc/2403
> 
> Cheers,
> Carlos.
> 

-- 
dann frazier

