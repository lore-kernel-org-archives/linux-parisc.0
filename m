From: Jakub Jelinek <jakub@redhat.com>
Subject: Re: [parisc-linux] binutils 2.15?
Date: Mon, 14 Jun 2004 05:25:20 +0200
Message-ID: <20040614032519.GS5191__7507.91328396208$1416624453$gmane$org@sunsite.ms.mff.cuni.cz>
References: <40BDA020000074B9@ocpmta3.freegates.net>
	<200406140409.i5E49HYi003897@hiauly1.hia.nrc.ca>
Reply-To: Jakub Jelinek <jakub@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: binutils@sources.redhat.com,
 parisc-linux@parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200406140409.i5E49HYi003897@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 14, 2004 at 12:09:16AM -0400, John David Anglin wrote:
> > I read that now many arch try to update their toolchain to a new release;
> > I so try to rebuild toolchain starting from binutils-2.15 (.0.91... from
> > ftp.kernel.org)
> > it build well but when I launch to rebuild gcc with those new binutil configure
> > crashes immediately with:
> > "/usr/bin/ld: .got section not immediately after .plt section"
> 
> The following change appears to have introduced this problem:

First of all, can you explain why hppa needs .got after .plt?

	Jakub
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
