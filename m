Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6CB5A482D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Jun 2001 10:57:58 -0600 (MDT)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by palrel1.hp.com (Postfix) with ESMTP id A5002ADB
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Jun 2001 09:58:03 -0700 (PDT)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.3 (PHNE_22672)/8.9.3 SMKit7.01) with ESMTP id KAA06588
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Jun 2001 10:52:55 -0600 (MDT)
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PALO/kernel-build change proposal 
In-Reply-To: Your message of "Wed, 13 Jun 2001 15:22:10 MDT."
             <200106132122.PAA01189@puffin.external.hp.com>
References: <200106132122.PAA01189@puffin.external.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 15 Jun 2001 10:52:55 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15Awq7-0000kt-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= > I propose that 'make palo' be changed to simply run 'palo -f ./palo.conf'
= > after vmlinux is built.  This means palo would have to be in the $PATH
= > and that the top-level linux source directory would contain a
= > suitable palo.conf file.  I've been using this model for cross-compiling
= > for several months and like it.  I would document how xc-ers can best
= > compile and "install" palo as well as supply a palo.conf file with
= > our typical configurations.
= > 
= > What is 'make palo' today would be changed to 'make buildrunpalo'.  The
= > longer name is more truthful and less convenient on purpose.
= 
= 
= How about "make lifimage"?
= That's the only reason I run "make palo" in the XC environment.
= Having a XC-palo in the environment is no problem.
= In the XC env, I don't expect "make install" to do the right thing (tm).

ok, I ammend my proposal so that what I just described as 'make palo' be
changed to 'make lifimage', and that what I just called 'make buildrunpalo',
which jumps into the source tree and builds palo among other things, retain
the name buildrunpalo.  Howzzat?
