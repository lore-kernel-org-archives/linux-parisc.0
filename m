Return-Path: <wichert@levante.wiggy.net>
Received: from mx1.wiggy.net (levante.wiggy.net [195.85.225.139])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4ED0D4857
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  3 Mar 2004 03:26:57 -0700 (MST)
Received: from wichert by mx1.wiggy.net with local (Exim 4.30)
	id 1AyTaa-0000oY-IM
	for parisc-linux@lists.parisc-linux.org; Wed, 03 Mar 2004 11:26:56 +0100
Date: Wed, 3 Mar 2004 11:26:56 +0100
From: Wichert Akkerman <wichert@wiggy.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040303102656.GD28450@wiggy.net>
References: <20040302100622.GL2502@wiggy.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040302100622.GL2502@wiggy.net>
Sender: Wichert Akkerman <wichert@levante.wiggy.net>
Subject: [parisc-linux] Re: another kernel oops
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Something that might affect my machine is that I am running ext3 on
top of md+raid1. I'm used to that being rock solid on i386, but it
might be a culprit on hppa.

Wichert.

-- 
Wichert Akkerman <wichert@wiggy.net>    It is simple to make things.
http://www.wiggy.net/                   It is hard to make things simple.
