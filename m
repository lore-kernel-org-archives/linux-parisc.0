From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] new gcc-default for hppa
Date: Fri, 10 Jan 2003 09:09:05 -0800
Message-ID: <20030110170905.GG26261__13915.3758799241$1416622093$gmane$org@tausq.org>
References: <3E1AA8D500000A9A@ocpmta8.freegates.net>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: jsoe0708@tiscali.be
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3E1AA8D500000A9A@ocpmta8.freegates.net>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> I do notice that unstable debian for i386 switch (or will very soon) gcc-default
> to gcc-3.2. Is it also true for hppa? (am I anxious about compiling new
> kernel with this because of pb encounter with network connection)

yes:

tausq@auric:~$ madison gcc|grep unstable
       gcc |    2:3.1-1 |      unstable | hurd-i386
       gcc |  3:3.2.2-0 |      unstable | alpha, arm, hppa, i386, ia64, m68k, mips, mipsel, powerpc, s390, sparc

randolph
