Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BF69482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 20:02:37 -0700 (MST)
To: =?iso-8859-1?Q?Bj=F6rn_Bylander?= <bjorn.bylander@telia.com>
Cc: parisc-linux@lists.parisc-linux.org, taggart@carmen.fc.hp.com
Subject: Re: [parisc-linux] Booting to ISL with Linux installed 
In-Reply-To: Your message of "Mon, 21 Jan 2002 00:05:06 +0100."
             <DLEJJFGDAJICFFBHFNCDGEBBCEAA.bjorn.bylander@telia.com>
References: <DLEJJFGDAJICFFBHFNCDGEBBCEAA.bjorn.bylander@telia.com> 
Date: Sun, 20 Jan 2002 20:02:35 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020121030235.C37E737D2B@carmen.fc.hp.com>
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

=?iso-8859-1?Q?Bj=F6rn_Bylander?= writes...

> If not, is there any way I can get the "uxbootlf" image without buying a =
> license for the appropriate HPUX version?

There is a uxbootlf in cvs for this purpose. It's in the build-tools
directory, or you can grab it via viewcvs at,

http://cvs.parisc-linux.org/~checkout~/build-tools/uxbootlf

BTW- I recently converted a couple 712s with serial console *back* to
graphics console since the sti-fb stuff is working so well now.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
