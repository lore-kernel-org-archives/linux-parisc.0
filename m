Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E339F4908
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 18:20:37 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AuiIM-0003U6-3E; Sun, 22 Feb 2004 01:20:34 +0000
Date: Sun, 22 Feb 2004 01:20:33 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: can't compile 2.4.24: pdc_cons.o problem!
Message-ID: <20040222012033.GN11824@parcelfarce.linux.theplanet.co.uk>
References: <1077183184.403482d04a190@clients.latnet.lv>
	<20040222005241.GA30849@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040222005241.GA30849@colo.lackof.org>
Sender: <willy@www.linux.org.uk>
Cc: team@security.debian.org, dub@latnet.lv,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Feb 21, 2004 at 05:52:41PM -0700, Grant Grundler wrote:
> Normally, follow the conversations on parisc-linux mailing list.
> I don't know how useful bugs.debian.org is for kernel packages.
> "stable" hppa kernel is horridly stale (kernel-image-2.4.18*).
> Because of security bugs, folks should be using at least 2.4.24.
> (2.4.25 is the lastest available, not).
> 2.6 kernels seem to be working well for me (except for SMP).
> But it looks like the most recent debian upload was 2.4.21 based.

Wups, a common misconception by people not used to how Debian does things.
The Debian 2.4.x kernels receive backported security fixes rather than
just updating to the most recent version.  I can't say I entirely agree
with this policy, but it is how Debian security works.

See http://www.debian.org/security/ for announcements of newer
kernel versions.  For some reason, there's no 2.4.18-hppa update yet.
I don't know why that is, but I presume someone's working on it.

team@security.debian.org added to the cc list, in case there's anything
I can do to help.  Please remove them from the CC list if your reply
won't be of interest to them.

> I see that http://cvs.parisc-linux.org/downloads/autobuild-kernels/32/
> has a Packages.gz. But I don't know how the sources.list entry needs
> to look for apt-get to find it.

Something like:

deb http://cvs.parisc-linux.org/downloads/autobuild-kernels/ 32/

should do the trick, but I think you have the URL wrong.  I get:

/downloads/autobuild-kernels/32: unknown location

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
