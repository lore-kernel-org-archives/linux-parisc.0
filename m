Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hermes.fachschaften.tu-muenchen.de (hermes.fachschaften.tu-muenchen.de [129.187.176.19])
	by dsl2.external.hp.com (Postfix) with SMTP id D9C42482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Jan 2002 03:24:00 -0700 (MST)
Date: Wed, 23 Jan 2002 11:23:26 +0100 (CET)
From: Andreas Deresch <aderesch@fs.tum.de>
Reply-To: Andreas Deresch <aderesch@fs.tum.de>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Paul Bame <bame@fc.hp.com>, <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] vmlinux header for savecrash. 
In-Reply-To: <20020123021318.E6C6C482A@dsl2.external.hp.com>
Message-ID: <Pine.NEB.4.33.0201231118490.942-100000@ganymed.fachschaften.tu-muenchen.de>
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

> > I know it's a pain
> > to turn 3/vmlinux into /boot/vmlinux but 3/vmlinux is all palo knows.
>
> Isn't /vmlinux a symlink to /boot/vmlinux?
> ie the file palo loaded is whatever the symlink points to.
Can you guarantee, that everybody will have this link?
(I for example don't right now - I always thought, this is just for
historical reasons)

> BTW, I explicitly specify /boot/vmlinux in my palo.conf files
> and see 3/boot/vmlinux in my palo command line.
Which means, /boot is not a separate partition as some people like to keep
it. So you can't count on that either.

ad
