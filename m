Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B63C482A
	for <parisc-linux@parisc-linux.org>; Sat,  2 Feb 2002 07:01:52 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16X0jj-0007e4-00; Sat, 02 Feb 2002 14:01:47 +0000
Date: Sat, 2 Feb 2002 14:01:47 +0000
From: Matthew Wilcox <willy@debian.org>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Rsync...
Message-ID: <20020202140147.C26868@parcelfarce.linux.theplanet.co.uk>
References: <20020202120256.U27172@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020202120256.U27172@lug-owl.de>; from jbglaw@lug-owl.de on Sat, Feb 02, 2002 at 12:02:56PM +0100
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

On Sat, Feb 02, 2002 at 12:02:56PM +0100, Jan-Benedict Glaw wrote:
> Hi!
> 
> For some time, there was rsync access to a checked-out version
> of current CVS. This is gone recently, and I don't know why.
> I'd really love to again use rsync for fetching sources
> (and as you know, I'd also like to rsync the CVS repository
> itself).
> 
> Any chances?

you may have noticed a certain amont of security-related kerfuffle around
rsync recently.  until this is fixed and the data-corruption bugs are fixed,
rsync has been disabled on {ftp,www,cvs}.parisc-linux.org.  sorry.

-- 
Revolutions do not require corporate support.
