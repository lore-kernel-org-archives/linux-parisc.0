Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id CDD954829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Feb 2003 03:20:16 -0700 (MST)
Date: Mon, 3 Feb 2003 12:19:59 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: "Aaron St. Pierre" <asp@ungod.com>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel compile
Message-ID: <20030203101959.GA28668@marmite.its.uct.ac.za>
References: <20030203020247.GB1046@hadron> <20030203041122.GB29454@dsl2.external.hp.com> <20030203053336.GC1046@hadron> <20030203060359.GF29454@dsl2.external.hp.com> <20030203064328.GD1046@hadron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030203064328.GD1046@hadron>
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

On Mon, Feb 03, 2003 at 01:43:28AM -0500, Aaron St. Pierre wrote:
[snip]
> As far as the palo message, i only started noticing it when I went to
> v1.2 of palo. One thing I should note, when I set up / i made it ext3,
> boot is off of / and not its own fs so when i realized what i did I
[snip]

Your boot partition (/) is < 2GB, right?

-- 
Michael Wood <mwood@its.uct.ac.za>
