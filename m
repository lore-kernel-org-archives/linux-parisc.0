Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 10 Jan 2003 12:51:50 -0700
To: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ibm-disk on a hp 735/125
Message-ID: <20030110195150.GA21364@dsl2.external.hp.com>
References: <Pine.GSO.4.51.0301091743500.9837@sunhalle66> <20030110124210.GG2160@aurinko.ntc.nokia.com> <1042203531.19627.11.camel@linux> <20030110145800.GH2160@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030110145800.GH2160@aurinko.ntc.nokia.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Fri, Jan 10, 2003 at 04:58:00PM +0200, Nahkola Mikko wrote:
> time these boxes were made, there were supposed to be certain differences 
> between HP and regular disks. Or maybe that was just HP marketing.

testing. HP tests all it's HPUX products so they are usable in
"High Availability" configurations and work with all HPUX SCSI HBAs.

> At any rate, there _was_ (and still is, BTW) a way to recognize a HP disk 
> by the firmware - and there were differences between "workstation" and 
> "server" disks too, _and_ IIRC "workstation" disks weren't "expected to 
> work" in servers, the other way round it was "expected to work" but "unsupported" 
> or something. Don't remember.

workstation and server disks were for a long time seperate products
and tested seperately.  The reason was cost and time to market.
If you test something rigorously expect the testing  to (a) take longer
and (b) expose problems.

While they might still be seperate products, I think they all go through
the same testing these days - maybe with different hosts/configs.

Testing SCSI disks and SCSI RAID arrays in a multi-initiator
configuration exposes problems workstation/PC users rarely, if ever, see.

> But since HP-UX 10.20 by the latest, probably earlier too, some people 
> have been using whatever disks they get as long as the SCSI interfaces 
> are compatible. I've never heard of problems. 

Well, "works for me" is good enough for most linux users.
It's not when one is involved with any kind of support contract.

hth,
grant
