Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (d072.dhcp212-198-140.noos.fr [212.198.140.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A7C24829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Aug 2002 02:21:39 -0600 (MDT)
Date: Mon, 12 Aug 2002 10:21:35 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: Andrew Shugg <andrew@neep.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Updated parisc-linux .cvsrc
Message-Id: <20020812102135.6bb1cff0.varenet@esiee.fr>
In-Reply-To: <20020812155838.A897@neep.com.au>
References: <1029108194.637.9.camel@beavis>
	<20020812155838.A897@neep.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 12 Aug 2002 15:58:40 +0800
Andrew Shugg <andrew@neep.com.au> wrote:

> Ryan Bradetich said:
> > Matt Taggart finally figured out that the update had the -P (prune)
> > option, and the checkout option did not.  Adding the -P option to the
> > checkout command fixed this problem.
> 
> In my experience it has been more common to fix the repository.  =)
Heh, sure, but this is not actually *possible*, so to speak: Matt pointed out that folders can't be removed from the repository, since they are mandatory to keep the 'Attic' in them.
That allows anyone to grab an old version of the kernel, using cvs tags...


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
