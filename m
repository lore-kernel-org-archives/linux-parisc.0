Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6FEAC482A
	for <parisc-linux@parisc-linux.org>; Sun,  3 Jun 2001 11:40:34 -0600 (MDT)
Date: Sun, 3 Jun 2001 12:41:46 -0500 (CDT)
From: <djweis@sjdjweis.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Failed boot on D310
In-Reply-To: <20010603145716.J25745@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0106031239020.10748-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 3 Jun 2001, Richard Hirst wrote:
> On Sun, Jun 03, 2001 at 08:33:23AM -0500, djweis@sjdjweis.com wrote:
> > I've got a D310 with a 100mhz processor and 128 megs of RAM. I tried to
> > boot the ISO version 0.9 last night, but it crashed on boot. I can get the
> > exact error messages, it looked like a register dump. 
> > 
> > Is there any reason to assume that this will or won't boot?
> Listed as untested on http://parisc-linux.org/release-0.9/systems.html
> Are you trying the serial or sti image?  If you can use serial, and
> get you terminal emulator to capture the boot messages and crash for us,
> that would help.

It's headless, I was using the serial image. Below is my terminal output

Main Menu: Enter command > search
Searching for potential boot
device(s)...                                       This may take several
minutes.                                                                                                                                  To
discontinue search, press any key (termination may not be
immediate).                                                                                                                                                                           Path
Number        Device Path (dec)        Device Type
-----------        -----------------        -----------
P0                 4.5                      Random access media
P1                 4.11                     Random access media
P2                 4.10                     Random access media
P3                 4.9                      Random access media
P4                 4.8                      Random access media
P5                 16/5.2                   Random access media
P6                 16/5.0                   Sequential access media
P7                 16/6.0                   LAN Module
Main Menu: Enter command > boot P5
Interact with IPL (Y or N)?> n

Booting...                                                                      
Boot IO Dependent Code (IODC) revision 1
WARN 80F9
Cannot find ENTRY_TEST.
WARN 80F7
         Failed I/O operation with
ENTRY_IO
Status = -4                                                                     

00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00004001 00000028 E8040782 01000084 800400DC 00000000 0025F040 00000000
98080000 0000DA2C 0000DA2C 00000000 00000002 00000003 00000011 00000005
WARN C7F0
Error Reading IPL

Thanks for any help.

dave


-- 
Dave Weis             "I believe there are more instances of the abridgement
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent 
                      and sudden usurpations."- James Madison
