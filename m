Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B2DE4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Jan 2003 16:25:34 -0700 (MST)
Date: Wed, 8 Jan 2003 00:25:21 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: grundler@dsl2.external.hp.com, jsoe0708@tiscali.be,
	markov@monmouth.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel panic when extracting large tar files
Message-Id: <20030108002521.21a9c5e7.varenet@esiee.fr>
In-Reply-To: <20030107201319.GA20757@systemhalted>
References: <20030107091704.GC4093@dsl2.external.hp.com>
	<05456AF0-223D-11D7-950D-0030656F07A2@esiee.fr>
	<20030107201319.GA20757@systemhalted>
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

On Tue, 7 Jan 2003 15:13:19 -0500
"Carlos O'Donell" <carlos@baldric.uwo.ca> wrote:

> > Matthieu Delahaye told me that since the very first days of pa/linux; 
> > this bug has existed, mostly happening on 'un-taring' files, obliging 
> > users to untar by small chunks of data.
> 
> And hardware errors have existed since the beggining of time ;)
Hardware errors happening on several boxes and only when unpacking an archive?
Kinda "feature" heh ? :)
>  
> > FWIW, I experienced that bug too on the A500, had no time to chase it 
> > down but I will look at it soon.
> 
> How big is the file? I routinely tar/untar _very_ large source archives
> on my A500 and I see no problems. 
About 700M gzipped.


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
