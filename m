Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A5F848AC
	for <parisc-linux@parisc-linux.org>; Tue, 14 Oct 2003 22:52:45 -0600 (MDT)
Date: Tue, 14 Oct 2003 22:52:42 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org,
	Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] L2000/N4000 smp devices/boot compare??
Message-ID: <20031015045242.GB7351@colo.lackof.org>
References: <20031003114959.GM24824@parcelfarce.linux.theplanet.co.uk> <3F8A272E0000157A@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F8A272E0000157A@ocpmta3.freegates.net>
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

On Tue, Oct 14, 2003 at 06:59:52PM +0200, Joel Soete wrote:
> If I well understand it means that a same real (absolute) address
> has a different virtual addresse for each processor?

multiple translations. It can be across processors but doesn't have to be.

> (btw Do you have any idea where i can find of the detail way to implement
> it?)

If someone had worked it out and provided a patch, we probably
be using it. I think that's what you (or someone) needs to do.

sorry, 
grant
