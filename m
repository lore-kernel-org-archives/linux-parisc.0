From: Alan Modra <amodra@bigpond.net.au>
Subject: Re: [parisc-linux] binutils 2.15?
Date: Mon, 14 Jun 2004 21:38:20 +0930
Message-ID: <20040614120820.GG28716__39080.105131916$1416624454$gmane$org@bubble.modra.org>
References: <40BDA020000074B9@ocpmta3.freegates.net>
	<200406140409.i5E49HYi003897@hiauly1.hia.nrc.ca>
	<20040614032519.GS5191@sunsite.ms.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: binutils@sources.redhat.com,
 parisc-linux@parisc-linux.org
To: Jakub Jelinek <jakub@redhat.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040614032519.GS5191@sunsite.ms.mff.cuni.cz>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 14, 2004 at 05:25:20AM +0200, Jakub Jelinek wrote:
> First of all, can you explain why hppa needs .got after .plt?

There's a lazy linking stub inserted at the end of the .plt section that
loads the .got address by

  b,l	1b,%r20
  depi	0,31,2,%r20

ie. it depends on .got immediately following these instructions.

-- 
Alan Modra
IBM OzLabs - Linux Technology Centre
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
