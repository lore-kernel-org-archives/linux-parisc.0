Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 44D74482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 16:36:20 -0600 (MDT)
To: Christian Suder <csuder@cisco.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 0.9.2 missing compiler ? 
In-Reply-To: Your message of "Tue, 17 Jul 2001 15:25:21 PDT."
             <3B54BB51.8CF43B05@cisco.com>
References: <3B54BB51.8CF43B05@cisco.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Jul 2001 16:35:55 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010717223555.D5DD037CB4@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Christian Suder writes...

> Hi,
> 
> I installed 0.9.2 on a 712/80, installation went nicely but there's no
> gcc installed. :-( Appears there is no such package on the CD. There is
> a package on the 9.0 CD (which failed to install any packages.....) but
> I can't figure out how to get that installed. Tried "apt-get install
> ./<filename>" but get an error message about python-zlib !?!?  I'm not
> Debian-literate, so how do I get the compiler ?

man apt-get
man sources.list
vi /etc/apt/sources.list
apt-get update
apt-get install gcc

Reply if you still need help after that.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
