Return-Path: <herbert@13thfloor.at>
Received: from mail.13thfloor.at (MAIL.13thfloor.at [212.16.62.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9642C484B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Dec 2003 19:28:01 -0700 (MST)
Date: Fri, 19 Dec 2003 03:28:00 +0100
From: Herbert Poetzl <herbert@13thfloor.at>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Compiling Kernel for HP 9000/800/A400-44
Message-ID: <20031219022800.GA8847@MAIL.13thfloor.at>
References: <20031219011316.GC7469@MAIL.13thfloor.at>
	<20031219021333.GD16266@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031219021333.GD16266@colo.lackof.org>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Dec 18, 2003 at 07:13:33PM -0700, Grant Grundler wrote:
> On Fri, Dec 19, 2003 at 02:13:16AM +0100, Herbert Poetzl wrote:
> > Hi!
> > 
> > what is the best way to compile a 2.4.23-pa3
> > kernel for a HP 9000/800/A400-44?
> 
> I'll assume you've already installed debian.

right ...

> You'll need to grab the gcc-hppa64 compiler from:	
>    ftp://ftp.parisc-linux.org/unofficial-debs/gcc-hppa64_3.0.4ds3-7.1_hppa.deb

hmm, is there a source available somewhere ...
(I don't like binary only packages)

> Then follow directions on http://www.parisc-linux.org/kernel/index.html

okay, looks like the usual stuff ...

> If you a "custom-for-a500" config file, you can grab a 2.4.x kernel+config
> file from ftp.parisc-linux.org/kernel/a500 to start with.

found them at ftp://ftp.parisc-linux.org/kernels/a500/

TIA,
Herbert

> grant
