Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2CBB4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Jan 2003 13:13:43 -0700 (MST)
Date: Tue, 7 Jan 2003 15:13:19 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	jsoe0708@tiscali.be, "Vlad D. Markov" <markov@monmouth.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel panic when extracting large tar files
Message-ID: <20030107201319.GA20757@systemhalted>
References: <20030107091704.GC4093@dsl2.external.hp.com> <05456AF0-223D-11D7-950D-0030656F07A2@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <05456AF0-223D-11D7-950D-0030656F07A2@esiee.fr>
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

> Matthieu Delahaye told me that since the very first days of pa/linux; 
> this bug has existed, mostly happening on 'un-taring' files, obliging 
> users to untar by small chunks of data.

And hardware errors have existed since the beggining of time ;)
 
> FWIW, I experienced that bug too on the A500, had no time to chase it 
> down but I will look at it soon.

How big is the file? I routinely tar/untar _very_ large source archives
on my A500 and I see no problems. 

c.
