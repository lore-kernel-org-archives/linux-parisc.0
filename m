Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from winfree.gag.com (winfree.gag.com [192.133.104.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 764444829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Aug 2002 14:43:50 -0600 (MDT)
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by winfree.gag.com (Postfix) with ESMTP id 7479FC190
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Aug 2002 14:43:49 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
References: <20020823091741.A15239@taurus.nairnconsulting.ca>
	<Pine.LNX.4.21.0208262154180.9376-100000@hal.pp.fishpool.fi>
From: Bdale Garbee <bdale@gag.com>
Date: 26 Aug 2002 14:43:49 -0600
In-Reply-To: <Pine.LNX.4.21.0208262154180.9376-100000@hal.pp.fishpool.fi>
Message-ID: <87wuqde4fu.fsf@rover.gag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Re: kernel-source-2.4.19  ... no -hppa this time?
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

q-funk@pp.fishpool.fi (Martin-=C9ric Racine) writes:

> I noticed that kernel-source-2.4.19 made its ways into the Sarge/testing=
=20
> tree, but I see no specific package for hppa, this time.=20=20

bdale@auric:~$ madison kernel-source-2.4.19-hppa
kernel-source-2.4.19-hppa |        4.1 |      unstable | all

The kernel-source-2.4.19-hppa binary package is derived from the source
package kernel-image-2.4.19-hppa, which was just accepted into sid (unstabl=
e).
It will take some time for that to be promoted into testing...

Bdale
