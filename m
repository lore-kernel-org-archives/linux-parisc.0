Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BEF544834
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Mar 2003 07:09:09 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.12)
	id 18tprc-0006BR-00; Fri, 14 Mar 2003 14:08:48 +0000
Date: Fri, 14 Mar 2003 14:08:48 +0000
From: Matthew Wilcox <willy@debian.org>
To: Lyonel Vincent <vincentl@ec-lyon.fr>
Cc: Matthew Wilcox <willy@debian.org>, bruno_vidal@hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] enumerating devices from user space
Message-ID: <20030314140848.GI29631@parcelfarce.linux.theplanet.co.uk>
References: <20030313112232.A10172@typhon.pilat.fr> <3E706BE4.E53961BD@hp.com> <20030313134558.6cf9177c.vincentl@ec-lyon.fr> <3E7196C7.8A35605F@hp.com> <20030314133305.4311a8e6.vincentl@ec-lyon.fr> <20030314131921.GG29631@parcelfarce.linux.theplanet.co.uk> <20030314150549.3cb2e2b2.vincentl@ec-lyon.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030314150549.3cb2e2b2.vincentl@ec-lyon.fr>
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

On Fri, Mar 14, 2003 at 03:05:49PM +0100, Lyonel Vincent wrote:
> okokok I won't argue then.
> I would have liked to have ioscan-like support, but anyway...

Well, you can have it in 2.5; start looking at sysfs.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
