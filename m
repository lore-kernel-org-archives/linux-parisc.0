Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63A554829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Mar 2003 16:46:35 -0700 (MST)
Subject: Re: [parisc-linux] Setting up Xfree86
From: Ryan Bradetich <rbradetich@uswest.net>
To: Rod Smart <snaketails@optushome.com.au>
Cc: PARISC Linux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3E66DCC8.24EC9CDA@optushome.com.au>
References: <3E66DCC8.24EC9CDA@optushome.com.au>
Content-Type: text/plain
Message-Id: <1046907993.996.3.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Date: 05 Mar 2003 16:46:34 -0700
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

Rod,

A couple of simple questions:

Are you sure that the graphics card in the C180 is supported?

	you can verify this by running fbset -i as root on the box.

If you have a supported graphics card, then try the following command: 
	dpkg-reconfigure xserver-xfree86


The mailing list archives should have some info on this also.

Thanks,

- Ryan



On Wed, 2003-03-05 at 22:29, Rod Smart wrote:
>     I have installed the Debian release onto my HP C-180, installed
> without any problems, but I need to setup XFree, I cannot find the usual
> configuration programs, even if I try (from memory)
> 
> xfree86 --config   (or is it --new)
> 
>     Well the option for configuring xfree86.
> 
>     I cannot find anything for configuring it.
> 
>     Please point me in the correct location.
> 
>     I can ssh into and out of the box without a problem, and networking
> is happily running.
> 
>     I have 768Megs of RAM on board so this I doubt will be an isue.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
-- 
Ryan Bradetich <rbradetich@uswest.net>
