Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id B78254852
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 27 Feb 2004 18:06:45 -0700 (MST)
Date: Fri, 27 Feb 2004 18:06:44 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] kernel 2.6.3 compile problem
Message-ID: <20040228010644.GB1756@colo.lackof.org>
References: <200402271110.50459.eggert.ehmke@berlin.de>
	<Pine.LNX.4.58.0402271018590.3556@sal.ucc.ie>
	<20040227224926.GA10923@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040227224926.GA10923@baldric.uwo.ca>
Cc: Randolph Chung <tausq@debian.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Feb 27, 2004 at 05:49:26PM -0500, Carlos O'Donell wrote:
> This is the culprit, and I stumble across it all the time. How do we go
> about setting this to CONFIG_VGA_CONSOLE=n as the default? 


change drivers/video/console/Kconfig:
config VGA_CONSOLE
        bool "VGA text console" if EMBEDDED || !X86
        depends on !ARCH_ACORN && !ARCH_EBSA110 && !4xx && !8xx && !SPARC32 && !SPARC64 && !M68K
        default y
...

I'm not sure why, but is arch/parisc/defconfig being ignored?
It seems to disable VGA_CONSOLE by default as do all the
sample configs in arch/parisc/configs/*.

grant
