Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA17462
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 10:41:00 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 18 Oct 2000 16:41:54 -0000
Received: from dhd by tarwebok with local (Exim 3.16 #1 (Debian))
	id 13lwI6-0000Wu-00
	for <parisc-linux@thepuffingroup.com>; Wed, 18 Oct 2000 12:42:10 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 18 Oct 2000 12:42:10 -0400
Message-ID: <87wvf614pp.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] weird memory/file corruption errors building glibc and other things
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I get some very strange file corruption errors when building glibc on
the A180.  Specifically the dependency files end up with weird garbage
overwritten in them, and the glibc build fails like this:

ln /home/build/glibc-2.1.95/hppa-linux/obj/dummy.d /home/build/glibc-2.1.95/hppa-linux/obj/stdlib/lshift.d
make[3]: @¸œ@¸œ/build/glibc-2.1.95/hppa-linux/obj/dummy.d: Command not found
make[2]: *** [stdlib/subdir_lib] Error 127
make[2]: Leaving directory `/home/build/glibc-2.1.95/glibc-2.1.95'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/build/glibc-2.1.95/hppa-linux/obj'

This seems to be mostly random, because if I remove the offending
files and restart the build, it will usually succeed.

I also get lots of other random errors when building other packages.
Usually these end up triggering assertions in bash's malloc wrapper
code or causing make to segfault or bus error.  They are not
repeatable, and usually restarting the build makes them go away, at
least on the second or third try.

I don't know what other info I can provide.  Like I say, the errors
are random and seem to be caused by memory corruption, though there
are a few places where they tend to get "caught" more often than not.

I am not using swap at all either, because swapping does not work - I
get "invalid swap entry" errors on the console and my processes
segfault or bus-error more quickly than usual.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
