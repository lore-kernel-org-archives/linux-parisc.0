Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 24 Aug 2003 21:55:24 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Added a new SCSI disk, hda became hdb
Message-ID: <20030825035524.GB10969@dsl2.external.hp.com>
References: <20030824191340.GG5304@charite.de> <20030824203857.GD17595@systemhalted> <20030824214212.GB18834@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030824214212.GB18834@parcelfarce.linux.theplanet.co.uk>
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

On Sun, Aug 24, 2003 at 10:42:12PM +0100, Matthew Wilcox wrote:
> This is because HPUX uses the ANSI-approved scan order -- 7,6,5,...,0

Not true. HPUX scans the SCSI bus from 0-7 for narrow or 0-15 for wide.

Under HPUX, SCSI controllers are assigned instance numbers and the
kernel records those in /stand/ioconfig. The SCSI controller will
get the same instance number after reboot regardless of other IO
devices changing.

grant
