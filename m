Return-Path: <hppa-linux@puffingroup.com>
Message-ID: <2B3ABA2F850AD011937D0000C00700D001BEC93B@KES>
From: "Smith, Todd" <tssmith@kes.camcare.com>
To: "'hppa-linux@puffingroup.com'" <hppa-linux@puffingroup.com>
Subject: RE: [hppa-linux] egcs and binutils cross compiling
Date: Sat, 20 Feb 1999 12:29:05 -0500
MIME-Version: 1.0
Content-Type: text/plain
Resent-Message-ID: <"vaRnT2.0.Ez7.R7lps"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

Alex,

I certainly don't know what I talking about, but bear with me for a
moment.  Why does the ELF header structures need to change?  I thought
that one of the core strengths to Linux is the 99% code compatibility.
AFAIK, one of the original reasons to switch to ELF from a.out in the
i386 community to become closer to "mainstream" UNIX binary structures.

I understand that the Mach microkernel is a different underlying
structure then a monolithic kernel, but why is MkLinux and monolithic
Linux THAT much different in userspace?  If the ELF headers are
different, then no MkLinux binary would work on a HPPA monolithic
system.  I can understand vast low-level differences between monolithic
and Mklinux, but userspace binaries should be the same.

I realize that I am probably missing the point.  However, fragmentation
of Linux is something that I am against from the ground level.

Todd Smith  <todd.smith@camcare.com>

Systems Analyst
Charleston Area Medical Center 

-----Original Message-----
From: Alex deVries [mailto:adevries@redhat.com]
Sent: Friday, February 19, 1999 2:16 AM
To: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] egcs and binutils cross compiling



>Also, Paul is changing the ELF header structure significantly between
>mklinux and *real* linux, so we're getting close to having to just
abandon
>all of mklinux.

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
