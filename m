Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from delenn.fl.net.au (int-mail.syd.fl.net.au [202.181.0.28])
	by dsl2.external.hp.com (Postfix) with ESMTP id C357B48D3
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 20:23:41 -0700 (MST)
From: "Duraid Madina" <duraid@fl.net.au>
To: "'Matthew Wilcox'" <willy@debian.org>
Cc: "'Randolph Chung'" <randolph@tausq.org>,
	<parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Swap space limitions for Linux on parisc
Date: Sat, 9 Mar 2002 14:23:32 +1100
Message-ID: <000401c1c719$d018f190$022a17ac@simplex>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
In-Reply-To: <20020309030520.A26217@parcelfarce.linux.theplanet.co.uk>
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

> Hmm.  You would probably be best off making it work by 
> mmaping chunks of a data file at a time.

Doing "all that mmap stuff" is what I hoped I could avoid by throwing
some $$$$ at a 64-bit machine, and using swap "gently". So HP's new,
affordable PA-8700 machines look(ed) terrific. 

> Supporting >4GB of physical ram, which can be shared among 
> multiple processes, each being <4GB in size :-)

I know, I know, just having a whinge ;)
 
> gcc works fine on hpux...

Hmm.

	Duraid
