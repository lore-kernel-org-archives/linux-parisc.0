Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69154484B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Dec 2003 19:13:34 -0700 (MST)
Date: Thu, 18 Dec 2003 19:13:33 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [parisc-linux] Compiling Kernel for HP 9000/800/A400-44
Message-ID: <20031219021333.GD16266@colo.lackof.org>
References: <20031219011316.GC7469@MAIL.13thfloor.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031219011316.GC7469@MAIL.13thfloor.at>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Dec 19, 2003 at 02:13:16AM +0100, Herbert Poetzl wrote:
> Hi!
> 
> what is the best way to compile a 2.4.23-pa3
> kernel for a HP 9000/800/A400-44?

I'll assume you've already installed debian.

You'll need to grab the gcc-hppa64 compiler from:	
   ftp://ftp.parisc-linux.org/unofficial-debs/gcc-hppa64_3.0.4ds3-7.1_hppa.deb

Then follow directions on http://www.parisc-linux.org/kernel/index.html

If you a "custom-for-a500" config file, you can grab a 2.4.x kernel+config
file from ftp.parisc-linux.org/kernel/a500 to start with.

grant
