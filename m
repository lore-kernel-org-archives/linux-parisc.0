Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: taggart@carmen.fc.hp.com, richard@nairnconsulting.ca,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 735/125 Wide Diff scsi 
In-Reply-To: Message from "John David Anglin" <dave@hiauly1.hia.nrc.ca>
   of "Thu, 24 Oct 2002 18:34:38 EDT." <200210242234.g9OMYdrf027093@hiauly1.hia.nrc.ca>
References: <200210242234.g9OMYdrf027093@hiauly1.hia.nrc.ca> 
Date: Thu, 24 Oct 2002 18:44:28 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021025004428.1E5454834@dsl2.external.hp.com>
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

"John David Anglin" wrote:
> That's not correct.  Seagate WD drives must be installed on the wide
> high-voltage differential bus.  They will not work on a SE bus (even
> a wide one).  You also need a WD bus terminator.  They are different
> from wide SE terminators.

Dave has it right.

HP did sell *narrow* HVD devices for workstations but it's rare
and IIRC only available as EISA add-on cards.

grant
