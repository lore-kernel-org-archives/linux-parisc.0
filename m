Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A70D4935
	for <parisc-linux@parisc-linux.org>; Thu,  9 Oct 2003 12:24:43 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A7fSs-00063j-C1; Thu, 09 Oct 2003 19:24:42 +0100
Date: Thu, 9 Oct 2003 19:24:42 +0100
From: Matthew Wilcox <willy@debian.org>
To: Max <max@avtlg.ru>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] HP-PB 100 Base TX Support ?
Message-ID: <20031009182442.GM27861@parcelfarce.linux.theplanet.co.uk>
References: <22393145.20031009222113@avtlg.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <22393145.20031009222113@avtlg.ru>
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

On Thu, Oct 09, 2003 at 10:21:13PM +0400, Max wrote:
> Is HP-PB 100 Base TX network card supported by  2.4.19-pa24
> (PDC_CONSOLE)?

Almost certainly not.  If I remember correctly, this uses a custom
Interphase chip we don't have documentation for.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
