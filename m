Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06BCE49A5
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 31 Mar 2004 05:15:15 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B8ecj-00086f-LI; Wed, 31 Mar 2004 13:15:13 +0100
Date: Wed, 31 Mar 2004 13:15:13 +0100
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Booting remounting and S10checkroot.sh,
	the saga of changes to how mount works...
Message-ID: <20040331121513.GN7709@parcelfarce.linux.theplanet.co.uk>
References: <20040331063632.GB21909@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040331063632.GB21909@baldric.uwo.ca>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Mar 31, 2004 at 01:36:32AM -0500, Carlos O'Donell wrote:
> So I rebooted to test my signal fixes, and I find that I can't boot my
> box anymore. It seems that /etc/rcS.d/S10checkroot.sh was no longer

This is what happens when you don't keep up with the latest CVS version ;-)
Fixed in our kernel on Monday:

http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2004-March/033952.html

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
