Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 983824846
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 30 Mar 2004 10:51:58 -0700 (MST)
Date: Tue, 30 Mar 2004 10:51:57 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Prakash Shenoy <mpshenoy@vsnl.com>
Subject: Re: [parisc-linux] HP 9000 Visualize C180 Workstation display does
	not appear.
Message-ID: <20040330175157.GA18103@colo.lackof.org>
References: <OFEELBIMFFDMJBJFHICCKELICEAA.mpshenoy@vsnl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OFEELBIMFFDMJBJFHICCKELICEAA.mpshenoy@vsnl.com>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Mar 29, 2004 at 10:47:59PM -0500, Prakash Shenoy wrote:
> I have two SCSI hard disks on the workstation and debian installed on drive
> 0. The system stops at ISL prompt.

If it stops at the ISL prompt, it means the system is autobooting
the "HPUX" disk. Reset the box,  interrupt the autoboot, then
set the primary boot path to "drive 0" (use the proper HW path).
And then boot from that same path (eg "bo fwscsi.0")

grant
