Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id D0253483B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 14:50:20 -0700 (MST)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <15473.30343.730737.301690@gargle.gargle.HOWL>
Date: Mon, 18 Feb 2002 22:47:51 +0100
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jso@europay.com (=?iso-8859-1?Q?Jo=EBl_Soete?=),
	carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: hppa-linux gcc-3.0.3:
In-Reply-To: <200202181641.g1IGf3hb011664@hiauly1.hia.nrc.ca>
References: <OF99BC0404.6646AF92-ONC1256B64.0050D0F6@com>
	<200202181641.g1IGf3hb011664@hiauly1.hia.nrc.ca>
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

John David Anglin writes:
> > Thanks for advise but I speek well about the new (annonced on
> > http://www.gnu.org/software/gcc/gcc.html: ...The next major release, GCC
> > 3.1,...) gcc release 3.1.
> 
> I am building 3.1 experimental regularly from the main gcc cvs source.
> I have built glibc with it.  You probably should get the cvs binutils
> because it contains a long branch related fix which will cause a seg
> fault early in the bootstrap.  You can avoid it by using "-O2" in
> stage1.  I have a couple of small fixes that need to go in regarding
> linking with milli and pthreads routines.  The gcc testsuite (expect)
> seems to trigger a parisc-linux bug which fills /var with page fault
> error mesages.

I just uploaded the gcc-snapshot_20020216 build to incoming (without
any extra patches). 

To use this snapshot, you should set the following environment
variables:

        LD_LIBRARY_PATH=/usr/lib/gcc-snapshot/lib:$LD_LIBRARY_PATH
        PATH=/usr/lib/gcc-snapshot/bin:$PATH

Unset these variables before building Debian packages destined for an
upload to ftp-master.debian.org.

The snapshot packages doesn't build automatically. I had to restart
the build due to bash problems (the same you saw as well).

	Matthias
