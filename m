From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [parisc-linux] HP B132L hangs
Date: 10 Sep 2003 11:45:09 -0400
Message-ID: <1063208722.1984.10.camel__38546.3490536951$1416622766$gmane$org@mulgrave>
References: <3F5F24D9.7030800@epost.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: debian-hppa@lists.debian.org, parisc-linux@parisc-linux.org
To: Sebastian Brueckner <sebastian.brueckner@epost.de>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3F5F24D9.7030800@epost.de>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, 2003-09-10 at 09:19, Sebastian Brueckner wrote:
> scsi0: (2:0) Synchronous at offset 8, period 100ns
> scsi0: (2:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
>           len = 6, cmd =Read (10) 00 00 35 e2 00 00 00 18 00

That's a residue of an incorrect lasi700 driver.  Notice it thinks the
length is six for a ten byte command.  This has long been fixed in the
linux-2.4 PA tree (er, I think---I've been concentrating on 2.6 mainly).

However, something higher up in the trace you don't attach caused the
actual problem that this is a response to (It's caused by the SCSI mid
layer putting the wrong command length back *after* error recovery, so
your true root cause is the error that first started this).

James
