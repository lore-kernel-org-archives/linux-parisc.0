Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22E6A483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Sep 2003 12:55:34 -0600 (MDT)
Message-Id: <200309191855.h8JItUaf003758@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] r19 (aka pic-register akak ltp) not restored on
To: James.Bottomley@steeleye.com (James Bottomley)
Date: Fri, 19 Sep 2003 14:55:30 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, dave.anglin@nrc-cnrc.gc.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <1063996009.1832.34.camel@mulgrave> from "James Bottomley" at Sep 19, 2003 01:26:44 pm
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

> On Fri, 2003-09-19 at 12:51, Carlos O'Donell wrote:
> > mutex_unlock becomes:
> > __libc_maybe_call (__pthread_mutex_unlock, (m), (*(int *)(m) = 0))
> 
> This seems all to work:

Yah, the normal code that gcc generates to restore the ltp is very
extensively tested.  Shared libraries would break almost instantly
if there were major problems.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
