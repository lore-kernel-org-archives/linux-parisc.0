Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 487A84893
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Jul 2003 19:46:49 -0600 (MDT)
Date: Mon, 7 Jul 2003 21:45:51 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: grundler@parisc-linux.org, jsoe0708@tiscali.be,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] warning: minor abi change
Message-ID: <20030708014551.GB21801@systemhalted>
References: <20030707200240.GN30341@systemhalted> <200307072019.h67KJDMa002052@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200307072019.h67KJDMa002052@hiauly1.hia.nrc.ca>
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

> > I can't really come up with a scenario where userspace passes a function
> > pointer to the kernel and has the kernel call or compare the function
> > pointer?
> 
> One example is sigaction.

Fixable, I can stick a sigaction wrapper in userspace. Should we though?

c.
