Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 769B04952
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 08:05:34 -0700 (MST)
Date: Tue, 9 Mar 2004 10:03:19 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 	RE: New glibc patches 2004-03-08,
	fixes GLRO changes.
Message-ID: <20040309150318.GD22721@baldric.uwo.ca>
References: <404782C800002A2F@ocpmta1.freegates.net>
	<404782C800002FD2@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <404782C800002FD2@ocpmta1.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Mar 09, 2004 at 02:49:44PM +0100, Joel Soete wrote:
> >BTW which install should I install: man debootstrap give the fllowing example
> >deboostrap woody ./woody-chroot http://ftp.cx.debian.org/debian
> >But my question is: would you like I build a woody or would you prefer a
> >sarge?
> 
> For the moment I tested with sarge ended with:
> "I: Base system installed successfully."
> 
> :)
> 
> let me know anyway if you would prefer woody, it doesn't required so much
> time :) 

Joel,

Both unstable, testing, and stable should technically be tested with the
new glibc :) You can test with whichever you like right now.

Never *ever* install glibc on a running system, always install to the
chroot, and jump into the chroot.

c.
