Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1ACF94891
	for <parisc-linux@parisc-linux.org>;
	Fri,  2 Jan 2004 12:45:14 -0700 (MST)
Date: Fri, 2 Jan 2004 12:45:12 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Steve Bromwich <hppa@fop.ns.ca>
Subject: Re: [parisc-linux] Disk hanging problems with 715/100XC fixed
Message-ID: <20040102194512.GB30691@colo.lackof.org>
References: <Pine.LNX.4.58.0401011742320.26846@brain.fop.ns.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0401011742320.26846@brain.fop.ns.ca>
Cc: parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Jan 01, 2004 at 05:55:08PM -0400, Steve Bromwich wrote:
> I fixed this by setting NCR_700_MAX_TAGS to 8 in drivers/scsi/53c700.h.

As of 5 years ago, HP-UX default was 8 for servers and 2 for workstations.
I point this out because it means the SCSI devices one is likely 
to get with a parisc machine have only been qualified to work with
8 IOs outstanding. Setting MAX_TAGS to 8 might be a good first step
for all SCSI drivers when problems like this show up.

grant
