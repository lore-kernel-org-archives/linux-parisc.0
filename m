Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B5C5482F
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Jun 2002 10:43:16 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Message-ID: <1023962027.3d086babb213a@webmail.tiscalinet.be>
Date: Thu, 13 Jun 2002 11:53:47 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Glibc cvs: ld segmentation fault
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

Hi Dave,

To compile toolchaine with gcc-3.2, I also try cvs glibc.

I also apply your "patch glibc-2.2.5 for gcc-3.2"

After applying similar patch to "sysdeps/hppa/dl-machine.h", I always got ld
segmetation fault:

/Develop/parisc-linux/build/glibc/elf/ld.so.1 --library-path
/Develop/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Develop/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/Develop/parisc-linux/build/glibc/nss:/Develop/parisc-linux/build/glibc/nis:/Develop/parisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/build/glibc/linuxthreads
/Develop/parisc-linux/build/glibc/sunrpc/rpcgen -Y ../scripts -c
rpcsvc/bootparam_prot.x -o
/Develop/parisc-linux/build/glibc/sunrpc/xbootparam_prot.T
make[2]: *** [/Develop/parisc-linux/build/glibc/sunrpc/xbootparam_prot.stmp]
Segmentation fault
make[2]: Leaving directory `/Develop/parisc-linux/src/glibc/sunrpc'
make[1]: *** [sunrpc/others] Error 2
make[1]: Leaving directory `/Develop/parisc-linux/src/glibc'
make: *** [all] Error 2

### Thu Jun 13 09:12:24 2002 ###


Don't you have additional advice?

Thanks in advance,
    Joel

PS: I got the same result whatever the env I choose:

unset LD_LIBRARY_PATH
unset LD_RUN_PATH

or

export LD_LIBRARY_PATH=$DEST/lib
export LD_RUN_PATH=$DEST/bin


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
