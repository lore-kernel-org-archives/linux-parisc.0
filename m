Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5F414845
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Dec 2003 06:17:44 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1ARtMV-0004fu-P6; Thu, 04 Dec 2003 13:17:43 +0000
Date: Thu, 4 Dec 2003 13:17:43 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.23 lcopy_in_user backport
Message-ID: <20031204131743.GL7096@parcelfarce.linux.theplanet.co.uk>
References: <3FB25B960000DA96@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FB25B960000DA96@ocpmta1.freegates.net>
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

On Thu, Dec 04, 2003 at 11:10:25AM +0100, Joel Soete wrote:
> Hi pa,
> 
> iirc this is a Carlos' chunk I try to backport:

Why?  Do we have a need for copy_in_user in 2.4?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
