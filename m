From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] BUG 2.6.11-rc4-pa1 XFS data page fault
Date: Mon, 21 Feb 2005 16:58:04 +0000
Message-ID: <20050221165804.GD28741@parcelfarce.linux.theplanet.co.uk>
References: <20050218062312.GA11968@colo.lackof.org>
	<20050218092835.0E74E3658E2@mail.esiee.fr>
	<20050219022808.GA28925@colo.lackof.org>
	<200502190417.59359.mszick@wolfbutter.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Michael S. Zick" <mszick@wolfbutter.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200502190417.59359.mszick@wolfbutter.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Feb 19, 2005 at 04:17:59AM -0600, Michael S. Zick wrote:
> I would suggest sticking with: 'noudev nodevfs pci=routeirq'
> command line options until more is known.
> (They should make system work like pre-2.6.9)

pci=routeirq only has effect on i386 and ia64 boxes.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
