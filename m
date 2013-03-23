From: Helge Deller <deller@gmx.de>
Subject: Re: Did Squeeze ever make it to HPPA?
Date: Sat, 23 Mar 2013 23:04:51 +0100
Message-ID: <514E2703.9000507@gmx.de>
References: <514C43F3.4040206@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Kurt Fitzner <kurt.fitzner@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <514C43F3.4040206@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Kurt,

On 03/22/2013 12:43 PM, Kurt Fitzner wrote:
> I see on the PA-RISC Linux web site a note about Squeeze being worked on
> for HPPA.  I also see a few old discussions on the subject here.  Did
> this ever make it past the discussion stage?

Partly...

> Was there an HPPA testing back in Lenny, or just unstable?  What I am
> looking for, I suppose, is the most "squeeze-like" packages available.

- latest before-squeeze unstable packages were moved to debian-ports.org
- John David Anglin has continued to build current debian "unstable" packages
- I've provided a download-location at ftp.parisc-linux.org for those.

So, what you need to do is to drop other lines from your /etc/apt/sources.list file, and instead add those two lines:

deb ftp://ftp.de.debian.org/debian-ports unstable main
deb ftp://ftp.parisc-linux.org/debian-ports/unstable  unstable main

This will bring you up to debian-unstable (which is more like wheezy) for the most important packages.
If you miss specific packages, please let us know.

Dave and me are still hoping to be able to set up a buildd-server for parisc again.

Helge
