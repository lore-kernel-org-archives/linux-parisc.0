Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0A84482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 May 2001 10:31:28 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 1558sZ-0006jy-00; Wed, 30 May 2001 17:31:27 +0100
Date: Wed, 30 May 2001 17:31:27 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: "CARSON,KEVIN (HP-Canada,ex1)" <kevin_carson@hp.com>
Cc: 'Grant Grundler' <grundler@puffin.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: List of packages for hppa ISO release vers ion 2
Message-ID: <20010530173127.C7349@parcelfarce.linux.theplanet.co.uk>
References: <B9957F974955D411829400D0B74FF27A04BF77A5@xtor01.canada.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <B9957F974955D411829400D0B74FF27A04BF77A5@xtor01.canada.hp.com>; from kevin_carson@hp.com on Wed, May 30, 2001 at 12:00:36PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 30, 2001 at 12:00:36PM -0400, CARSON,KEVIN (HP-Canada,ex1) wrote:
> Howabout having the master archive in another country (like France) and all
> sites in the US being mirrors of the site?  Import of cryptology into the US
> is legal.  Debian has this structure as there are mirrors of non-US in the
> US and Canada.

The price of bandwidth is an important factor.  ftp-master takes in 300MB
over the course of a day and then pulses that 300MB to 6 other servers
once a day.  This option has been discussed before; if you think you have
a solution, I'm sure there's an appropriate debian mailing list for it
(not sure which one though).

-- 
Revolutions do not require corporate support.
