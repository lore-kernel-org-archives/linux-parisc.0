Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34BCA4868
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Jan 2004 21:22:30 -0700 (MST)
Date: Wed, 7 Jan 2004 23:14:06 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] scsi problem on a scorpio (715)
Message-ID: <20040108041405.GA2347@systemhalted>
References: <3FFC9A15.6FA66B2@tiscalinet.it>
	<Pine.LNX.4.58.0401072226130.5327@brain.fop.ns.ca>
	<20040108025218.GA20732@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040108025218.GA20732@colo.lackof.org>
Cc: Riccardo <rollei@tiscalinet.it>,
	parisc linux <parisc-linux@lists.parisc-linux.org>,
	Steve Bromwich <hppa@fop.ns.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> On Wed, Jan 07, 2004 at 10:30:30PM -0400, Steve Bromwich wrote:
> Unless performance is more important than strict correctness, I still
> reccommend tag queue depth of 8 and disable "Write Cache" setting.
> Reducing queue depth further typically only limits performance.

My entire cluster was made up of scorpio boxes 715/50's, and I *never*
had them run stably with anything but a tag queue depth of 1.

Grant, I'm pretty sure me and you had this exact conversation like 2
years ago :)

c.
