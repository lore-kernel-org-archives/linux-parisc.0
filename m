Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.xs4all.nl (smtp1.xs4all.nl [194.109.127.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30A2F482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Sep 2001 04:47:21 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp1.xs4all.nl (8.9.3/8.9.3) with ESMTP id MAA24560
	for <parisc-linux@lists.parisc-linux.org>; Sat, 8 Sep 2001 12:47:16 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Sat, 8 Sep 2001 12:47:03 +0200
To: Randall Craig <randall@tdl.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] fork does not return signal with make
Message-ID: <20010908124703.A16017@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010908032736.A15589@tdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010908032736.A15589@tdl.com>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Sep 08, 2001 at 03:27:36AM -0700, Randall Craig wrote:
> I tried to do make config on the linux-2.4.9-pa17 kernel tree using the pa17
> kernel, which resulted in:
> 
> This is on a C240.
> 
> read(5, "parisc\n", 200)                = 7
> read(5, "", 193)                        = 0
> close(5)                                = 0
> wait4(-1, [WIFEXITED(s) && WEXITSTATUS(s) == 0], 0, NULL) = 389
> --- SIGCHLD (Child exited) ---
> rt_sigreturn(0)                         = 389
> rt_sigreturn(0)                         = 389
> (repeated many times)
> 
> Maybe one of you knows what is going on.
> 
I don't, but I can tell you I have the same problems on my C200 with the
same kernel - check out the whole 'Trace/breakpoint' thread.

Jurriaan
-- 
Besides, if a shitty disease and a rotten planet like this couldn't beat
us, a bunch of walking appliances with attitude isn't going to do it.
	Simon R Green - Deathstalker Honour
GNU/Linux 2.4.9-ac9 SMP/ReiserFS 2x1402 bogomips load av: 0.00 0.07 0.10
