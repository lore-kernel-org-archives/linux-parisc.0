Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 14 Jul 2003 15:07:35 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.21-paX on an rp2430
Message-ID: <20030714210735.GA27164@dsl2.external.hp.com>
References: <20030714182347.GC14114@systemhalted> <20030714194824.GD23545@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030714194824.GD23545@dsl2.external.hp.com>
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

On Mon, Jul 14, 2003 at 01:48:24PM -0600, Grant Grundler wrote:
> i've uploaded a *PRE-RELEASE* 2.4.21-pa5.tgz to:
> 	ftp://ftp.parisc-linux.org/kernels/a500/2.4.21-pa5.tgz

BTW, I'm trying to fix "sendfile". I missing some peice to make
the 32-bit syscall wrapper to work right.

It works fine to 32-bit kernel
grundler <504>./sftest foo
sendfile returned ret = 7013 off = 7013 errno = 0
grundler <505>ls -l foo
-rw-r--r--    1 grundler grundler     7013 Jul 14 14:03 foo
grundler <506>uname -a
Linux debian 2.4.21-pa2 #46 Sat Jul 5 23:28:38 PDT 2003 parisc GNU/Linux

But not for 64-bit kernel:
grundler@gsyprf11:~$ ./sftest x
sendfile returned ret = 7013 off = 0 errno = 0
grundler@gsyprf11:~$ ls -l x
-rw-r--r--    1 grundler users        7013 Jul 14 14:05 x

and thanks to tausq for whipping up the simple test case.
"distcc" won't work on my a500 "mini cluster" until this is fixed. :^)

grant
