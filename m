Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.web.de (smtp03.web.de [217.72.192.158])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98263485C
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Dec 2002 11:10:16 -0700 (MST)
Received: from c-180-204-153.n.dial.de.ignite.net ([62.180.204.153] helo=web.de)
	by smtp.web.de with asmtp (WEB.DE(Exim) 4.93 #1)
	id 18K0Ru-0002Hv-00
	for parisc-linux@lists.parisc-linux.org; Thu, 05 Dec 2002 19:10:11 +0100
Message-ID: <3DEF967B.8B7F68AA@web.de>
Date: Thu, 05 Dec 2002 19:10:03 +0100
From: "b.gunreben" <b.gunreben@web.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: GNU/Libc 2.3.1 on HP-PARISC requires >= 2.4.19
 kernel.
References: <200212051650.gB5GoG7d003199@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii
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

John David Anglin wrote:
> 
> > Hi, my name is Carlos, and I cause all your nightmares with glibc on
> > HPPA :)
> > [...]
> > I recommend that you _do_ _not_ upgrade glibc on HPPA until 2.3.1-6.
> 
> Being perverse, I tried installing 2.3.1-5.  I hit the same problem
> that Joel mentioned previously, the old dynamic loader doesn't define
> GLIBC_PRIVATE.  I was trying to install glibc privately in a prefix of
> my selection.  I have been using LD_LIBRARY_PATH to select my library
> path.  However, this no longer works since all system binaries are
> linked using /lib/ld.so.1 and it isn't compatible with the 2.3.1
> libraries.  Is there a way around this?

Well, I don't think it is perverse. I have already more than 10 days
uptime with a machine, that runs completely with 2.3.1 (and this machine
was only for about 13h idle).

In order to run with the new ld.so, you may try the following:

<prefix>/lib/ld.so.1 --library-path <prefix>/lib:<prefix>/usr/usr/lib
command

or you set up a chroot system with all needed programs.

Berthold
