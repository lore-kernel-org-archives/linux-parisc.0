Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2D5C4840
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Nov 2003 13:00:52 -0700 (MST)
Date: Fri, 21 Nov 2003 13:00:51 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [BUG] dcopserver: ICE Connection rejected!
Message-ID: <20031121200051.GC23972@colo.lackof.org>
References: <20031121005838.GC13007@colo.lackof.org> <20031121024339.GR30485@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031121024339.GR30485@parcelfarce.linux.theplanet.co.uk>
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

On Fri, Nov 21, 2003 at 02:43:39AM +0000, Matthew Wilcox wrote:
> The obvious question ... what're the ownership/permissions on
> your /tmp/.ICE-unix?  Mine are:
> 
> drwxrwxrwt    2 root     root         4096 Nov  9 18:24 .ICE-unix

I checked the ownership/perms on my other c3k that's not been updated
for a while and wne@ by grundler/grundler. Konqueror runs
fine on this box...here are versions on the working box:

Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
ii  konqueror      2.2.2-14       KDE's advanced File Manager, Web Browser and
ii  xbase-clients  4.2.1-12.1     miscellaneous X clients

and on the failing systems I pulled in stuff from
unstable to see if it would resolve the issue (it didn't):
+++-==============-==============-============================================
ii  konqueror      3.1.3-1        KDE's advanced File Manager, Web Browser and
ii  xbase-clients  4.2.1-14       miscellaneous X clients

I suspect some other common component is involved.

grant
