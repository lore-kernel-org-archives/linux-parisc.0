Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 9 Jul 2003 09:54:51 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	"Martin K. Petersen" <mkp@mkp.net>, Dub <dub@latnet.lv>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Corrections for RAID1 howto and Resyncing after failure
Message-ID: <20030709155451.GB32476@dsl2.external.hp.com>
References: <yq1llv8dbin.fsf@wilson.mkp.net> <3F057186000008F4@ocpmta8.freegates.net> <20030709122700.GR1939@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030709122700.GR1939@parcelfarce.linux.theplanet.co.uk>
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

On Wed, Jul 09, 2003 at 01:27:00PM +0100, Matthew Wilcox wrote:
> Well, no, you're always going to have to quiesce the device.

Not unless the disk is part of RAID[135] set.
I expect to be able to yank a disk and replace with a new one any time.

grant
