Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26D5A482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 01:36:33 -0700 (MST)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel8.hp.com (Postfix) with ESMTP id 4BEC5E00110
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 03:36:32 -0500 (EST)
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>,
	taggart@carmen.fc.hp.com
Subject: Re: [parisc-linux] binutils: opcodes and bfd 
In-Reply-To: Your message of "Fri, 11 Jan 2002 09:22:25 +0100."
             <3C3EA0C1.42DDF9E0@admin.france.hp.com>
References: <Pine.LNX.4.21.0201101406030.23934-100000@spawn.hockeyfiend.com>  <3C3EA0C1.42DDF9E0@admin.france.hp.com> 
Date: Fri, 11 Jan 2002 01:36:31 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020111083632.082A637D2B@carmen.fc.hp.com>
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

Bruno Vidal writes...

> 	Hi
> Sorry, but where can I download binutils-dev. It's not on the iso CDs.
> And the link on the debian seems broken, there is nothing under this director
> y !.
> ftp://ftp.debian.org/debian/dists/unstable/main/binary-hppa/
> On the debian site, I found only package for i386, not for parisc.

Debian packages now live in the pool. In your case,

ftp://ftp.fr.debian.org/debian/pool/main/b/binutils/binutils-dev_2.11.92.0.12.3-5_hppa.deb

But it's much easier to use apt-get or dselect to install packages rather
then downloading and installing by hand. Give them a try I think you'll
like them.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
