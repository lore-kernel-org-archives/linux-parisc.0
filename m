Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 848FA48A3
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  5 Jan 2004 06:12:30 -0700 (MST)
Date: Mon, 5 Jan 2004 05:14:51 -0800
From: Randolph Chung <randolph@tausq.org>
To: Michel Weynants <mweynants@wanadoo.be>
Subject: Re: [parisc-linux] Sun JVM on linux HPPA
Message-ID: <20040105131451.GN533@tausq.org>
References: <1073308114.2718.7.camel@dev3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1073308114.2718.7.camel@dev3>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> However, I wonder if a Java virtual machine has been ported for that
> environment. I checked several sites but did not found any info,
> sentence, reference,... of a JSDK1.4 for linux on HPPA (well, thousands
> references for JSDK on linux on intel).
> 
> Do you know if such version exist and where it could be found?

The Sun JDK is not open-source so we cannot port it to hppa-linux. There
are several efforts under way to get other JVMs to work on hppa. SableVM
is close to working. kaffe can probably also be made to work with some
effort.

Search the mail archives for more info; this has been asked several
times in the past.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
