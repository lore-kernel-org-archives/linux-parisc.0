Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4760495A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Aug 2003 11:18:41 -0600 (MDT)
Date: Tue, 26 Aug 2003 13:17:54 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
Message-ID: <20030826171753.GC32302@systemhalted>
References: <3F2E2C7700004E38@ocpmta2.freegates.net> <20030825164553.GB28778@dsl2.external.hp.com> <1061830247.2044.165.camel@mulgrave> <20030825191915.GA377@dsl2.external.hp.com> <1061840921.2044.368.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1061840921.2044.368.camel@mulgrave>
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

> Realistically, "logical" just means we make up a numbering scheme
> independent of what the HW tells us.  If the HW isn't telling us
> anything, then us telling the HW is fine.
> 
> The gist of the "no more logical mappings edict" is that basically we
> only have one source for CPU numbers (and it can be sparse) rather than
> two, one of which was usually compact.

I sense a Monty Python skit about '0 CPUs found' :)

HW: So how many we got today?
SW: Oh, zero.
HW: Zero?!
SW: Yeah, zaro CPU's found.
HW: Do you have an accent?
...

c.
