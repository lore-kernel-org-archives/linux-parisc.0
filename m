Return-Path: <ww@parc.styx.org>
Received: from parc.styx.org (PARC.STYX.ORG [209.161.199.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57BC248BA
	for <parisc-linux@parisc-linux.org>;
	Sun, 14 Mar 2004 12:41:16 -0700 (MST)
Date: Sun, 14 Mar 2004 14:43:22 -0500
From: William Waites <parisc@lists.styx.org>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Anyone still caring about 2.4?
Message-ID: <20040314194322.GM1130@parc.styx.org>
References: <20040310152904.GV2148@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040310152904.GV2148@parcelfarce.linux.theplanet.co.uk>
Cc: parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Mar 10, 2004 at 03:29:04PM +0000, Matthew Wilcox wrote:
> 
> I was just looking at a 2.4 problem for lamont so I went back to a 2.4
> tree I had lying around.  I found this diff:

When running a very memory intensive application
(Video Orbits), I noticed some strange behaviour
-- the cursor for example being in the wrong place
in a text window running emacs, and other wierd
not-strictly-repeatable things -- as the available
memory became very low. Applying this patch seems
to help.

William
-- 
/~\  The ASCII Ribbon Campaign
\ /    No HTML/RTF in email
 X     No Word docs in email
/ \  Respect for open standards
