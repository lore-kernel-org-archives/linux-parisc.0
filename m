Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50398489D
	for <parisc-linux@parisc-linux.org>; Sat, 29 Sep 2001 07:26:10 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id EACC4B00C; Sat, 29 Sep 2001 14:24:18 +0100 (BST)
Date: Sat, 29 Sep 2001 14:24:18 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Jurriaan Kalkman <Jurriaan.Kalkman@zrt.nl>
Cc: parisc-linux@parisc-linux.org, nick@snowman.net
Subject: Re: Betr.: [parisc-linux] HP C180
Message-ID: <20010929142418.N5051@linuxcare.com>
References: <sbb19d1e.060@ms-zrt1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <sbb19d1e.060@ms-zrt1>; from Jurriaan.Kalkman@zrt.nl on Wed, Sep 26, 2001 at 08:56:08AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Sep 26, 2001 at 08:56:08AM +0200, Jurriaan Kalkman wrote:
> >My c180 is now happily booting (current CVS kernel), however whenever I
> >try to ls some dirs (no all, this example is from /usr/bin) I get errors
> >along these lines
> >ls: memory exhausted

I had this with 2.4.9, turned out I'd booted a root fs with old libc6
installed.  When I rebooted using a current libc6 the problem went away.

Richard
