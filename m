Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2DB04852
	for <parisc-linux@parisc-linux.org>; Tue, 26 Feb 2002 15:09:17 -0700 (MST)
Date: Tue, 26 Feb 2002 23:08:58 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Cc: Randolph Chung <randolph@tausq.org>,
	<parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] nslookup segmentation fault
In-Reply-To: <20020226164130.B5289@systemhalted>
Message-ID: <Pine.LNX.4.43.0202262252140.5099-100000@alpha.bocc.de>
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

Hi Carlos,

> I'm feel worried about what brk() is trying to do.

brk() is used to increase the core size. Nothing unusual.

> PF_INET==2 and PF_INET6==10 are only a single bit appart :}
> Cosmic radiation maybe?

Nope. The resolver supports both IPv4 and IPv6. The following just seems 
to be a probe if both AFs are available.

getpid()                                = 2880
socket(PF_INET, SOCK_STREAM, IPPROTO_IP) = 3
close(3)                                = 0
socket(PF_INET6, SOCK_STREAM, 0)        = 3
getsockname(3, {sin_family=AF_INET6, sin6_port=htons(0),  
inet_pton(AF_INET6, "::", &sin6_addr), sin6_flowinfo=0, sin6_scope_id=0}, [28]) = 0
close(3)                                = 0
brk(0)                                  = 0x2f000
brk(0x2f030)                            = 0x2f030
brk(0x30000)                            = 0x30000
brk(0x33000)                            = 0x33000
--- SIGSEGV (Segmentation fault) ---
+++ killed by SIGSEGV +++

gdb is even worse:

(gdb) run
The program being debugged has been started already.
Start it from the beginning? (y or n) y

Starting program: /usr/bin/nslookup www.kame.net
(no debugging symbols found)...(no debugging symbols found)...
(no debugging symbols found)...(no debugging symbols found)...
(no debugging symbols found)...(no debugging symbols found)...
(no debugging symbols found)...(no debugging symbols found)...
Program received signal SIGSEGV, Segmentation fault.
Cannot access memory at address 0x0
(gdb) bt
Cannot access memory at address 0x0

Looks like yet another glibc related problem. In particular since nslookup 
seems to use pthread (which *does* have issues with the latest glibc):

open("/lib/libpthread.so.0", O_RDONLY)  = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0@`"..., 1024) 
= 1024

Cheers,
--jochen
