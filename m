Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id C71F2487B
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 24 Feb 2004 09:11:40 -0700 (MST)
Date: Tue, 24 Feb 2004 09:11:39 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] b2k scsi disk pb
Message-ID: <20040224161139.GC10551@colo.lackof.org>
References: <402A42A100007EE7@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <402A42A100007EE7@ocpmta1.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Feb 23, 2004 at 09:16:16AM +0100, Joel Soete wrote:
> In fact according <http://www.seagate.com/cgi-bin/view.cgi?/scsi/st336704.lw>
> it has the two possiblity SE or LVD according HW config (a side jumper J2
> if i well understand)

Ah ok. They have a jumper to force SE signalling. 

> >If both internal devices are LVD, check early sym2 dmesg output
> >to verify the SCSI bus is operating in LVD mode (vs SE).
> 
> But here they seems to work together in LVD mode:

Right. means the jumper is not connected and something else is wrong.

> Anyway what sym2 look for at scsi id 0?

It's just the first one.
SCSI scans from ID 0 to 15 to find devices.

grant
