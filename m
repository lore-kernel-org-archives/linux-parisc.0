Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jonas Meyer <shitse@web.de>
Cc: debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from Jonas Meyer <shitse@web.de>
   of "Wed, 16 Jan 2002 12:22:03 +0100." <E16Qo8q-0003TX-00@smtp.web.de>
References: <E16Qo8q-0003TX-00@smtp.web.de> 
Date: Wed, 16 Jan 2002 22:22:34 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020117052234.B0508482D@dsl2.external.hp.com>
Subject: [parisc-linux] Re: crash when writing to /dev/lp0
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

Jonas Meyer wrote:
> I'm using a hp 712/60.I'm happy to see my keyboard working now with your 
> help.But now i ran into another problem: i want to connect a printer to it, 
> but whenever i write anything to /dev/lp0 the box crashes at once showing a 
> great lot of numbers on the screen.

THe "great lot of numbers" is the stack data and reason of the crash.
By crash, you mean that the box has to be rebooted?
or just the application dies?

This sounds like a kernel bug and follows really only need to go
to parisc-linux mailing list.

I'd like to at least see the "kernel panic" reason, GR02 and IOAQ values.
Unless you are using serial console, this has to be copied by hand.

> i'm using sid with the latest available kernel-image-2.4.16-32.

Can you pull a 2.4.17 parisc kernel from ftp.parisc-linux.org/kernels?
I'm not too excited about debugging the slightly older versions
since it's harder to retrieve the source from CVS.

> Another problem is the box tells me init men not freed when booting.

That's a known problem that can be safely ignored for now.

thanks,
grant
