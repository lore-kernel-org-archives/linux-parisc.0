Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA1074829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Jan 2003 05:39:19 -0700 (MST)
Date: Tue, 7 Jan 2003 13:39:10 +0100
Subject: Re: [parisc-linux] kernel panic when extracting large tar files
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v551)
Cc: jsoe0708@tiscali.be, "Vlad D. Markov" <markov@monmouth.com>,
	parisc-linux@lists.parisc-linux.org
To: grundler@dsl2.external.hp.com (Grant Grundler)
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20030107091704.GC4093@dsl2.external.hp.com>
Message-Id: <05456AF0-223D-11D7-950D-0030656F07A2@esiee.fr>
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

Well,

after having talked a bit with the 'pioneers' here at ESIEE, it appears 
that this tar problem is a long lasting one.

Matthieu Delahaye told me that since the very first days of pa/linux; 
this bug has existed, mostly happening on 'un-taring' files, obliging 
users to untar by small chunks of data.

FWIW, I experienced that bug too on the A500, had no time to chase it 
down but I will look at it soon.
It's near the top of my TODO list :)

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
