Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 105A64829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Sep 2002 00:30:16 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: "Tobias Giesen" <tobias_subscriber@tgtools.com>
Subject: Re: [parisc-linux] Re: [PATCH] Voodoo framebuffer on PARISC
Date: Mon, 16 Sep 2002 08:29:35 +0200
Cc: <parisc-linux@lists.parisc-linux.org>
References: <000001c25d16$80be8b30$0100a8c0@PLUTO>
In-Reply-To: <000001c25d16$80be8b30$0100a8c0@PLUTO>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200209160829.35216.deller@gmx.de>
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

Hi Tobias,

you should use a standard PC mulitfrequency monitor, as most
HP monitors are fixed frequency and won't work.

Furthermore you might search in sstfb.c for:
/*
  Default video mode .
  0 800x600@60  took from glide
  1 640x480@75  took from glide
  2 1024x768@76 std fb.mode
  3 640x480@60  glide default */
#define DEFAULT_MODE 1

and try to change the DEFAULT_MODE to 2 or 0.

Greetings,
Helge

On Monday 16 September 2002 02:17, Tobias Giesen wrote:
> Hello,
>
> I think I need some more help with this. Here's what I did:
>
> - grabbed fresh 2.4.19-pa17 sources
> - applied sstfb.c and .h patch
> - set kernel options to include sst1
> - compiled & installed new kernel
>
> The new kernel seems to try to activate a Voodoo console shortly after
> the "If this is the last message you see ..." warning. However, my
> monitor says the frequencies are out of range and switches itself off.
> The main sti console is then dead also.
>
> Any ideas? Maybe could I try a precompiled kernel with Voodoo support?
>
> Thanks.
>
> Best wishes,
> Tobias Giesen
