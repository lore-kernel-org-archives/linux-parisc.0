Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A5CB4834
	for <parisc-linux@parisc-linux.org>; Wed, 26 Sep 2001 00:12:48 -0600 (MDT)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id IAA25085 for <parisc-linux@parisc-linux.org>; Wed, 26 Sep 2001 08:12:46 +0200 (MET DST)
Message-Id: <sbb18da2.042@ms-zrt1>
Date: Wed, 26 Sep 2001 08:05:23 +0200
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <ra@hp.is>
Cc: <parisc-linux@parisc-linux.org>
Subject: Betr.: Re: [parisc-linux] Trace/breakpoint trap
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>On Tue, Sep 25, 2001 at 06:18:57PM -0600, Matt Taggart wrote:
>>=20
>> Richard Allen writes...
>>=20
>> > Here's a wild one:
>> >=20
>> > bofh:~/rpm-4.0.3/rpmdb# make
>> > Trace/breakpoint trap
>> > bofh:~/rpm-4.0.3/rpmdb# echo $?
>> > 133
>> > bofh:~/rpm-4.0.3/rpmdb#
>>=20
<snip>

>[pid  4249] close(4)                    =3D 0
>[pid  4249] close(1)                    =3D 0
>[pid  4249] exit(0)                     =3D ?
><... read resumed> "mut_fcntl.lo client.lo db_server"..., 200) =3D 200
>--- SIGCHLD (Child exited) ---
>rt_sigreturn(0)                         =3D 200
>rt_sigreturn(0)                         =3D 200
<snip>

I have exactly the same on my C200+, since 2.4.9-<who knows>, but it went
away when I didn't compile the kernel for PA8x00, but for the default =
value
of PA7100. That means it may be something in the kernel, or some gcc bug.
In my case, a 'make mrproper' in the kernel source directory triggered it.

I have posted it to this list, some weeks ago (under much the same =
subject).

Perhaps recompiling your kernel also fixes it?

Good luck,
Jurriaan
