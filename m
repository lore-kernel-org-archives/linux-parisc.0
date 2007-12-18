From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: __ex_table writable on parisc?
Date: Tue, 18 Dec 2007 11:48:01 -0500
Message-ID: <20071218164801.GA7847@fattire.cabal.ca>
References: <47680094.76E4.0078.0@novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: grundler@parisc-linux.org, kyle@parisc-linux.org, matthew@wil.cx,
	linux-parisc@vger.kernel.org
To: Jan Beulich <jbeulich@novell.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47680094.76E4.0078.0@novell.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 18, 2007 at 04:17:08PM +0000, Jan Beulich wrote:
> In an attempt to move as much common code into include/asm-generic/vmlinux.lds.h
> I found that parisc puts __ex_table into writeable data - is there any real
> need to this? My intention was to make this part of RODATA...
> 

likely just an oversight. feel free to proceed with your cleanups, if
anything breaks, i'll squeak eventually. ;-)

cheers,
	kyle
