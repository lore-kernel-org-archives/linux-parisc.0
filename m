Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail16.speakeasy.net [216.254.0.216])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F5C2482A
	for <parisc-linux@parisc-linux.org>; Thu,  8 Aug 2002 12:16:26 -0600 (MDT)
Date: Thu, 8 Aug 2002 11:20:36 -0700
From: Randolph Chung <tausq@debian.org>
To: Sean Anaya <sanaya@gr.hp.com>
Cc: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] Booting Debian on an HP C180 workstation
Message-ID: <20020808182036.GR8724@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20020730113848.GL29996@sleepie.demon.co.uk> <000001c23f07$56c7f0a0$4132260f@gr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000001c23f07$56c7f0a0$4132260f@gr.hp.com>
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

> So I finally had a chance to install Debian 3.0 on my C180XP. So far looks
> great, install was
> far easier than the 0.9.3 CD, and I'm not seeing any of the file system
> corruptions. However,
> I'm still fighting a couple of battles.

note that this is not the right forum for this kind of questions; please
use debian-hppa@lists.debian.org instead.

> 1) where do you find the keywords to packages to install with apt-get
> install <some package>?
>    ie apt-get install xfree86  doesn't seem to work. I'd like to get the ftp
> and telnet daemons
>    working so I can ftp and telnet into my box, as well as X window system.

apt-cache search <search regexp>

randolph
