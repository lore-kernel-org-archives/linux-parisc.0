Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from droid3.webreklam.hu (para.abs0lut.com [195.56.113.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58D78482A
	for <parisc-linux@parisc-linux.org>; Sun,  3 Jun 2001 12:52:33 -0600 (MDT)
Received: from localhost (diab@localhost)
	by droid3.webreklam.hu (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA14708
	for <parisc-linux@parisc-linux.org>; Sun, 3 Jun 2001 20:52:32 +0200
Date: Sun, 3 Jun 2001 20:52:32 +0200 (CEST)
From: diab <diab@diab.rulez.org>
To: parisc-linux@parisc-linux.org
Message-ID: <Pine.LNX.4.21.0106032046490.13376-100000@droid3.webreklam.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] wierd shell behaviour
List-ID: <linux-parisc.vger.kernel.org>

I got the latest 0.9 cd image installed and apt-get upgrade'd everything

I was trying to compile BitchX, configure runs ok and on make it
stops:

# make
cd source \
  &&  'local_dir=/root' 'INSTALL_IRC=/usr/local/bin/BitchX'
'IRCLIB=/usr/local/lib/bx' 'CC=gcc' 'CFLAGS=-O2 -Wall -g '
'HELPDIR=/usr/local/lib/bx/help' 'INSTALL_WSERV=/usr/local/lib/bx/wserv'
'IRCPATH=~/.BitchX:~/.BitchX/plugins:.:/usr/local/lib/bx/plugins:/usr/local/lib/bx/script:/usr/local/lib/bx'
'TRANSLATION_PATH=/usr/local/lib/bx/translation' 'LDFLAGS=' 'LIBS=-lcrypt
-lm -lncurses -lresolv ' 'LN=ln -s' 'RM=rm -f' 'TCL_SRCS=' 'TCL_OBJS='
'CD_PLAY=' 'CD_SRCS=' 'CD_OBJS=' 'TCL_LIBS='
'PLUGINDIR=/usr/local/lib/bx/plugins' '_VERSION_=BitchX'
'VERSION=BitchX-1.0c18' 'INSTALL_DATA=/usr/bin/install -c -m 644'
'INSTALL_SCRIPT=/usr/local/lib/bx/script' 'EXEEXT=' 'SHLIB_CFLAGS='
'SHLIB_SUFFIX=.so' all
/bin/sh: local_dir=/root: No such file or directory

as you can see the shell tries to run 'local_dir=/root' instead of
evaluating it. i was able to compile the binary "on my
own", but any1 knows how to change this behaviour? 

sh is symlinked to bash, and it is:
GNU bash, version 2.05.0(1)-release (hppa-unknown-linux-gnu)

anyways (tried the same bitchx 1.0c18 source) it works on an
i386 pc, same debian/shell:
GNU bash, version 2.05.0(1)-release (i386-pc-linux-gnu)

regards,

-- 
diab 
		
