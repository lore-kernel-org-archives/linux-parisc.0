Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68782482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 11:26:19 -0600 (MDT)
Date: Wed, 29 May 2002 13:26:31 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Cc: patrick@tykepenguin.com
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020529132631.B3691@systemhalted>
References: <20020527001321.A6629@systemhalted> <20020528142736.GA9288@tykepenguin.com> <20020528132933.B31214@systemhalted> <20020529075131.GC9919@tykepenguin.com> <20020529082107.A2794@systemhalted> <20020529141231.GG9919@tykepenguin.com> <20020529110118.A3691@systemhalted> <20020529162438.GJ9919@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020529162438.GJ9919@tykepenguin.com>; from patrick@tykepenguin.com on Wed, May 29, 2002 at 05:24:38PM +0100
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

> 
> Oh, I'm doing that. I just tried it again, it was either that or throw it out
> of the window.
> 
> Is there parisc version of the kdb patch I could try applying to a kernel
> source I know works maybe ?
>

We are trying not to maintian patches but rather a branch of the
kernel representing common-2 + parisc specific kdb changes.

Look at this if you want to see the patch method:
http://lists.parisc-linux.org/pipermail/parisc-linux/2002-May/016246.html

The kdb_v21 branch is where all the changes and fixes will go :)

c. 
