Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA94F48A2
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 10:10:15 -0600 (MDT)
Date: Tue, 16 Jul 2002 09:13:35 -0700
From: Randolph Chung <randolph@tausq.org>
To: joel.soete@freebel.net
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.2 bootstrap?
Message-ID: <20020716161335.GL8724@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <1026831840.3d3435e0d908a@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1026831840.3d3435e0d908a@webmail.tiscalinet.be>
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

> I just modify to match my develop env and mainly I added --host=hppa-linux (I am
> building gcc-3.2 on a b2000) in the configure:
> '$GCC_SRC/gcc/configure --prefix=$TOOLS --enable-languages=c --host=hppa-linux'

fwiw i use something like this:

~/src/gcc-3.2/configure --prefix=/home/tausq/opt/gnu --host=hppa-linux --build=hppa-linux --target=hppa-linux --enable-shared --disable-nls --enable-languages=c

if building hppa64-linux compilers, use --target=hppa64-linux instead.

then i do 'make bootstrap-lean' and then 'make install', set my PATH to
include /home/tausq/opt/gnu/bin, run 'gcc -v' to make sure i have the 
right version in my path, and then build the kernel.

alternatively, if i were building a cross-compiler (say
hppa-linux->hppa64-linux), i would just do 'make' instead of 'make
bootstrap-lean'

hth,
randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
