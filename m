Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6836148C0
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 10 Apr 2004 13:12:11 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3AJC9a05641; Sat, 10 Apr 2004 15:12:09 -0400
Subject: Re: [parisc-linux] Proposal for altering our Page Table layouts
From: James Bottomley <James.Bottomley@steeleye.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
In-Reply-To: <20040410184946.GB7123@baldric.uwo.ca>
References: <1081513015.1759.5.camel@mulgrave>
	<20040410184946.GB7123@baldric.uwo.ca>
Content-Type: text/plain
Date: 10 Apr 2004 15:12:09 -0400
Message-Id: <1081624329.1841.6.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, 2004-04-10 at 14:49, Carlos O'Donell wrote:
> I've already started porting glibc, I'm convincing autoconf to traverse
> the right system dependency directories. Hasn't been too painful yet,
> I'm still writing the 64-bit dl-machine to handle the relocations
> though. I have it building an ld64.so.1 but it doesn't work yet :)

I didn't name names ;-)

But thanks for the effort.

James
