Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 29 Apr 2003 16:13:57 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: "Boehm, Hans" <hans_boehm@hp.com>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructurs and -fPIC
Message-ID: <20030429221357.GD17313@dsl2.external.hp.com>
References: <75A9FEBA25015040A761C1F74975667D01442066@hplex4.hpl.hp.com> <20030429213027.GB12492@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030429213027.GB12492@systemhalted>
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

On Tue, Apr 29, 2003 at 05:30:28PM -0400, Carlos O'Donell wrote:
> > 3) Adding 24 bytes to the struct sigcontext pointer (?) passed as a third argument to the signal handler. (!)
> 
> Are you still using a 64-bit kernel?

no - he's using:
grundler@debian:~$ uname -a
Linux debian 2.4.20-pa28 #39 Wed Mar 12 19:24:25 PST 2003 parisc unknown
unknown GNU/Linux

It's possible the kernel-headers he's using aren't clean.
Just in case, can you tell me which ones he should be using?

> What glibc version is installed? I made recent changes to mache the
> userspace and kernel versions of sigcontext (now a machine context).

grundler@debian:~$ dpkg -l libc6\*
Desired=Unknown/Install/Remove/Purge/Hold
|
Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err:
uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
ii  libc6          2.3.1-16       GNU C Library: Shared libraries and Timezone
un  libc6-bin      <none>         (no description available)
pn  libc6-dbg      <none>         (no description available)
ii  libc6-dev      2.3.1-16       GNU C Library: Development Libraries and Hea
...

grundler@debian:~$ ls -l /var/opt/LinuxCOE/Debian/pool/main/g/glibc/libc6-dev_2.3.1-*_hppa.deb
-rw-rw-r--    1 root     1176      2958496 Mar 22 12:02 /var/opt/LinuxCOE/Debian/pool/main/g/glibc/libc6-dev_2.3.1-16_hppa.deb
-rw-rw-r--    1 root     1176      2959794 Apr 21 06:47 /var/opt/LinuxCOE/Debian/pool/main/g/glibc/libc6-dev_2.3.1-17_hppa.deb


I'm ok with updating to -17 if you promise it won't do evil things
to my box. ;^)

thanks,
grant
