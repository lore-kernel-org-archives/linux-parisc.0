Return-Path: <hppa-linux@thepuffingroup.com>
Message-ID: <7678BED5A989D211A39000A0C94309E908D623@wehcml06>
From: PG40 KCLin <KCLIN@winbond.com.tw>
To: "'hppa-linux@thepuffingroup.com'" <hppa-linux@thepuffingroup.com>
Subject: RE: [hppa-linux] New cross compiling RPMs
Date: Thu, 11 Mar 1999 10:12:42 +0800
MIME-Version: 1.0
Content-Type: text/plain
Resent-Message-ID: <"DdgVs1.0.zY4.YRovs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

Hi all,

About the new cross compiler, does it support floating-point emulation for
PA-RISC 1.1 architecture level 0? In the cross tool, does it support the
source level debugger based on Windows? or gdb only?

your reply will be appreciated. Thanks!

Best regards,
James K.C. Lin,
Winbond Electronics Corp.
Taiwan. R.O.C.

> ----------
> From: 	Mike Shaver[SMTP:shaver@netscape.com]
> Sent: 	Wednesday, March 10, 1999 PM 10:11
> To: 	hppa-linux@thepuffingroup.com
> Subject: 	Re: [hppa-linux] New cross compiling RPMs
> 
> Phil Schwan wrote:
> > 
> > Mike Shaver just rebuilt Alex's cross compiling RPMs against glibc 2.0
> > rather than 2.1, and they're now available on sod:
> > 
> >
> ftp://sod.res.cmu.edu/pub/parisc/tools/egcs-x-hppa-linux-1.1.1-4.i386.rpm
> > ftp://sod.res.cmu.edu/pub/parisc/tools/binutils-x-hppa-2.9.1-4.i386.rpm
> > 
> > Note that the revision number is still 4, but these are in fact new.
> 
> And hey -- they even work (for me)!
> 
> [shaver@loonie /tmp]$ cat test.c
> int main () { return 0; }
> [shaver@loonie /tmp]$ hppa-linux-gcc -c test.c
> [shaver@loonie /tmp]$ file test.o
> test.o: ELF 32-bit MSB relocatable, PA-RISC, version 1
> [shaver@loonie /tmp]$
> 
> Mike
> 
> -- 
> 169530.70 140316.26
> 
> -------------------------------------------------------------------------
> To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
