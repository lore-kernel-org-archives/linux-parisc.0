Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id D98974843
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 18 Feb 2004 23:29:08 -0700 (MST)
Date: Wed, 18 Feb 2004 23:29:07 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] Hanging with kernels >= 2.4.22
Message-ID: <20040219062907.GC13916@colo.lackof.org>
References: <20040218235225.GA1623@calypso>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040218235225.GA1623@calypso>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Feb 18, 2004 at 11:52:25PM +0000, Stuart Brady wrote:
> I'm having problems with kernels >= 2.4.22 on a 715/100.

[ delete descriptions of hang symptoms ]

Stuart,
All your symptoms point at disk IO hanging.
Setting the default queue depth to 1 would be worth trying.
I've forgotten the details for setting queue depth.
 
search parisc-linux mailing list archives "scsi queue tags".
http://lists.parisc-linux.org/pipermail/parisc-linux/2004-January/022087.html

btw, 715/50 is NOT the same as 715/100.
715/100 should have "coherent" DMA and 715/50 does not.

Maybe a FAQ entry for "715/xxx hangs" could be your first contribution?

hth,
grant
