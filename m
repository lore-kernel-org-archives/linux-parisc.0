Return-Path: <mort@galileo.bork.org>
Received: from galileo.bork.org (galileo.bork.org [66.11.174.156])
	by dsl2.external.hp.com (Postfix) with SMTP id D7F68482E
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 16:54:20 -0600 (MDT)
Date: Wed, 28 Apr 2004 18:54:20 -0400
From: Martin Hicks <mort@bork.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] A job for a debian-developer?
Message-ID: <20040428225420.GB21045@localhost>
References: <20040428180741.GH6936@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040428180741.GH6936@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



On Wed, Apr 28, 2004 at 02:07:41PM -0400, Carlos O'Donell wrote:
> 
> parisc-linux,
> 
> Do we know if any programs use K_INLINE_SYSCALL from our
> linux/include/asm-parisc/unistd.h, or rather all the _syscall[n] macros?
> 
> It's rather wrong. Even if I were to correct the issue, I'm curious if
> anything uses these definitions. 

klibc uses the _syscall[n] stuff.

mh

-- 
Martin Hicks || mort@bork.org || PGP/GnuPG: 0x4C7F2BEE
