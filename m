Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6A59483D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Apr 2003 07:41:49 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 197F4l-00072D-I2; Sun, 20 Apr 2003 14:41:47 +0100
Date: Sun, 20 Apr 2003 14:41:47 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] floating point calling convention on pa
Message-ID: <20030420134147.GB7427@parcelfarce.linux.theplanet.co.uk>
References: <20030420011256.GC25257@tausq.org> <200304200149.h3K1njWm004550@hiauly1.hia.nrc.ca> <20030420064031.GD25257@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030420064031.GD25257@tausq.org>
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

On Sat, Apr 19, 2003 at 11:40:31PM -0700, Randolph Chung wrote:
> static int floating(int a, float b, double c, long double d, int e)
> 
> i would have guessed this mapped to:
> 
> a -> gr26   (sp-36)
> b -> fr4L   (sp-40)
> c -> fr7    (sp-48)
> d -> sp-56
> e -> sp-64
> 
> but according to gcc, e is at sp-60.

ehm.. looks like -60 to me.  Here:

a gets bytes 33-36 (4 bytes)
b gets bytes 37-40 (4 bytes)
c gets bytes 41-48 (8 bytes)
d gets bytes 49-56 (8 bytes)
e gets bytes 57-60 (4 bytes)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
