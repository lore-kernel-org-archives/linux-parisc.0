Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6310D4841
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Nov 2003 21:32:15 -0700 (MST)
Date: Sat, 15 Nov 2003 21:32:13 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: "Shane G. Brodie" <sgbrodie@mts.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dual NICs on 9000/715, anyone?
Message-ID: <20031116043213.GC4059@colo.lackof.org>
References: <20031116015159.GA4059@colo.lackof.org> <LPENLKGPOOFMNIPKLBNDAEFECAAA.sgbrodie@mts.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <LPENLKGPOOFMNIPKLBNDAEFECAAA.sgbrodie@mts.net>
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

On Sat, Nov 15, 2003 at 10:16:11PM -0600, Shane G. Brodie wrote:
> Slightly off topic:  I've been fighting with a 715/80 with an EISA 10/100 VG
> AnyLan card in it for the last 2 weeks.  I can not get the network to come
> up.

If it's trying to use DMA, it won't work.

> I have a whole series of issues to resolve unrelated to the network
> hardware, but that's another long story ... (the old SCSI CD-ROM doesn't
> like CD-RW ... don't have spare CD-R ... disc 2 of my downloaded set is
> unreadable - how I wish the MD5 checksums were up-to-date ...  I could set

can you clarify which MD5 csums are stale?
Post the URL on this list and likely someone can fix it.

> up dial-up (eeek!) but ...
> 
> I don't have have an EtherTwist transceiver for the built-in (and don't know
> if it'll work anyway) - can anyone advise me whether or not the the built-in
> 10-Base-2 Ethernet NIC will work using a AUI-10MB Ethernet transceiver
> connected to a Linksys DSL 10/100 router?

The 715 built-in (LASI "apricot", uses lasi_82596 driver) works fine.
I wouldn't expect any compatibility problems with Linksys router.

grant
