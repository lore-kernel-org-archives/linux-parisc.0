Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "JOERGENSEN,RUNAR (HP-Norway,ex1)" <runar_joergensen@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Startup problem X 
In-Reply-To: Message from "JOERGENSEN,RUNAR (HP-Norway,ex1)" <runar_joergensen@hp.com>
   of "Wed, 19 Dec 2001 13:35:29 +0100." <CDB09D386161D411881900D0B77FBBC106521DA9@ibsen.sweden.hp.com>
References: <CDB09D386161D411881900D0B77FBBC106521DA9@ibsen.sweden.hp.com> 
Date: Wed, 19 Dec 2001 08:58:06 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011219155807.15CF9482A@dsl2.external.hp.com>
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

"JOERGENSEN,RUNAR (HP-Norway,ex1)" wrote:
> I'm a bit confused because I though we installed
> the 32bit version. In fact, when we boot we get
> thew following kernel: /boot/vmlinux-2.4.9-32.
> When I do a "file" on /boot/vmlinux-2.4.9-32,
> I get 32bit ELF executable.

Look at /etc/palo.conf and see what vmlinux it points to.
That's the one that's getting loaded/run.
By default you should have gotten a 32-bit kernel.
I doubt the syscall wrapper is the issue.

Newer 2.4.16 kernels are available from ftp.parisc-linux.org/kernels/32.
I suggest grabbing one of those.

> The OS line I presented was picked from what
> "XFree86 -version" reports.

eg. Build Operating System: Linux 2.4.13 i686 [ELF] 

"uname -m" will tell you which vmlinux you are running on *now*.
Not which one the XF86 binaries where built on.

> A mismatch in the image itself?

not likely.
Sounds like you have the original, mostly working kernel still.
Just try a newer one.

grant
