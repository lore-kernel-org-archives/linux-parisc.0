Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 461E14829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Dec 2002 09:50:27 -0700 (MST)
Message-Id: <200212051650.gB5GoG7d003199@hiauly1.hia.nrc.ca>
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Thu, 5 Dec 2002 11:50:15 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: debian-hppa@lists.debian.org,
	parisc-linux@lists.parisc-linux.org, debian-glibc@lists.debian.org,
	tausq@debian.org
In-Reply-To: <20021205010845.GU16331@systemhalted> from "Carlos O'Donell" at Dec 4, 2002 08:08:45 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: GNU/Libc 2.3.1 on HP-PARISC requires >= 2.4.19 kernel.
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

> Hi, my name is Carlos, and I cause all your nightmares with glibc on
> HPPA :)
> [...]
> I recommend that you _do_ _not_ upgrade glibc on HPPA until 2.3.1-6.

Being perverse, I tried installing 2.3.1-5.  I hit the same problem
that Joel mentioned previously, the old dynamic loader doesn't define
GLIBC_PRIVATE.  I was trying to install glibc privately in a prefix of
my selection.  I have been using LD_LIBRARY_PATH to select my library
path.  However, this no longer works since all system binaries are
linked using /lib/ld.so.1 and it isn't compatible with the 2.3.1
libraries.  Is there a way around this?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
