Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5876C4834
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 30 Mar 2004 23:43:41 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1B8ZPD-0006k2-00 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 31 Mar 2004 01:40:55 -0500
Date: Wed, 31 Mar 2004 01:40:54 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Booting remounting and S10checkroot.sh,
	the saga of changes to how mount works...
Message-ID: <20040331064054.GC21909@baldric.uwo.ca>
References: <20040331063632.GB21909@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040331063632.GB21909@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Mar 31, 2004 at 01:36:32AM -0500, Carlos O'Donell wrote:
> So I rebooted to test my signal fixes, and I find that I can't boot my
> box anymore. It seems that /etc/rcS.d/S10checkroot.sh was no longer
> doing it's job of remounting / (LABEL=ROOT) rw. I mean it wasn't as if
> it didn't try, the kernel kept saying that I should specify a file
> system type.
> 
> It's not fun when this happens, because you have to boot some sort of
> rescue disk, and hack /etc/rcS.d/S10checkroot.sh!
> 
> The following was required to get my box back up... I don't think it's
> necc, but nor do I understand what's going on here. Is this part of
> those mount/remount changes I saw? :)
> 
> I think I might submit this to 'initscripts' as a "robustifying" patch.

Looks like they know....

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=239735

c.
