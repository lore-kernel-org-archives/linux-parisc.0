Return-Path: <pjlahaie@puffingroup.com>
Sender: pjlahaie@puffingroup.com
Message-ID: <36CD6BB0.CF02D28A@atlsci.com>
Date: Fri, 19 Feb 1999 08:48:32 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@atlsci.com>
MIME-Version: 1.0
To: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] egcs and binutils cross compiling
References: <m10Dmte-0007U1C@the-village.bc.nu>
Content-Type: text/plain; charset=us-ascii
Resent-Message-ID: <"k4lzA2.0.6M7.SrMps"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

Alan Cox wrote:
> 
> > Also, Paul is changing the ELF header structure significantly between
> > mklinux and *real* linux, so we're getting close to having to just abandon
> > all of mklinux.
> 
> Write an mklinux binary loader bfore you do that. Having a mostly functional
> user space while doing kernel hacks, and being able to use mklinux to mend
> the result of failed native kernels is a large win

    The current idea is that we will make the kernel data structures as
close to HP-UX as possible so future HP-UX compatibility is possible. 
If we go the MkLinux binary loader route then we'll be stuck making our
kernel structures MkLinux like or writing an emulation layer.  I'm no
ELF expert, but at least the MkLinux stuff seems easy, the
binary is mapped from beginning to end.  Sections aren't mapped at
different addresses (as other archs seem to do).

						- Paul

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
