Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns2.soark.net (ns2.soark.net [206.107.134.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 99BC8482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 May 2002 08:49:45 -0600 (MDT)
Received: from localhost (orac@localhost)
	by ns2.soark.net (8.11.1/8.11.1) with ESMTP id g4SEnan17786
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 May 2002 09:49:36 -0500
Date: Tue, 28 May 2002 09:49:36 -0500 (CDT)
From: Orac <orac@soark.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms
 cross-compile
In-Reply-To: <20020528142736.GA9288@tykepenguin.com>
Message-ID: <Pine.LNX.4.21.0205280946160.17528-100000@ns2.soark.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

I have it running on a C110 currently. It was installed however on a
712/100 and drive was copied and kernel recompiled for the 7200 series
CPU. Are you running graphic or serial console? I am running serial
console only.

MaShaun Jones


On Tue, 28 May 2002, Patrick Caulfield wrote:

> On Mon, May 27, 2002 at 12:13:21AM -0400, Carlos O'Donell Jr. wrote:
> > Parisc,
> > 
> > All the changes from -pa24 to -p26 have been merged into the
> > kdb-v21 tree (that Randolph graciously started!). Thanks go
> > to bame's recipe!
> > 
> > A few tests show that it is equivalent to the patches I had 
> > produced (fixes to traps.c for the soft power button).
> > 
> > If kdb is your bag, then it should all be set to go!
> 
> I can't get it to boot on my C110 - it gets stuck at the old familar "if this is
> the last message you see" message. I can run the Debian 2.4.18 kernel OK on this
> box.
> 
> Any ideas anyone?
> 
> patrick
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
