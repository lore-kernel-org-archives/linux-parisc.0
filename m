Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hottub.hottub.org (hottub.org [66.60.164.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 953B94829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Nov 2002 15:38:05 -0700 (MST)
Date: Fri, 8 Nov 2002 14:36:12 -0800 (PST)
From: Matthew Zahorik <matt@hottub.org>
To: Patrick <p0six@gmx.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Trouble!
In-Reply-To: <000901c28774$b38b1d70$d84641d5@posix9bwvzy1lo>
Message-ID: <Pine.GSO.4.40.0211081427420.17389-100000@hottub>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 8 Nov 2002, Patrick wrote:

> I'm working with a hp c3700 workstation, with nothing what so ever installed

I had the same problem on a J6700.  The C3700 is just like a J6700 but
with one processor.

You need a more recent kernel than the one that comes with the debian 3.0
installer.  Go to ftp://ftp.parisc-linux.org/cd-images/testing/auto-isos/ and grab
palinux-2.4.19-pa19 installation ISOs.  2.4.19-pa21 PDC didn't work for
me.

Grab the kernel after installation and manually copy it to
/target/boot/vmlinux BEFORE YOU REBOOT.  The stock kernel that is
installed is, once again, not recent enough.  The kernel may be in
the ISO - there are also precompiled test kernels in other directories on
ftp.parisc-linux.org.

I used the lifimage to netboot.  Your mileage may vary.

Thanks!

- Matt

ps.  I probably won't see replies since I'm out of town for a week
starting tonight.
