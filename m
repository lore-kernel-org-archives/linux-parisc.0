Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F6AA482D
	for <parisc-linux@parisc-linux.org>; Fri, 20 Jun 2003 06:14:16 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19TKmV-0000Ze-KE; Fri, 20 Jun 2003 13:14:15 +0100
Date: Fri, 20 Jun 2003 13:14:15 +0100
From: Matthew Wilcox <willy@debian.org>
To: Thibaut =?iso-8859-1?Q?VAR=C8NE?= <varenet@esiee.fr>
Cc: parisc-linux@parisc-linux.org, Laurent CANET <canetl@esiee.fr>,
	Thierry SIMONNET <simonnet@esiee.fr>
Subject: Re: [parisc-linux] KGDB Port first patch release
Message-ID: <20030620121415.GQ24357@parcelfarce.linux.theplanet.co.uk>
References: <5B78941A-A314-11D7-A94E-0030656F07A2@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <5B78941A-A314-11D7-A94E-0030656F07A2@esiee.fr>
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

On Fri, Jun 20, 2003 at 01:43:05PM +0200, Thibaut VARÈNE wrote:
> The patch also adds a "Compile kernel with frame pointer option" and 
> takes care of removing lifimage (created by "make palo") on "make 
> clean".
> Maybe we want one or both changes to be committed upstream, any thought 
> ?

Those two sound generally useful; send patches!

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
