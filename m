Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by dsl2.external.hp.com (Postfix) with ESMTP id E1BB9482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Apr 2001 19:50:03 -0600 (MDT)
Sender: bdale@rover.gag.com
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Running Apache on PA-RISC Linux
References: <002d01c0c064$2ed7c890$05ffa8c0@artymiak8zws8i>
From: Bdale Garbee <bdale@gag.com>
Date: 08 Apr 2001 19:49:52 -0600
In-Reply-To: <002d01c0c064$2ed7c890$05ffa8c0@artymiak8zws8i>
Message-ID: <874rvyzvsv.fsf@rover.gag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

workstations@poczta.onet.pl (Jacek Artymiak) writes:

> I'd like to run Apache/PHP/MySQL under PA-RISC Linux on my HP 712/100.  Is
> PA-RISC Linux stable enough to use it for that purpose or should I stick to
> HP-UX for now?

Checking the Debian wanna-build database for hppa, it appears that 

        apache is built and installed

        php3 and php4 failed to build, I haven't looked at why yet

        mysql failed to build because it at least needs config.sub/guess
        updated to versions that understand hppa

I haven't actually tried running apache yet, but I have no reason to expect
any problems.

Bdale
