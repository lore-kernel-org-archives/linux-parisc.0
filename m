Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB6AA4849
	for <parisc-linux@parisc-linux.org>; Wed, 27 Feb 2002 10:21:28 -0700 (MST)
Date: Wed, 27 Feb 2002 17:19:40 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: hplinux@eagle.grdl.noaa.gov
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] PA-RISC 0.9.3 + C200 + Visualize-EG = HPMC
In-Reply-To: <3C7D115C.9AEE5DDB@eagle.grdl.noaa.gov>
Message-ID: <Pine.LNX.4.44.0202271717330.15229-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 27 Feb 2002 hplinux@eagle.grdl.noaa.gov wrote:

> Hello PA-RISC list,
>
> I have successfully installed Debian 3.0/PA-RISC-Linux 0.9.3, on an
> HP-9000
> C200, but cannot get X working to save me. Following earlier posts to
> this list
> I made sure that only one screen resolution was specified in my
> XF86Config-4
> file (1280x1024-8, matching the stifb settings for the console) and
> checked
> it via "fbset -i".

so far so good ...

> The graphics card on my C200 is a Visualize-EG (A4450A) which is, I
> believe, a GSC vs. PCI card. In any case, trying to start X blanks the
> screen, then a few seconds later I get a High Priority Machine Check
> error as the workstation locks up. Any insights or workarounds most
> appreciated!

that's the problem!
I have a C240 with the same graphics card. It is (still) unsupported.
You have to wait until s.o. develops a working driver (or implement
it by yourself)

sorry.

> Thanks,
> John
>
> P.S. I tried a newer kernel, 2.4.17, to no avail.

greetings max
