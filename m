Return-Path: <mpshenoy@vsnl.com>
Received: from sccrmhc12.comcast.net (sccrmhc12.comcast.net [204.127.202.56])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8945E4A23
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 30 Mar 2004 18:37:10 -0700 (MST)
From: "Prakash Shenoy" <mpshenoy@vsnl.com>
To: "Grant Grundler" <grundler@parisc-linux.org>
Subject: RE: [parisc-linux] HP 9000 Visualize C180 Workstation display does
	not appear.
Date: Tue, 30 Mar 2004 20:37:22 -0500
Message-ID: <OFEELBIMFFDMJBJFHICCOEMFCEAA.mpshenoy@vsnl.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20040330175157.GA18103@colo.lackof.org>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi!

Thanks for all the help. Sorry to bother you again.
I tried

	bo fwscsi.6.0.

I get this error message:

ISL booting hp/ux.

exec failed: cannot find /stand/vmunix or /vmunix.

Please note that I have formatted both the hard disks and installed debian
on fwscsi.6.0.
What may be wrong here?

Prakash




-----Original Message-----
From: Grant Grundler [mailto:grundler@parisc-linux.org]
Sent: Tuesday, March 30, 2004 12:52 PM
To: Prakash Shenoy
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP 9000 Visualize C180 Workstation display
does not appear.


On Mon, Mar 29, 2004 at 10:47:59PM -0500, Prakash Shenoy wrote:
> I have two SCSI hard disks on the workstation and debian installed on
drive
> 0. The system stops at ISL prompt.

If it stops at the ISL prompt, it means the system is autobooting
the "HPUX" disk. Reset the box,  interrupt the autoboot, then
set the primary boot path to "drive 0" (use the proper HW path).
And then boot from that same path (eg "bo fwscsi.0")

grant
