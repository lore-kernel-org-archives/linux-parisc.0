From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] HP B132L hangs
Date: Thu, 11 Sep 2003 13:17:26 -0600
Message-ID: <20030911191726.GA7526__2246.40774908966$1416622768$gmane$org@dsl2.external.hp.com>
References: <3F5F24D9.7030800@epost.de> <1063208722.1984.10.camel@mulgrave> <3F5F71C8.7060605@epost.de> <20030910185834.GC21596@parcelfarce.linux.theplanet.co.uk> <3F608EDB.101@epost.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-hppa@lists.debian.org, parisc-linux@parisc-linux.org
To: Sebastian Br?ckner <sebastian.brueckner@epost.de>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3F608EDB.101@epost.de>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, Sep 11, 2003 at 05:03:55PM +0200, Sebastian Br?ckner wrote:
> I tried to backup the system and got the a similar error with very few 
> messages mixed into it. Maybe this is better readable:

yes, much better

> scsi0: ERROR on channel 0, id 2, lun 0, CDB: Request Sense 00 00 00 40 00
> Info fld=0x39a27b, Current sd08:04: sense key Medium Error
> Additional sense indicates Unrecovered read error

This is the disk telling the driver it had a real failure.

...
> scsi0: (2:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
>          len = 6, cmd =Read (10) 00 00 39 a5 e8 00 00 a0 00

this output is the bug james mentioned was fixed in a later kernel.

grant
