Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26A404834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Jun 2002 06:56:43 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17NYp5-0000wJ-00; Thu, 27 Jun 2002 13:56:31 +0100
Date: Thu, 27 Jun 2002 13:56:31 +0100
From: Matthew Wilcox <willy@debian.org>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Cc: Matthew Wilcox <willy@debian.org>, joel.soete@freebel.net,
	Matt Taggart <taggart@carmen.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 24bit colour
Message-ID: <20020627135631.A2955@parcelfarce.linux.theplanet.co.uk>
References: <5.1.0.14.0.20020610084610.026cfc70@10.106.16.2> <20020610203815.8349B380D5@carmen.fc.hp.com> <1024391159.3d0ef7f7c3903@webmail.tiscalinet.be> <20020618121104.E9435@parcelfarce.linux.theplanet.co.uk> <1025099026.3d19c51207773@webmail.tiscalinet.be> <20020626144536.B28662@parcelfarce.linux.theplanet.co.uk> <3D1A1BFF.7080000@charter.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D1A1BFF.7080000@charter.net>; from bdhilton@charter.net on Wed, Jun 26, 2002 at 03:54:39PM -0400
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

On Wed, Jun 26, 2002 at 03:54:39PM -0400, B. Douglas Hilton wrote:
> The "Color Recovery" code supposedly dithers the colors in some
> special way down to 8bpp and then the hardware somehow restores
> them, right?

As far as I can tell from reading the documentation on the web,
it's simply a programmable palette.  This doesn't seem terribly
interesting/hard, so I assume there must be more to it than that.

-- 
Revolutions do not require corporate support.
