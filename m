Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 830F94857
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Mar 2004 11:53:56 -0700 (MST)
Date: Mon, 15 Mar 2004 13:51:13 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 	RE: New glibc patches 2004-03-08,
	fixes GLRO changes.
Message-ID: <20040315185113.GC660@baldric.uwo.ca>
References: <4054B9BC.30309@tiscali.be>
	<404EC2E70000403A@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <404EC2E70000403A@ocpmta2.freegates.net>
Cc: James Morrison <ja2morri@csclub.uwaterloo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Mar 15, 2004 at 06:38:46PM +0100, Joel Soete wrote:
> Hello Jim,
> 
> Sorry for confusion but you have definitely right.
> 
> [snip]use prefix=/usr and make  install_root=/mnt/chroot install;
> 
> This is the right method because if I use prefix=/mnt/chroot and 'make install',
> when the install was finished and I tried chroot/mnt/chroot: here was the
> error message:
> chroot /mnt/chroot
> /bin/bash: error while loading shared libraries: libncurses.so.5: cannot
> open shared object file: No such file or directory
> 
> and strace shows me that it looking for libncurses.so.5 into /mnt/chroot/lib
> :)
> 
> So to launch make -k check in this config, I foreseen to use prefix=/usr
> and make install_root=/mnt/chroot; then mount -o bind /GlibcSrcFS /mnt/chroot/GlibcSrcFS;
> chroot /mnt/chroot; and in this env launch the make -k check. Do you know
> another solution?

That sounds like a perfect solution! :)

Thanks Joel.

c.
