Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spawn.hockeyfiend.com (dsl092-073-086.bos1.dsl.speakeasy.net [66.92.73.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id D7375482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jan 2002 12:15:11 -0700 (MST)
Date: Thu, 10 Jan 2002 14:08:40 -0500 (EST)
From: "Christopher C. Chimelis" <chris@debian.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] binutils: opcodes and bfd
In-Reply-To: <3C3DCF11.19BC5E24@admin.france.hp.com>
Message-ID: <Pine.LNX.4.21.0201101406030.23934-100000@spawn.hockeyfiend.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 10 Jan 2002, Bruno Vidal wrote:

> First, thanks for your feedback, now the dump modules is working fine.
> The system is able to dump. But now I need to modify the tool to retrieve
> the dump. But I need bfd and opcode: libbfd.a and libopcode.a. It is part
> of the binutil package. But in the last debian package this two librairies
> are missing.

You need the binutils-dev package installed.  It also contains the .so
symlinks that you may need :-)

At first, I was stunned to read the above since I personally built the
binutils debs on the a500 and uploaded them (I'm the maintainer, btw :-P),
but then realised that you were looking for binutil (no 's') and that's
why you couldn't find it :-)

C
