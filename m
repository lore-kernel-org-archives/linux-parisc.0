Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9AFCD4840
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Jan 2004 15:11:51 -0700 (MST)
Date: Fri, 23 Jan 2004 15:11:49 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: "Peralta, Joseph A" <jperalta@WPI.EDU>
Subject: Re: [parisc-linux] menu not available
Message-ID: <20040123221149.GA1310@colo.lackof.org>
References: <9FD9A988D765C742A42FE2176979579650D310@postoffice.academic.wpi.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9FD9A988D765C742A42FE2176979579650D310@postoffice.academic.wpi.edu>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Jan 23, 2004 at 04:47:11PM -0500, Peralta, Joseph A wrote:
> When I try to install certain X-window managers under Debian 3.0 I get
> "xxx depends on menu (>> 1.5)... menu is not available" How would I fix
> this?

Dunno...menu is available for "sarge" (aka testing) and that
works for me. Sounds like someone wants to backport to Woody.

grundler <559>dpkg -l menu
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
ii  menu           2.1.9-4        Provides update-menus functions for some app

grant
