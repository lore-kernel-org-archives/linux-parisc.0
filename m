Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33140482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 May 2002 11:00:30 -0600 (MDT)
To: Randolph Chung <tausq@debian.org>, joel.soete@freebel.net,
	carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb patches for -pa23 ... moooo! 
In-Reply-To: Your message of "Tue, 07 May 2002 10:41:29 MDT."
             <E17581p-0007Dm-00@paul.bame>
References: <1020756305.3cd7815151303@webmail.tiscalinet.be> <1020787573.3cd7fb75053c7@webmail.tiscalinet.be> <20020507174619.GO32033@tausq.org>  <E17581p-0007Dm-00@paul.bame> 
Date: Tue, 07 May 2002 11:00:24 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E1758K9-0000Kq-00@paul.bame>
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

> > Paul is doing a merge from trunk to the kdb branch. I would suggest
> > trying the stuff in cvs (kdb_v21 branch) instead.
> 
> The branch isn't ready yet...

I haven't confirmed that it works, but the kdb branch now includes all
the trunk changes from pa13 through pa24 courtesy of CVS, which is
not always perfect...  The result should probably be compared to Carlos'
recent work as a sanity check.

Please use the 'kdb_v21' branch for kdb-specific commits.  Committing
them to the trunk will cause an ugly mess :-)

	-P
