Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 813C1482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 17:27:42 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Matthew Wilcox <willy@debian.org>,
	=?iso-8859-1?q?R=FCdiger=20Scholz?= <r.scholz@bluehash.de>
Subject: Re: [parisc-linux] Some 2.5-testing
Date: Fri, 20 Jun 2003 01:28:12 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <200306171622.h5HGM5QJ010581@hiauly1.hia.nrc.ca> <3EF205C9.9010600@bluehash.de> <20030619195628.GH24357@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030619195628.GH24357@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <200306200127.26572.deller@gmx.de>
Content-Type: text/plain;
  charset="iso-8859-1"
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

On Thursday 19 June 2003 21:56, Matthew Wilcox wrote:
> Anyway, the fault seems to be in the HIL drivers -- someone said Helge
> was looking at this?  If you disable the HIL drivers, does it work?

The new HIL drivers are broken and will crash the machine at some point.
Using the old HIL drivers instead, or deactivating HIL completely should work for now, 
until I really get more time to look into the problem (which isn't easy to fix at all).

Helge
