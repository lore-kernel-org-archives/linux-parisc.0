Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id B79E84852
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Aug 2002 17:02:15 -0600 (MDT)
To: "Tobias Giesen" <tobias_subscriber@tgtools.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] So what about debconf? 
In-Reply-To: Message from "Tobias Giesen" <tobias_subscriber@tgtools.com>
   of "Sat, 24 Aug 2002 00:45:53 +0200." <002801c24af6$dbf85350$a80251d9@PLUTO>
References: <002801c24af6$dbf85350$a80251d9@PLUTO> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 23 Aug 2002 17:02:09 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020823230209.BC19B37F2E@carmen.fc.hp.com>
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

"Tobias Giesen" writes...

> Hello,
> 
> the other problem is even more puzzling for me: 
> 
> how do I get back into the text mode UI in order to select and install
> new packages? Somewhere in the archives it says "run debconf" but Debian
> did not install any executable file with that name.
> 
> Please, give me a hint! Currently, I'm just guessing package names and
> installing them using the apt-get command line ...

dpkg-reconfigure -plow foo

where foo is the package you want to reconfigure(-plow overrides the 
priority to low making sure it asks you all the questions). Read the man 
page for more details, in particular how to change the frontend(-ftype) and 
how to do all packages (--all).

To change your debconf preferences run

dpkg-reconfigure debconf

-- 
Matt Taggart
taggart@fc.hp.com
