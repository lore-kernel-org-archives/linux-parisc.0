Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 22 Aug 2003 23:43:22 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] sym53c8xx_2 development
Message-ID: <20030823054322.GA20158@dsl2.external.hp.com>
References: <20030821211932.GC19630@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030821211932.GC19630@parcelfarce.linux.theplanet.co.uk>
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

On Thu, Aug 21, 2003 at 10:19:32PM +0100, Matthew Wilcox wrote:
> 
> Hi.  I've got some changes for the sym53c8xx_2 driver I'm working on.
> Does anyone object to me working on them in the parisc 2.6 tree?

I don't think enough people are *using* 2.6 for anything serious
for that to be a problem. And I'm ok if you warn before committing
stuff which isn't at least lightly tested.

> We've done this kind of thing before (eg with the pcnet32 driver in 2.4)

and I've done it with several other drivers as well (eg tg3, acenic).

> but since every PCI-based parisc box uses sym53c8xx_2 for its scsi,
> I didn't feel it was appropriate to inflict potentially-buggy changes
> on everyone without a little bit of discussion.

cool - thanks!
grant
