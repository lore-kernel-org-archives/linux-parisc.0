Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id QAA04310
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 16:00:56 -0700
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id QAA17580
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 16:03:12 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=noam.fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 13yiv2-0007QD-00
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 16:03:12 -0700
To: parisc-linux@puffin.external.hp.com
Date: Wed, 22 Nov 2000 16:03:12 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13yiv2-0007QD-00@noam.fc.hp.com>
Subject: [parisc-linux] 64-bit progress
List-ID: <linux-parisc.vger.kernel.org>


32-bit syscalls on 64-bit kernel are to the point where a few things
work, and signals appear to be working (I didn't implement *all* the
signal-related syscalls yet).  I'll be continuing to produce syscall
wrappers for a while...

If you try to boot the standard NFS root with wide kernel, you'll want to
	mv sbin/init sbin/init-real
then compile and install this program as sbin/init:
	int main()
	{
	    char *argv[2];

	    argv[0] = "/sbin/init-real";
	    argv[1] = 0;
	    execv(argv[0], argv);
	}

I never felt comfortable I found the point where sys_execve figures out it
needs to pack the argv vector differently for narrow user apps (locally I
also am using PER_LINUX32 in binfmt_elf32.c) which causes the initial
exec(/sbin/init) to be passed incomprehensible arguments.  This program
is a little temporary workaround.


	-Paul Bame
