From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] preliminary strace patch
Date: Tue, 14 Aug 2007 09:46:09 -0400
Message-ID: <119aab440708140646m496a74f0r9d3425ccc3e4df30__30419.4734817886$1416624427$gmane$org@mail.gmail.com>
References: <200708122325.07259.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Helge Deller" <deller@gmx.de>
Return-Path: <patofiero@gmail.com>
In-Reply-To: <200708122325.07259.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On 8/12/07, Helge Deller <deller@gmx.de> wrote:
> I noticed, that strace was pretty much useless/broken, if you use shared memory/ipc calls or the stat64() syscall.
>
> Example:
> root@c3000:~# strace df -h /
> [....]
> write(1, "Filesystem            Size  Used"..., 55Filesystem            Size  Used Avail Use% Mounted on
> ) = 55
> upeek: ptrace(PTRACE_PEEKUSER,29538,4294967292,0): Input/output error
>
> Below is a patch against strace-4.5.15 source package from sourceforge.
> Maybe it's useful to some people here, although it's not cleaned up/correct at all yet.
> Feedback/corrections (esp. for the new syscalls >= 295) are welcome, because I only focused on statfs64()/fstatfs64() at this moment.

Helge,

That's awesome! Please send it upstream, even it they ignore you,
atleast the patch will appear in the archives. I'm sure debian would
take a half-clean patch against strace as long as it only effected
hppa.

Cheers,
Carlos.
