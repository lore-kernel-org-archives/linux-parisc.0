Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from blimpo.internal.net (ppp01.ts1-1.NewportNews.visi.net [209.8.196.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B8BE482A
	for <parisc-linux@parisc-linux.org>; Tue, 23 Oct 2001 00:10:52 -0600 (MDT)
Date: Tue, 23 Oct 2001 01:41:19 -0400
From: Ben Collins <bcollins@debian.org>
To: "Christopher C. Chimelis" <chris@debian.org>
Cc: Randolph Chung <tausq@debian.org>, amodra@bigpond.net.au,
	parisc-linux@parisc-linux.org
Message-ID: <20011023014119.I10952@visi.net>
References: <20011022221714.O537@tausq.org> <Pine.LNX.4.21.0110230118590.16337-100000@spawn.hockeyfiend.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0110230118590.16337-100000@spawn.hockeyfiend.com>
Sender: Ben Collins <bmc@visi.net>
Subject: [parisc-linux] Re: Yay, binutils fixed for hppa
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Oct 23, 2001 at 01:20:00AM -0400, Christopher C. Chimelis wrote:
> 
> On Mon, 22 Oct 2001, Randolph Chung wrote:
> 
> > With many thanks to Alan Modra binutils seems to be fixed now. Chris,
> > can you please build a new binutils from cvs? Everything should be there, and
> > the hppa-specific patch you currently have in the package should no longer 
> > be needed.
> 
> Ok, I'll include those in the next upload (based on HJ's release from
> today and including the patches that Alan just committed).
> 
> > The patch Ben has is needed to build glibc with the new binutils.
> 
> Fantastic :-)
> 
> > hppa is also a bit behind on gcc-3.0. I'll try to build new ones RSN.
> 
> This is good news :-)  Many thanks to Alan for working on this so quickly
> :-)

Great work guys!

-- 
 .----------=======-=-======-=========-----------=====------------=-=-----.
/                   Ben Collins    --    Debian GNU/Linux                  \
`  bcollins@debian.org  --  bcollins@openldap.org  --  bcollins@linux.com  '
 `---=========------=======-------------=-=-----=-===-======-------=--=---'
