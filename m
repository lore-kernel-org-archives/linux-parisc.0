Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Disk problems 
In-Reply-To: Message from jsoe0708@tiscali.be
   of "Mon, 25 Nov 2002 18:46:30 +0100." <3DA3C88900004E87@ocpmta3.be.tiscali.com>
References: <3DA3C88900004E87@ocpmta3.be.tiscali.com> 
Date: Mon, 25 Nov 2002 11:02:08 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021125180208.681AC482A@dsl2.external.hp.com>
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

jsoe0708@tiscali.be wrote:
> [I encounter a strange problem which I do not yet fix:
> I used a data disk which crashed and replaced by HP but new FW release. When
> I put it back in my scsi chain, I was unable to use: a lot of scsi reset.
> OTC when I chek it on a hpux box no problem as well if I connect it alone
> to my hppalinux box ?]

upgrading firmware should never result in lots of scsi resets.
Sounds more like a problem with the HW configuration.
Check SCSI IDs, cable lengths, and termination.

grant
