From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] /bin/sh: undefined symbol: execve
Date: Sun, 6 Aug 2006 14:05:42 -0400 (EDT)
Message-ID: <200608061805.k76I5gk1015076@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: carlos@codesourcery.com
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I'm seeing the following fault and others like it in the libjava
testsuite, GCC head:

Executing on host: /home/dave/gcc-4.2/objdir/hppa-linux/libjava/testsuite/../lib
tool --silent --tag=GCJ --mode=link /home/dave/gcc-4.2/objdir/gcc/gcj -B/home/da
ve/gcc-4.2/objdir/hppa-linux/libjava/ -B/home/dave/gcc-4.2/objdir/gcc/ --encodin
g=UTF-8 -B/home/dave/gcc-4.2/objdir/hppa-linux/libjava/testsuite/../ /home/dave/
gcc-4.2/gcc/libjava/testsuite/libjava.lang/PR3096.java   -no-install --main=PR30
96 -g  -L/home/dave/gcc-4.2/objdir/hppa-linux/./libjava/.libs -lm   -o /home/dav
e/gcc-4.2/objdir/hppa-linux/libjava/testsuite/PR3096.exe    (timeout = 300)
/bin/sh: symbol lookup error: /bin/sh: undefined symbol: execve, version
libtool: ignoring unknown tag
output is:
/bin/sh: symbol lookup error: /bin/sh: undefined symbol: execve, version
libtool: ignoring unknown tag

FAIL: PR3096 compilation from source

I see these errors of gsyprf11 (SMP 64-bit kernel).  I don't see
the fails on hiauly6 (UP 32-bit kernel).  I believe that these
lookup errors are from the dynamic loader.  execve is undefined in
/bin/sh but it should be resolved by libc.

The fails aren't consistent from run to run, so there appears to
be a race condition somewhere in the lookup process.

Thoughts?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
