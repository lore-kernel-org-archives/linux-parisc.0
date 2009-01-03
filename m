From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: bad code with gcc-4.3 and lzma-utils ?
Date: Sat, 3 Jan 2009 06:40:07 -0700
Message-ID: <20090103134006.GW2002@parisc-linux.org>
References: <200901030745.01638.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200901030745.01638.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jan 03, 2009 at 07:45:01AM -0500, Mike Frysinger wrote:
> the kernel logs the fault like so:
> do_page_fault() pid=15903 command='lzma' type=15 address=0x00000063

That's a null pointer dereference ...

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
