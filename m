Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA21549
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Aug 2000 19:10:58 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 12 Aug 2000 19:11:15 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13NggX-0007PW-00
	for <parisc-linux@thepuffingroup.com>; Sat, 12 Aug 2000 15:11:09 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 12 Aug 2000 15:11:09 -0400
Message-ID: <878zu2mh0y.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Just felt like sharing...  (no pun intended)
List-ID: <linux-parisc.vger.kernel.org>

[dhd@tarwebok] ~/src/parisc$ cat libhello.c
int foo(int bar)
{
	return bar + 42;
}

[dhd@tarwebok] ~/src/parisc$ cat hello-shared.c 
int main()
{
	extern int foo(int bar);
	int (*gar)(int) = foo;
	printf("Hello shared library world!\n");
	printf("The answer is %d, or maybe %d\n", foo(0), (*gar)(0));
	return 0;
}
[dhd@tarwebok] ~/src/parisc$ hppa-linux-gcc -fPIC -shared -o /home/nfsroot/parisc/libhello.so libhello.c 
[dhd@tarwebok] ~/src/parisc$ hppa-linux-gcc -o /home/nfsroot/parisc/hello-shared hello-shared.c /usr/local/lib/gcc-lib/hppa-linux/2.96/libgcc.a -L/home/nfsroot/parisc -lhello

(... and, over on the serial console window ...)

# uname -a
Linux 10.160.240.101 2.3.99-pre8 #230 Fri Aug 11 13:59:53 EDT 2000 parisc unknown
# ls -l ld.so
-rwxr-xr-x    1 1000     103        405189 Aug 12 18:58 ld.so
# ./ld.so
Usage: ld.so [OPTION]... EXECUTABLE-FILE [ARGS-FOR-PROGRAM...]
You have invoked `ld.so', the helper program for shared library executables.
This program usually lives in the file `/lib/ld.so', and special directives
in executable files using ELF shared libraries tell the system's program
loader to load the helper program from this file.  This helper program loads
the shared libraries needed by the program executable, prepares the program
to run, and runs it.  You may invoke this helper program directly from the
command line to load and run an ELF executable file; this is like executing
that file itself, but always uses this helper program from the file you
specified, instead of the helper program file specified in the executable
file you run.  This is mostly of use for maintainers to test new versions
of this helper program; chances are you did not intend to run this program.

  --list                list all dependencies and how they are resolved
  --verify              verify that given object really is a dynamically linked
                        object we can handle
  --library-path PATH   use given PATH instead of content of the environment
                        variable LD_LIBRARY_PATH
  --inhibit-rpath LIST  ignore RUNPATH and RPATH information in object names
                        in LIST
# ls -l hello-shared libhello.so
-rwxr-xr-x    1 1000     103       1338314 Aug 12 17:23 hello-shared
-rwxr-xr-x    1 1000     103          8486 Aug 11 19:02 libhello.so
# export LD_LIBRARY_PATH=/
# ./ld.so --list hello-shared
        libhello.so => /libhello.so (0x40001000)
# ./ld.so hello-shared
Hello shared library world!
The answer is 42, or maybe 42

There's still a lot of work to be done, of course - glibc doesn't
completely build with --enable-shared yet, and libdl.so is going to be
somewhat more challenging (luckily the IA-64 people have already
encountered some of the same issues).  Also note the kludgy way we
have to explicitly link libgcc.a, which was mentioned in a previous
thread.

I just thought this was pretty cool :-)

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
