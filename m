Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bob.ncssm.edu (bob.ncssm.edu [152.34.37.42])
	by dsl2.external.hp.com (Postfix) with SMTP id 40EC6482C
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Dec 2001 20:46:44 -0700 (MST)
Date: Mon, 3 Dec 2001 22:43:14 -0500 (EST)
From: Phil Anderson <andersop@neverland.ncssm.edu>
To: <joel.soete@freebel.net>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Kernel 2.4.16-pa10
In-Reply-To: <1007405071.3c0bc80fe2d29@webmail.tiscalinet.be>
Message-ID: <Pine.LNX.4.33.0112032239490.1252-100000@bob.ncssm.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi.

This invalid scan problem suggests to me that the box is putting out a
resolution/frequency that the monitor cannot support. The banner in the
muddle of the screen is a monitor on-screen-display error. I don't know
about B180's but on my 712 this happened. In the boot loader firmware you
should be able to select resolutions -- I booted it on another monitor,
lovered the frequency and resolution, then switched back to the first
monitor. So, i don't think that's a problem with the kernel, rather the
settings of the box's STI and the limitations of the monitor you're using.

-phil



On Mon, 3 Dec 2001 joel.soete@freebel.net wrote:

> Hi all,
>
> The kernel 2.4.16-pa10 run roughtly on my B180 (not yet tested on 712)
> But STI console semms broken:
> A large banner with "INVALID SCAN FREQ." in the middle of the screen and in
> background something like parasitical tv reception (white line scanning
> screen)... After some minutes it stop?
> Thanks in advance for help,
>         Joel
>
> -------------------------------------------------
> This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

-- 
===============================================================================

Phil Anderson
UNIX Systems Administrator
andersop@neverland.ncssm.edu
The_13th_Ewok@hotmail.com

"Go CRAZY? Don't mind if I do! Woowoowoowoo!" -Homer Simpson
