Return-Path: <pjlahaie@puffingroup.com>
Sender: pjlahaie@puffingroup.com
Message-ID: <36CEF609.3441E38C@atlsci.com>
Date: Sat, 20 Feb 1999 12:51:05 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@atlsci.com>
MIME-Version: 1.0
To: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] egcs and binutils cross compiling
References: <2B3ABA2F850AD011937D0000C00700D001BEC93B@KES>
Content-Type: text/plain; charset=us-ascii
Resent-Message-ID: <"LuTXx2.0.L-7.NVlps"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

"Smith, Todd" wrote:

> I certainly don't know what I talking about, but bear with me for a
> moment.  Why does the ELF header structures need to change?  I thought
> that one of the core strengths to Linux is the 99% code compatibility.
> AFAIK, one of the original reasons to switch to ELF from a.out in the
> i386 community to become closer to "mainstream" UNIX binary structures.

    The current idea is to make the kernel data structures as similar to
HP-UX as can be without changing the core OS.  This means we would need
an MkLinux compatibility layer to map from MkLinux structures to
Linux/HPPA structures.  The other point is that the MkLinux ELF
structure is MkLinux only.  All the other OSes that run on HPPA (Lites,
RTEMS) seem to use a different layout.  If we move to this layout, it
means we can use a pretty much standard egcs / binutils for Linux/HPPA. 
Since we will be going w/ glibc (not libc) and the port will be based on
2.2 (and moving to 2.3 when needed) the kernel structures will change to
accomodate larger uid/gid  (unless MkLinux already has the larger
uid/gids).

    Also, I am aware of little (if any) non-open source packages that
run under MkLinux and since this port aims to run on at least all the
MkLinux supported hardware, there aren't many big reasons to worry about
MkLinux compatibility.

						- Paul

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
