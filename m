Return-Path: <sieler@allegro.com>
Received: from opus.allegro.com (opus.allegro.com [209.10.39.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id DBCE548C3
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Dec 2003 18:03:52 -0700 (MST)
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200312170103.hBH13eb26857@opus.allegro.com>
Subject: Re: [parisc-linux] Question about cache flushing and fork
To: lamont@debian.org (LaMont Jones)
Date: Tue, 16 Dec 2003 17:03:40 -0800 (PST)
In-Reply-To: <20031217003001.GG25535@mmjgroup.com> from "LaMont Jones" at Dec
	16, 2003 05:30:01 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: randolph@tausq.org, John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

> The architecture requires that pdc calls be done at ring 0, with PSW.D=0,
> so no.  Having said that, many of the interesting return values are
> available from the kernel, either through sysconf or (sigh) /dev/kmem.

HP-UX's /dev/diag/diag2 definitely seems to return cache information.

However, it's going to be up to HP to reveal the calling sequence and
semantics / cautions.
 
-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com
