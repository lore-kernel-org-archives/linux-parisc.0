From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Sun, 23 Nov 2008 11:36:15 -0500 (EST)
Message-ID: <20081123163616.7399D4DF8@hiauly1.hia.nrc.ca>
References: <20081123071348.GA31575@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081123071348.GA31575@colo.lackof.org> from "Grant Grundler" at Nov 23, 2008 00:13:48 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Tue, Nov 18, 2008 at 09:04:32PM +0100, Helge Deller wrote:
> > Hello PA hackers,
> >
> > I've tried various -rc candidates in the last few weeks, and sadly the 
> > parisc kernel is in pretty bad shape.
> >
> > At the beginning I started to get problems only when I had USB 
> > keyboard/mouse attached to the PA machine. This lead to bugzilla 
> > http://bugzilla.kernel.org/show_bug.cgi?id=11913
> 
> I don't have any USB devices attached (serial console) on j6000.
> Also getting occasional:
> Backtrace:
> 
> with no other output when a process (usually hppa64-gcc) segfaults "randomly".
> This is with kernel builds.
> 
> > Now, with -rc4 and -rc5 things got even worse.
> 
> I've tried both -rc3 and -rc5. I'm going to try 2.6.27.7 as well.

Try rc6.  It seems better than rc5.  With rc5 and JEB's ion config
on rp3340, bash dumped core four times building rc6.  In general, I see
more random segfaults in bash and make than any other applications.

rc6 is certainly not perfect.  I managed a full GCC build but in the
testsuite (ada) I has this error in the build log:

...
Running chapter cc ...
sed: option requires an argument -- e
Usage: sed [OPTION]... {script-only-if-no-other-script} [input-file]...

  -n, --quiet, --silent
		 suppress automatic printing of pattern space
  -e script, --expression=script
		 add the script to the commands to be executed
  -f script-file, --file=script-file
		 add the contents of script-file to the commands to be executed
  -i[SUFFIX], --in-place[=SUFFIX]
		 edit files in place (makes backup if extension supplied)
  -l N, --line-length=N
		 specify the desired line-wrap length for the `l' command
  --posix
		 disable all GNU extensions.
  -r, --regexp-extended
		 use extended regular expressions in the script.
  -s, --separate
		 consider files as separate rather than as a single continuous
		 long stream.
  -u, --unbuffered
		 load minimal amounts of data from the input files and flush
		 the output buffers more often
      --help     display this help and exit
      --version  output version information and exit

If no -e, --expression, -f, or --file option is given, then the first
non-option argument is taken as the sed script to interpret.  All
remaining arguments are names of input files; if no input files are
specified, then the standard input is read.

E-mail bug reports to: bonzini@gnu.org .
Be sure to include the word ``sed'' somewhere in the ``Subject:'' field.
FAIL:   cc30002

In the ada log:

BUILD cc30002.adb
gnatmake --GCC="/home/dave/gnu/gcc/objdir/gcc/xgcc -B/home/dave/gnu/gcc/objdir/g
cc/" -gnatws -O2 -I/home/dave/gnu/gcc/objdir/gcc/testsuite/ada/acats/support cc3
0002.adb -largs --GCC="/home/dave/gnu/gcc/objdir/gcc/xgcc -B/home/dave/gnu/gcc/o
bjdir/gcc/"
/home/dave/gnu/gcc/objdir/gcc/xgcc -c -B/home/dave/gnu/gcc/objdir/gcc/ -gnatws -
O2 -I/home/dave/gnu/gcc/objdir/gcc/testsuite/ada/acats/support cc30002.adb
/home/dave/gnu/gcc/objdir/gcc/xgcc -c -B/home/dave/gnu/gcc/objdir/gcc/ -gnatws -
O2 -I/home/dave/gnu/gcc/objdir/gcc/testsuite/ada/acats/support cc30002_0.adb
/home/dave/gnu/gcc/objdir/gcc/xgcc -c -B/home/dave/gnu/gcc/objdir/gcc/ -gnatws -
O2 -I/home/dave/gnu/gcc/objdir/gcc/testsuite/ada/acats/support cc30002_1.adb
/home/dave/gnu/gcc/objdir/gcc/xgcc -c -B/home/dave/gnu/gcc/objdir/gcc/ -gnatws -
O2 -I/home/dave/gnu/gcc/objdir/gcc/testsuite/ada/acats/support cc30002_2.adb
/home/dave/gnu/gcc/objdir/gcc/xgcc -c -B/home/dave/gnu/gcc/objdir/gcc/ -gnatws -
O2 -I/home/dave/gnu/gcc/objdir/gcc/testsuite/ada/acats/support cc30002_3.ads
gnatbind -I/home/dave/gnu/gcc/objdir/gcc/testsuite/ada/acats/support -x cc30002.
ali
gnatlink cc30002.ali --GCC=/home/dave/gnu/gcc/objdir/gcc/xgcc -B/home/dave/gnu/g
cc/objdir/gcc/
RUN 
/home/dave/gnu/gcc/gcc/gcc/testsuite/ada/acats/run_all.sh: line 16: /home/dave/g
nu/gcc/objdir/gcc/testsuite/ada/acats/tests/cc/cc30002/: is a directory
FAIL:   cc30002

The file cc30002 is there:

dave@mx3210:~/gnu/gcc/objdir/gcc/testsuite/ada/acats/tests/cc/cc30002$ ls
cc30002      cc30002.lst    cc30002_1.adb  cc30002_2.ads
cc30002.adb  cc30002_0.adb  cc30002_1.ads  cc30002_3.ads
cc30002.log  cc30002_0.ads  cc30002_2.adb

and the test passes if run.  I've never seen cc30002 fail before.

The error building rc6 was:

  ...
  LD [M]  fs/exportfs/exportfs.o

  malloc: ../../../bash/lib/sh/stringvec.c:73: assertion botched
  free: called with unallocated block argument
  Aborting.../bin/sh: line 1:  7965 Aborted                 (core dumped) ( cat /dev/null; echo kernel/fs/exportfs/exportfs.ko ) > fs/exportfs/modules.order
  make[2]: *** [fs/exportfs/modules.order] Error 134
  make[1]: *** [fs/exportfs] Error 2
  make: *** [fs] Error 2

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
