Return-Path: <shaver@netscape.com>
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36E67D7A.FA138E3D@netscape.com>
Date: Wed, 10 Mar 1999 09:11:06 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] New cross compiling RPMs
References: <19990310090611.M27177@cmu.edu>
Content-Type: text/plain; charset=us-ascii
Resent-Message-ID: <"Ob_-V2.0.gY.Wqdvs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

Phil Schwan wrote:
> 
> Mike Shaver just rebuilt Alex's cross compiling RPMs against glibc 2.0
> rather than 2.1, and they're now available on sod:
> 
> ftp://sod.res.cmu.edu/pub/parisc/tools/egcs-x-hppa-linux-1.1.1-4.i386.rpm
> ftp://sod.res.cmu.edu/pub/parisc/tools/binutils-x-hppa-2.9.1-4.i386.rpm
> 
> Note that the revision number is still 4, but these are in fact new.

And hey -- they even work (for me)!

[shaver@loonie /tmp]$ cat test.c
int main () { return 0; }
[shaver@loonie /tmp]$ hppa-linux-gcc -c test.c
[shaver@loonie /tmp]$ file test.o
test.o: ELF 32-bit MSB relocatable, PA-RISC, version 1
[shaver@loonie /tmp]$

Mike

-- 
169530.70 140316.26

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
