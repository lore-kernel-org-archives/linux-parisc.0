Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12F5D483B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 14:56:07 -0600 (MDT)
Message-Id: <200209202056.g8KKu0XM019968@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] SMP kernel problems on a D350
To: randolph@tausq.org
Date: Fri, 20 Sep 2002 16:55:59 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, jeremyd@apptechsys.com,
	frts@simba.sch.bme.hu, grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020920205012.GF4909@tausq.org> from "Randolph Chung" at Sep 20, 2002 01:50:12 pm
MIME-Version: 1.0
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

> > Is there a way to turn off the unaligned handler?  It may be hiding
> > bad stuff going on in userland.  There are still cases where expect
> > causes a continuous sequence of unaligned faults.
> 
> not at runtime, but i can build a kernel with this turned off and let
> you test it.

Is there any software that actually needs the unaligned handler?
I think it would be useful for test purposes to have a kernel with
it off.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
