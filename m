From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] new gcc-default for hppa
Date: Fri, 10 Jan 2003 19:18:25 +0100
Message-ID: <3E1AA8D500000ADF__22643.8444726684$1416622094$gmane$org@ocpmta8.freegates.net>
References: <20030110170905.GG26261@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: "Randolph Chung" <tausq@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030110170905.GG26261@tausq.org>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>> I do notice that unstable debian for i386 switch (or will very soon)
gcc-default
>> to gcc-3.2. Is it also true for hppa? (am I anxious about compiling ne=
w
>> kernel with this because of pb encounter with network connection)
>
>yes:
>
>tausq@auric:~$ madison gcc|grep unstable
>       gcc |    2:3.1-1 |      unstable | hurd-i386
>       gcc |  3:3.2.2-0 |      unstable | alpha, arm, hppa, i386, ia64,
m68k,
>mips, mipsel, powerpc, s390, sparc
>
Thanks I will so wait before updating all my 2 test server (a b180 & a b2=
k)

Joel


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
