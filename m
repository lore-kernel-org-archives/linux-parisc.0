Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 123C64852
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 21 Dec 2003 19:07:45 -0700 (MST)
Date: Sun, 21 Dec 2003 19:07:43 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] audit for copyright/license
Message-ID: <20031222020743.GD26083@colo.lackof.org>
References: <20031221041802.GB12969@colo.lackof.org>
	<3FE5E4E6.2090208@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FE5E4E6.2090208@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Dec 21, 2003 at 06:22:30PM +0000, Joel Soete wrote:
> in COPYING (i.e. GNU GPL version 2) under section "How to Apply These Terms 
> to Your New Programs"
> stand what I would trust being the standard formula you are loocking for:

Thanks for digging that up - that's in fact what I was looking for.

We need to determine which files have:
a) no copyright
b) a non standard copyright
c) no license
d) a non standard license

You have time to prepare a patch for (b) and (d)?
Preferably seperate patches.

If someone prepared a precise list of (a) and (c) I could start determining
who owns (a) for each file and add the appropriate copyright.
I or willy could ask for (c) get formal permission to use GPL if it's not
part of the current team.

thanks,
grant
