Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id A460B482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Apr 2001 03:34:41 -0600 (MDT)
Received: from esiee.fr (pc5158a.esiee.fr [147.215.50.165])
	by mail.esiee.fr (Postfix) with ESMTP id 8B40CD15F7
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Apr 2001 11:34:28 +0200 (CEST)
Sender: delahaym@esiee.fr
Message-ID: <3AD18357.3E4AC5F6@esiee.fr>
Date: Mon, 09 Apr 2001 11:39:35 +0200
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Running Apache on PA-RISC Linux
References: <002d01c0c064$2ed7c890$05ffa8c0@artymiak8zws8i> <874rvyzvsv.fsf@rover.gag.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Bdale Garbee wrote:

> 
> Checking the Debian wanna-build database for hppa, it appears that
> 
>         apache is built and installed
> 
>         php3 and php4 failed to build, I haven't looked at why yet
> 
>         mysql failed to build because it at least needs config.sub/guess
>         updated to versions that understand hppa
> 

I tried to compile php4 for our website, and effectively it doesn't
work. It doesn't pass the ./configure.
If I remember well, it is connected to the fact that libutils doesn't
recognize the famous hppa-unknown-xxxx.
I think it was the same with mysql.

The only software problem we got in our http server is sometimes our 712
cannot handle swap and crash. 
But apache is not in fault. 
-- 
Matthieu Delahaye
ESIEE Team
http://mkhppa1.esiee.fr/en
