Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo3.tiscali.be [62.235.13.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id E6DFD4843
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  7 Mar 2004 05:04:03 -0700 (MST)
Message-ID: <404B0FF7.4080405@tiscali.be>
Date: Sun, 07 Mar 2004 12:05:11 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Sleepy, EWOULDBLOCK != EAGAIN?
References: <20040307072733.GL963@baldric.uwo.ca>
In-Reply-To: <20040307072733.GL963@baldric.uwo.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Carlos O'Donell wrote:
> pa,
> 
> Please remind me why we don't make EWOULDBLOCK == EAGAIN?
There was a thread (dated Sept 200) starting here:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/017575.html>
and a followup (dated Oct 2002) starting here:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2002-October/018052.html>

> I know it would break our existing ABI, but Linux apps expect them to be
> the same. I remember vaguely some argument about hpux compatibility...
> I'm sleepy, but I thought I'd post so I don't forget.
> 
> I'm reminded of this because update-menus is complaining about locks
> during a recent 712/100 install, and it all came flooding back.
> 
> c.
> 
hth,
	Joel
