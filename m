Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A76D4843
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 08:49:47 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i16Fnqa07789; Fri, 6 Feb 2004 10:49:52 -0500
Subject: Re: [parisc-linux] Re: Install GNOME on 712/80
From: James Bottomley <James.Bottomley@steeleye.com>
To: Jens Simmoleit <simmel@anymotion.de>
In-Reply-To: <009801c3ecc6$d637d990$8100a8c0@punk>
References: <02d601c3ebef$e3241650$8100a8c0@punk>
	<200402060007.27911.deller@gmx.de>
	<009801c3ecc6$d637d990$8100a8c0@punk>
Content-Type: text/plain
Date: 06 Feb 2004 10:49:42 -0500
Message-Id: <1076082583.1823.23.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
	debian-hppa@lists.debian.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, 2004-02-06 at 10:35, Jens Simmoleit wrote:
> But now something strange happens, I type in my user and the password at the
> gnome desktop login, the screen turns black and after a certain amount of
> time the box comes back with the Gnome login prompt (where I started from)?

Gnome is a known consumer of colour resources, and it's applications
aren't very graceful when they run out (as they do with our 8 bit
framebuffer), it could be that you are simply running out of them.

You can use a true colour visual at this depth (the colours are pretty
ratty, but at least you never run out) by adding

Visual "TrueColor"

To the SubSection "Display" part that covers you.

James
