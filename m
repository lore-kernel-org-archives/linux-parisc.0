Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2BB924868
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Jan 2004 19:52:20 -0700 (MST)
Date: Wed, 7 Jan 2004 19:52:18 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Steve Bromwich <hppa@fop.ns.ca>
Subject: Re: [parisc-linux] scsi problem on a scorpio (715)
Message-ID: <20040108025218.GA20732@colo.lackof.org>
References: <3FFC9A15.6FA66B2@tiscalinet.it>
	<Pine.LNX.4.58.0401072226130.5327@brain.fop.ns.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0401072226130.5327@brain.fop.ns.ca>
Cc: Riccardo <rollei@tiscalinet.it>,
	parisc linux <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Jan 07, 2004 at 10:30:30PM -0400, Steve Bromwich wrote:
> Grant Grundler mentioned that "as of 5 years
> ago, HP-UX default was 8 for servers and 2 for workstations";

The drives shipped with workstations had "Write Cache Enable" (aka WCE)
turned on by default.  Not good if you really care about your data.
But Tag queue depth of 2 works great because the drive will immediately
report "success" until it's on-board cache was full.

>  as the 715
> is a workstation it might be worth trying setting tags to 2 and seeing
> what happens?

Unless performance is more important than strict correctness, I still
reccommend tag queue depth of 8 and disable "Write Cache" setting.
Reducing queue depth further typically only limits performance.

I suspect something else is wrong in Riccardo's case. But it wouldn't
hurt disable queue tags completely and see if that is at least stable.

root@debian:~# sginfo -c /dev/sda

Data from Caching Page
----------------------
Write Cache                        0
Read Cache                         1
Prefetch units                     0
Demand Read Retention Priority     0
Demand Write Retention Priority    0
Disable Pre-fetch Transfer Length  65535
Minimum Pre-fetch                  0
Maximum Pre-fetch                  65535
Maximum Pre-fetch Ceiling          65535

hth,
grant
