Return-Path: <hppa-linux@puffingroup.com>
Message-Id: <m10Dmte-0007U1C@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: [hppa-linux] egcs and binutils cross compiling
To: hppa-linux@puffingroup.com
Date: Fri, 19 Feb 1999 10:10:58 +0000 (GMT)
In-Reply-To: <Pine.LNX.3.96.990219020153.6493S-100000@devserv.devel.redhat.com> from "Alex deVries" at Feb 19, 99 02:15:37 am
Content-Type: text
Resent-Message-ID: <"UgAFZ3.0.jI7.IoIps"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

> Also, Paul is changing the ELF header structure significantly between
> mklinux and *real* linux, so we're getting close to having to just abandon
> all of mklinux.

Write an mklinux binary loader bfore you do that. Having a mostly functional
user space while doing kernel hacks, and being able to use mklinux to mend
the result of failed native kernels is a large win

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
