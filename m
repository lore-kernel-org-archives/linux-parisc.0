Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc1-hem11-4-cust109.lutn.cable.ntl.com [80.2.252.109])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4BF98482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Aug 2003 03:22:20 -0600 (MDT)
Date: Fri, 1 Aug 2003 10:05:33 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Greg Anderson <greg@planetbeagle.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] How to install X on 715/50 -- problem with twm
Message-ID: <20030801090533.GK727@sleepie.demon.co.uk>
References: <5.2.1.1.2.20030731163951.00b423d0@127.0.0.1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.2.1.1.2.20030731163951.00b423d0@127.0.0.1>
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

On Thu, Jul 31, 2003 at 04:45:41PM -0700, Greg Anderson wrote:
> Hi all,
> 
> I'm sure this is a FAQ, but I didn't find an answer anywhere in the archives.
> 
> I've just installed Debian 3.0 (woody) on my venerable HP 715/50.  The install went flawlessly and easily (great kudos to all involved in the hppa port!)
> 
> Now I'm envious of all you hppa Linux old-timers who are running Gnome, and I'm trying to load the X windows stuff.  I tried installing X Windows and Desktop System from tasksel, and I also tried installing X Windows "by hand" using apt-get.  Either way, the install will not complete, saying that twm cannot be installed.
> 
> When I try to install twm, I get:
> 
> # apt-get install twm
> Reading Package Lists... Done
> Building Dependency Tree... Done
> Some packages could not be installed. This may mean that you have
> requested an impossible situation or if you are using the unstable
> distribution that some required packages have not yet been created
> or been moved out of Incoming.
> 
> Since you only requested a single operation it is extremely likely that
> the package is simply not installable and a bug report against
> that package should be filed.
> The following information may help to resolve the situation:
> 
> Sorry, but the following packages have unmet dependencies:
>   twm: Depends: menu (> 1.5) but it is not installable
> E: Sorry, broken packages
> 
> 
> When I look around for the menu package, it's nowhere to be found.
> 
> What to do?  Do you all install XFree86 from its own distribution, bypassing the .deb files?

Well, it's twm that has the problem, not XFree86.  Maybe we don't use
twm.  Looks like menu is indeed not in woody, but is in sarge and sid;
iirc it is a c++ program that we used to have trouble building.

Richard
