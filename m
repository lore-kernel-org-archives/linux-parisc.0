Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82FA24843
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Jan 2004 10:05:35 -0700 (MST)
Date: Wed, 28 Jan 2004 10:15:11 -0800
From: Randolph Chung <tausq@debian.org>
To: Heikki Hannikainen <hessu@hes.iki.fi>
Subject: Re: [parisc-linux] K380 partial success, the state of the port?
Message-ID: <20040128181511.GD959@tausq.org>
References: <Pine.LNX.4.58.0401281500300.14924@jazz.he.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0401281500300.14924@jazz.he.fi>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <tausq@debian.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

>   Is the parisc port supposed to be this slow at it's current state, or is
> this a problem which is specific to my setup?

fork/exec is very slow on parisc right now. in other areas though
performance is not too shabby. Ryan posted lmbench results to the list
recently. Check the archive for details.

> - Should I go to the 2.6 tree? I compiled it from the CVS (to get the
> tulip driver working) but the SCSI failed:

Yes, you should go to 2.6, but as Joel pointed out SMP is not yet
working correctly.

We have a few scsi gurus on the parisc list so they can address the scsi
issues :)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
