Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 694404868
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 06:34:06 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17L18X-0008N5-00; Thu, 20 Jun 2002 13:34:05 +0100
Date: Thu, 20 Jun 2002 13:34:05 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Cc: 'Ralf Hildebrandt' <Ralf.Hildebrandt@charite.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] was: mail-man; should be hyper-mail
Message-ID: <20020620133405.T9435@parcelfarce.linux.theplanet.co.uk>
References: <03273D4BC7F4D511AC440008C7E6F881542343@nlntmail2b.ats.nld.alcatel.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <03273D4BC7F4D511AC440008C7E6F881542343@nlntmail2b.ats.nld.alcatel.nl>; from Hans.Witvliet@Alcatel.nl on Thu, Jun 20, 2002 at 02:26:31PM +0200
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

On Thu, Jun 20, 2002 at 02:26:31PM +0200, Witvliet, Hans wrote:
> next he types: make, and gets:
> building libtool
> checking host system type .... invalid configuragtion:
> ''parisc-unknown-linux-gnu': machine 'parisc-unknown' not recognized.
> ..

looks like out of date config.{sub,guess}.  as has been said elsewhere,
the debian packages have been updated with these things, but maybe
upstream hasn't.

-- 
Revolutions do not require corporate support.
