Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2973482C
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 02:26:12 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id EAA26514
	for <parisc-linux@lists.parisc-linux.org>; Mon, 8 Oct 2001 04:26:07 -0400
Message-Id: <200110080826.EAA26514@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Glibc 2.2.4-2 Woes...
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 08 Oct 2001 04:26:07 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

> 
> M,
> 
> I see what you mean now.
> I have glibc 2.2.4-2 compiling all the way to the point where it
> starts churning thorugh:
> 
> make  -C sunrpc others

Hi!

Stuff fails in sunrpc, because it tries to do something like

rpcgen -Y `gcc -print-file-name=cpp | sed 's|/cpp$||'`

Argument to -Y option should be the dir, where cpp is located, so the
build expects, that `gcc -print-file-name=cpp` will return a full
path to cpp. Well, it does not. It spits out "cpp" and then sed
replacement fails, so the actual command being run is

rpcgen -Y cpp/cpp

It is probably easily fixable, but there is also a simple workaround:

cd .../glibc/sunrpc (NOT glibc-build)
mkdir cpp
cd cpp
ln -s /path_to_real_cpp/cpp cpp

After that I was able to finish the build.

Best regards,

Jurij.
