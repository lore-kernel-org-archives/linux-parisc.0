Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Andreas Deresch <aderesch@fs.tum.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] vmlinux header for savecrash. 
In-Reply-To: Message from Andreas Deresch <aderesch@fs.tum.de>
   of "Wed, 23 Jan 2002 11:23:26 +0100." <Pine.NEB.4.33.0201231118490.942-100000@ganymed.fachschaften.tu-muenchen.de>
References: <Pine.NEB.4.33.0201231118490.942-100000@ganymed.fachschaften.tu-muenchen.de> 
Date: Thu, 24 Jan 2002 23:30:54 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020125063054.C4281482A@dsl2.external.hp.com>
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

Andreas Deresch wrote:
> > Isn't /vmlinux a symlink to /boot/vmlinux?
> > ie the file palo loaded is whatever the symlink points to.
> Can you guarantee, that everybody will have this link?

Of course not. I'm refering to a default installation.
I delete that link and replace /etc/palo.conf with my own.
But I'm hardly a "regular" user.

> (I for example don't right now - I always thought, this is just for
> historical reasons)


> > BTW, I explicitly specify /boot/vmlinux in my palo.conf files
> > and see 3/boot/vmlinux in my palo command line.
> Which means, /boot is not a separate partition as some people like to keep
> it. So you can't count on that either.

Right. I like to have lots of room for kernels. :^)
And if one wanted to have / as an ext3, it would make
sense to have /boot as an ext2 for loading kernels and then
the / could be the rest of the disk (ignoring the 2GB
IODC limitation).

grant
