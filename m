Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc3-hem11-4-cust111.brnt.cable.ntl.com [213.107.179.111])
	by dsl2.external.hp.com (Postfix) with ESMTP id A2F254829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Apr 2003 13:49:51 -0600 (MDT)
Date: Sun, 6 Apr 2003 20:37:59 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Smartelectronix - Bram <bram@smartelectronix.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Our new toy + terminal questions.....
Message-ID: <20030406193759.GA8473@sleepie.demon.co.uk>
References: <001e01c2fc30$b9ff47e0$604a5251@kerberos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <001e01c2fc30$b9ff47e0$604a5251@kerberos>
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

On Sun, Apr 06, 2003 at 01:36:12PM +0200, Smartelectronix - Bram wrote:
> Hi everyone, (I'm new to the list)
> 
> 
> Today my mates and I went to pick up our new *ahem* 'toy'
> http://www.smartelectronix.com/~bdejong/a_new_toy/
> 
> HP9000 D270/2 + 512Mb RAM + 8 x 9-gig & 8 x 4Gig + UPS + ...
> No graphics out, only a serial terminal output.
> We've got it up and running and are trying to install Debian
> (Woody) on it.
> 
> Everything works just fine, but when the semi-graphical installer
> kicks in, we -obviously- get large pieces of garbage on the terminal.
> 
> Is there a way to set the debian installer to use simple-ascii only 
> without colors/...? Or is there a better terminal program we can use
> that can display colors/.. better? Selecting things in the installer
> is pretty much hit and miss too.

You don't say what terminal emulator you are trying to use.  Many people
use minicom on an x86 linux host without problems.

You can't stop the installer using features such as cursor addressing to
paint the screen.

Richard
