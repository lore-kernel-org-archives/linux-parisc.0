Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E209F482A
	for <parisc-linux@parisc-linux.org>; Sun, 21 Oct 2001 14:21:20 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15vP5z-0006Qk-00; Sun, 21 Oct 2001 21:21:19 +0100
Date: Sun, 21 Oct 2001 21:21:18 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] small patch for cpu_idle?
Message-ID: <20011021212118.G31505@parcelfarce.linux.theplanet.co.uk>
References: <20011021105227.H537@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011021105227.H537@tausq.org>; from randolph@tausq.org on Sun, Oct 21, 2001 at 10:52:27AM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Oct 21, 2001 at 10:52:27AM -0700, Randolph Chung wrote:
> It appears to me that our cpu_idle is not quite right... what do you
> guys think about this:
>         while (1) {
> -               while (!current->need_resched) {
> -               }
> +               while (!current->need_resched) 
> +                       continue;
>                 schedule();
>                 check_pgt_cache();
>         }
> 
> otherwise when cpu_idle gets called we might get stuck in an inf loop
> (which happens, for example, when fsck requires manual intervention on
> startup).

I don't see any difference between

while (foo) { }

and

while (foo) continue;

need_resched is volatile:
        volatile long need_resched;

so I don't see that your change should have any effect.  Does it actually
generate different code?

-- 
Revolutions do not require corporate support.
