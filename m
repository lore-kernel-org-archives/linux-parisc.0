Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust7.leed.broadband.ntl.com [80.7.68.7])
	by dsl2.external.hp.com (Postfix) with ESMTP id E825D4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 01:43:05 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17kJxH-0000Ks-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 08:43:03 +0100
Date: Thu, 29 Aug 2002 08:43:03 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Harmony on 710 working?
Message-ID: <20020829074303.GB1029@tykepenguin.com>
References: <3D6CDF5A.5090205@gmx.de> <Pine.LNX.4.33.0208282215040.28537-100000@marvin.forty.two>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <Pine.LNX.4.33.0208282215040.28537-100000@marvin.forty.two>
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

On Wed, Aug 28, 2002 at 10:20:15PM +0200, Juergen Braukmann wrote:
> 
> Hi Christian,
> at least I got the Harmony driver working on my c110. I used the Kernel
> driver first, but found out that kmixer wasn't working (obviously expected
> alsa)

A great many Linux sound programs seem to assume that the machine is
little-endian and don't work on HP IME. mpg321 seems OK to me as is sox but
anything more serious (particularly on the recording side) tends to have
problems.

Maybe I should file some bugs in the Debian BTS.
-- 

patrick
