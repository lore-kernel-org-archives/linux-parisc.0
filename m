Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C720D4879
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 25 Jan 2004 15:40:41 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1Aksvo-0007BX-6Y; Sun, 25 Jan 2004 22:40:40 +0000
Date: Sun, 25 Jan 2004 22:40:40 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] menu not available
Message-ID: <20040125224040.GG11844@parcelfarce.linux.theplanet.co.uk>
References: <9FD9A988D765C742A42FE2176979579650D310@postoffice.academic.wpi.edu>
	<20040123221149.GA1310@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040123221149.GA1310@colo.lackof.org>
Sender: <willy@www.linux.org.uk>
Cc: "Peralta, Joseph A" <jperalta@WPI.EDU>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Jan 23, 2004 at 03:11:49PM -0700, Grant Grundler wrote:
> On Fri, Jan 23, 2004 at 04:47:11PM -0500, Peralta, Joseph A wrote:
> > When I try to install certain X-window managers under Debian 3.0 I get
> > "xxx depends on menu (>> 1.5)... menu is not available" How would I fix
> > this?
> 
> Dunno...menu is available for "sarge" (aka testing) and that
> works for me. Sounds like someone wants to backport to Woody.

menu is not available for woody because it's written in a language which
bears a passing resemblance to C++.  someone rewrote it in C++ for sarge.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
