Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 5EF734851
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Jul 2002 18:36:28 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Dimitris Zilaskos <dzila@tassadar.physics.auth.gr>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] x windows keybord problem on 715/33
Date: Fri, 12 Jul 2002 02:36:01 +0200
References: <Pine.LNX.4.44.0207111849360.32161-100000@tassadar.physics.auth.gr>
In-Reply-To: <Pine.LNX.4.44.0207111849360.32161-100000@tassadar.physics.auth.gr>
MIME-Version: 1.0
Message-Id: <200207120235.11571.deller@gmx.de>
Content-Type: text/plain;
  charset="iso-8859-1"
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

Hi Dimitris,

please read ftp://ftp.parisc-linux.org/XFree86/HILkeyb/README

In any case I would suggest you update to a newer kernel.
HIL mice are now supported, and you won't have any bigger problems 
on the console or under X. Just be sure to create the /dev/input/*
device nodes as described in the FAQ entry no. 12 at 
http://www.parisc-linux.org/faq/index.html

The 100% cpu usage for softirqd is a known problem, but
it's just cosmetics and will not slower your machine.
I think we will fix this buglet in the future.

Greetings,
Helge

On Thursday 11 July 2002 17:50, Dimitris Zilaskos wrote:
>  Hello ,
>
> I am trying to setup X windows in an 715/33 . I can start various Windows
> managers like wdm and xdm , but i cant get keys 'i' and 'o' to work (
> they work ok in console ).All other keys work ok .
>
>  I have the following lines in the XF86Config
>
>    Option "XkbdRules" "xfree86"
>    Option "XkbModel" "hphil"
>
>
>  and in my  /etc/X11/xkb/rules/xfree86:
>      hp = xfree86 pc(pc104)
>      hphil = hp(hil) hp(hil)
>
>  I am running 2.4.18-pa41 . Newer kernels till 54 either freeze my
> keyboard or have ksoftirqd consume 100% cpu ( or both) . I am using a
> serial  mouse for X . It works  most of the time but sometines the pointer
> stops moving untill I press a key . Work ok under console though .
>
>  Any advice how to make 'o' and 'i'  work ?
>
>  Regards ,
> --
> ===========================================================================
>==
>
> Dimitris Zilaskos
>
> Department of Physics @ Aristotle Univercity of Thessaloniki , Greece
> ===========================================================================
>==
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
