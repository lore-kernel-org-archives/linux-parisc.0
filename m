Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 376824837
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Feb 2002 10:11:39 -0700 (MST)
Message-Id: <200202121711.g1CHBT7m025011@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] $$divU undefined reference
To: Arnaud.ATOCH@oecd.org
Date: Tue, 12 Feb 2002 12:11:29 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <C12531D038D1D011B1DB0000F8036C280BBA4748@eosm5.oecd.org> from "Arnaud.ATOCH@oecd.org" at Feb 12, 2002 06:05:13 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> By the way python arithmic tests do not pass but id does not seems to pose
> any problems yet.

There are known issues with the tools when passing floats in indirect and
varargs calls.  This can bit in a simple printf call.  This might be why
the python arithmetic tests do not pass.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
