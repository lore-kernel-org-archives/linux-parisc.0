Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Cc: parisc list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110, kernel Panics, still more tears ;-( 
In-Reply-To: Message from Juergen Braukmann <juergen.braukmann@ruhr-west.de>
   of "Sun, 21 Jul 2002 00:57:57 +0200." <3D39EAF5.A8932E1F@ruhr-west.de>
References: <3D383969.1657EF43@ruhr-west.de> <20020720152919.9D690483D@dsl2.external.hp.com>  <3D39EAF5.A8932E1F@ruhr-west.de> 
Date: Sat, 20 Jul 2002 19:38:02 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020721013803.0852F4842@dsl2.external.hp.com>
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

Juergen Braukmann wrote:
> Tried that, but didn't see a reasonable list. I could alter some things
> (inluding kernel) but I would have needed to know the name to type in.

whatever name you used.
I typically copy /usr/src/linux/vmlinux to /boot/vmlinux-paXX
to match the -paXX number in the Makefile.
(And copy System.map with the same convention).
Then interact with palo and specify /boot/vmlinux-pa55.

I change /etc/palo.conf to use /boot/vmlinux-pa55 (and rerun palo at that
point) by default if I'm happy it works.

> Oh these three letter acronyms. Read a few, mix up the letters and
> generate a few new ones to spread confusion. Sorry. ;-) So it was GSC
> instead. But I am still confused. ;-)

See http://www.parisc-linux.org/glossary/index.html

grant
