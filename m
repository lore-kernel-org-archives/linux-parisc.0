Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4F784854
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 10 Dec 2003 18:29:54 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1AUFXq-0007Sy-00 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 10 Dec 2003 20:23:10 -0500
Date: Wed, 10 Dec 2003 20:23:09 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031211012309.GI15502@systemhalted>
References: <20031211004856.66476494275@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031211004856.66476494275@palinux.hppa>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 carlos
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Dec 10, 2003 at 05:48:56PM -0700, Carlos O'Donell wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	carlos	03/12/10 17:48:56
> 
> Modified files:
> 	include/asm-parisc: rt_sigframe.h 
> 	kernel         : Makefile signal.c 
> 
> Log message:
> Wrap the signal compat in CONFIG_COMPAT so 32-bit builds work properly.

I assumed CONFIG_COMPAT=Y for all the scenarios, and when Helge said his
32-bit build didn't work I had to slap my forehead.

So this patch removes all the compat signal code when doing a 32-bit
compile.

c.
