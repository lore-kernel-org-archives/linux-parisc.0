Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cs1-hq.oecd.org (cs1-hq.oecd.org [193.51.65.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10A88483F
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Feb 2002 10:05:14 -0700 (MST)
Received: from netsweep1.oecd.org (netsweep1.oecd.org [10.102.5.110])
	by cs1-hq.oecd.org (Postfix) with ESMTP id C9D5C4B081
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Feb 2002 18:05:09 +0100 (CET)
Received: from eosgty1.oecd.org (unverified) by netsweep1.oecd.org
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T5907edc7180a66056e083@netsweep1.oecd.org> for <parisc-linux@lists.parisc-linux.org>;
 Tue, 12 Feb 2002 18:05:12 +0100
Message-ID: <C12531D038D1D011B1DB0000F8036C280BBA4748@eosm5.oecd.org>
From: Arnaud.ATOCH@oecd.org
To: 
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] $$divU undefined reference
Date: Tue, 12 Feb 2002 18:05:13 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> Don't use `ld' to link shared objects.  Link using gcc (if it's c code) or
> g++ (if c++ code).  the compiler driver knows what extra libs to link in.

Thanks for your help.

By the way python arithmic tests do not pass but id does not seems to pose
any problems yet.

Arnaud Atoch
OECD / OCDE
Paris
France
