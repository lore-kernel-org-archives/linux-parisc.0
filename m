Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id A22CB482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Dec 2001 03:56:17 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 0B129B00C; Wed, 19 Dec 2001 10:55:09 +0000 (GMT)
Date: Wed, 19 Dec 2001 10:55:09 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "Bryan W. Headley" <bheadley@interaccess.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [Fwd: Re: 735 and SCSI (was: Re: [parisc-linux] Firmware upgraded, STI console problem)]
Message-ID: <20011219105508.V1897@linuxcare.com>
References: <3C1E108A.40706@interaccess.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C1E108A.40706@interaccess.com>; from bheadley@interaccess.com on Mon, Dec 17, 2001 at 09:34:34AM -0600
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

On Mon, Dec 17, 2001 at 09:34:34AM -0600, Bryan W. Headley wrote:
> Since my C110 has a fast/wide, and so does my 735, I'm in the bad spot 
> of never really having either machine fully boot up. The CDROM drive I 
> have doesn't "like" RW discs, so I'd love to see someone stamp out a 
> Woody-ish master that I can read from.

FWD disks on 53c720 on C110 should work these days.  Either use a recent
kernel, or use the workaround in the 0.9.3 ISO errata.  They wont work on
the 735 because the processor on that box doesn't support consistent
memory (pci_alloc_consistent() fails).

My parisc boxes don't like CD-RW disks either, but are quite happy with
CD-R disks I burn myself.

Richard
