Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63117482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 Mar 2001 02:38:15 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA32585
	for <parisc-linux@puffin.external.hp.com>; Wed, 28 Mar 2001 02:32:40 -0700
Received: from pc117-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.117)
  by mailserv2.iuinc.com with SMTP; 28 Mar 2001 09:38:11 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id BC61BB007; Wed, 28 Mar 2001 10:38:01 +0100 (BST)
Date: Wed, 28 Mar 2001 10:38:01 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Markus Werle <markus@lufmech.rwth-aachen.de>
Cc: Jane Vinet <jvinet@linuxcare.com>,
	parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] a new (and free) C++ compiler for hppa!
Message-ID: <20010328103801.G30046@linuxcare.com>
References: <3A75766A.CF9A3C23@lufmech.rwth-aachen.de> <3A757FB9.6DCD3A91@linuxcare.com> <3A757F68.1833548@lufmech.rwth-aachen.de> <3AC1A3C9.F94899D6@lufmech.rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AC1A3C9.F94899D6@lufmech.rwth-aachen.de>; from markus@lufmech.rwth-aachen.de on Wed, Mar 28, 2001 at 10:41:45AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 28, 2001 at 10:41:45AM +0200, Markus Werle wrote:
> > cvs -d :pserver:anonymous@puffin.external.hp.com:/home/cvs/parisccv login
> anonymous
> (Logging in to anonymous@puffin.external.hp.com)
> CVS password:
> cvs login: authorization failed: server puffin.external.hp.com rejected
> access to /home/cvs/parisccv for user anonymous

A simple

cvs -d :pserver:anonymous@puffin.external.hp.com:/home/cvs/parisc co gcc

works for me.  Don't know where you got the 'parisccv' part of your
command line from.

[rhirst@rhirst rhirst]$ cvs --version

Concurrent Versions System (CVS) 1.10.7 (client/server)

Copyright (c) 1989-1998 Brian Berliner, david d `zoo' zuhn, 
                        Jeff Polk, and other authors

CVS may be copied only under the terms of the GNU General Public License,
a copy of which can be found with the CVS distribution kit.

Specify the --help option for further information about CVS


Richard
