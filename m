Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8A5A4868
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 20 Feb 2004 12:07:25 -0700 (MST)
Date: Fri, 20 Feb 2004 19:07:19 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] b2k scsi disk pb
In-Reply-To: <402A4CA500006E8D@ocpmta2.freegates.net>
Message-ID: <Pine.LNX.4.58.0402201900540.26386@sal.ucc.ie>
References: <402A4CA500006E8D@ocpmta2.freegates.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, 20 Feb 2004, Joel Soete wrote:

> on my b2k since I can run 2.6 (32bit with gcc-3.3 or 64bit with gcc-3.0)
> i noticed from time to time such dmesg:
> sym0:5:0: ABORT operation timed-out.
> sym0:5:0: ABORT operation started.

[...]

> sym0:5:0: ABORT operation timed-out.
> sym0:5:0: DEVICE RESET operation started.
> sym0:5:0: DEVICE RESET operation timed-out.
> sym0:5:0: BUS RESET operation started.
> sym0: SCSI BUS reset detected.
> sym0: SCSI BUS has been reset.
> sym0:5:0: BUS RESET operation complete.
>
> and during this time the system naturaly hang.

(or is at least *very* slow)

> scsi id 5 is the one of the working boot disk (a quantum model atlas5-9lvd)
> and if there is well a second disk (a seagate model ST336704LC) it is not
> used.

Had the same problem when attaching a SE-SCSI device (also a Seagate, 20GB)
on my C3k (which has 2 internal LVD SCSI-drives).

Got rid of it by not using the SE-SCSI driver ;)
Try to physically detach the (not-used) ST336704LC.

> OTC with 2.4 and sym2 driver, I never noticed this behavior (even with recent
> 2.4.25-rc?-pa0 :) ), so I presume that there is no disk failure (and a dd
> if=/dev/sda of=/dev/null bs=1024k reach to read fully the disk without any
> error).

Yes, I think reading is fine, just (lots of) writing is triggering it.
    Max
