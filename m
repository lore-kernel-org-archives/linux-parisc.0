Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87FEC4875
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Aug 2003 13:48:43 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h7PJmfI13464;
	Mon, 25 Aug 2003 15:48:41 -0400
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20030825191915.GA377@dsl2.external.hp.com>
References: <3F2E2C7700004E38@ocpmta2.freegates.net>
	<20030825164553.GB28778@dsl2.external.hp.com>
	<1061830247.2044.165.camel@mulgrave>
	<20030825191915.GA377@dsl2.external.hp.com>
Content-Type: text/plain
Date: 25 Aug 2003 14:48:40 -0500
Message-Id: <1061840921.2044.368.camel@mulgrave>
Mime-Version: 1.0
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

On Mon, 2003-08-25 at 14:19, Grant Grundler wrote:
> That's not technically possible.
> PARISC firmware uses the HPA to reference specific devices (including CPU).
> 
> We can use the same CPU number as PAT PDC and call them "physical".
> But systems which don't have PAT PDC can only use arbitrary numbers
> assigned by the parisc-linux startup code. Maybe there is a way to
> make the numbers match PIM info output but I'm not sure how.

Realistically, "logical" just means we make up a numbering scheme
independent of what the HW tells us.  If the HW isn't telling us
anything, then us telling the HW is fine.

The gist of the "no more logical mappings edict" is that basically we
only have one source for CPU numbers (and it can be sparse) rather than
two, one of which was usually compact.

James
