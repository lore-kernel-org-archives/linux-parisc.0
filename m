Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2CC80484D
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Mar 2003 09:27:43 -0700 (MST)
Date: Mon, 3 Mar 2003 08:24:40 -0800
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Message-ID: <20030303162440.GF11363@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <3E5F8012000005AB@ocpmta8.freegates.net> <200303031617.h23GHf1R027417@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200303031617.h23GHf1R027417@hiauly1.hia.nrc.ca>
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

[Note: trimmed cc list]

> Last time I tried (couple of weeks ago), it was possible to build
> a 64-bit cross starting with 3.3.  This still doesn't work with 3.2.

also 64-bit hppa64-linux gcc-3.2 (built with 3.3) ICEs regularly. For
people using this to build kernels, I would suggest staying with 3.0.4
for now.

(I'm also seeing reproducible crashes when running hppa64-linux-ld now,
still need to track that down)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
